/*************************************************************
Design Name 	: bcd_to_7_segment
File Name   	: bcd_to_7_segment.v
Function    	: binary-coded decimal to 7 segment display(common anode) converter
programmer    	: 
Last Modified	: 07-12-2015
*************************************************************/

module bcd_to_7_segment(
	//----------------Input ports------------------------------
		input wire[3:0] hundreds,
		input wire[3:0] tens,
		input wire[3:0] ones,
	//----------------Output ports-----------------------------
		output reg[6:0] display_0,
		output reg[6:0] display_1,
		output reg[6:0] display_2);

	always @(hundreds or tens or ones) begin
		case(ones)
			4'h0 : display_0 <= 7'b1000000; //to display 0
			4'h1 : display_0 <= 7'b1111001; //to display 1
			4'h2 : display_0 <= 7'b0100100; //to display 2
			4'h3 : display_0 <= 7'b0110000; //to display 3
			4'h4 : display_0 <= 7'b0011001; //to display 4
			4'h5 : display_0 <= 7'b0010010; //to display 5
			4'h6 : display_0 <= 7'b0000010; //to display 6
			4'h7 : display_0 <= 7'b1111000; //to display 7
			4'h8 : display_0 <= 7'b0000000; //to display 8
			4'h9 : display_0 <= 7'b0010000; //to display 9
			default : display_0 <= 7'b0111111; //to display -
		endcase
		
		case(tens)
			4'h0 : display_1 <= 7'b1000000; //to display 0
			4'h1 : display_1 <= 7'b1111001; //to display 1
			4'h2 : display_1 <= 7'b0100100; //to display 2
			4'h3 : display_1 <= 7'b0110000; //to display 3
			4'h4 : display_1 <= 7'b0011001; //to display 4
			4'h5 : display_1 <= 7'b0010010; //to display 5
			4'h6 : display_1 <= 7'b0000010; //to display 6
			4'h7 : display_1 <= 7'b1111000; //to display 7
			4'h8 : display_1 <= 7'b0000000; //to display 8
			4'h9 : display_1 <= 7'b0010000; //to display 9
			default : display_1 <= 7'b0111111; //to display -
		endcase
		
		case(hundreds)
			4'h0 : display_2 <= 7'b1000000; //to display 0
			4'h1 : display_2 <= 7'b1111001; //to display 1
			4'h2 : display_2 <= 7'b0100100; //to display 2
			4'h3 : display_2 <= 7'b0110000; //to display 3
			4'h4 : display_2 <= 7'b0011001; //to display 4
			4'h5 : display_2 <= 7'b0010010; //to display 5
			4'h6 : display_2 <= 7'b0000010; //to display 6
			4'h7 : display_2 <= 7'b1111000; //to display 7
			4'h8 : display_2 <= 7'b0000000; //to display 8
			4'h9 : display_2 <= 7'b0010000; //to display 9
			default : display_2 <= 7'b0111111; //to display -
		endcase
	end
	
endmodule
