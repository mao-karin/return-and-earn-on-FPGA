/*************************************************************
Design Name 	: bh_to_bcd
File Name   	: bh_to_bcd.v
Function    	: 8-bit binary/hexadecimal to binary-coded decimal converter
programmer    	: 
Last Modified	: 07-12-2015
*************************************************************/

module bh_to_bcd(
	//----------------Input ports------------------------------
		input wire[11:0] binary,
	//----------------Output ports-----------------------------
		output reg[3:0] hundreds,
		output reg[3:0] tens,
		output reg[3:0] ones);

	integer i;

	always @(binary) begin
		// set 100's, 10's, and 1's to zero
		hundreds = 4'd0;
		tens = 4'd0;
		ones = 4'd0;
			
		for (i = 11; i >= 0; i = i - 1) begin
			// add 3 to columns >= 5
			if (hundreds >= 5)
            hundreds = hundreds + 3;
			if (tens >= 5)
				tens = tens + 3;
			if (ones >= 5)
				ones = ones + 3;
			
			// shift left one
			hundreds = hundreds << 1;
			hundreds[0] = tens[3];
			tens = tens << 1;
			tens[0] = ones[3];
			ones = ones << 1;
			ones[0] = binary[i];
		end
	end
	
endmodule
