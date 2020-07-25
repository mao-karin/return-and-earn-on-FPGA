/*************************************************************
Design Name 	: bottle_counter
File Name   	: bottle_counter.v
Function    	: Counts type and number of bottles inserted
programmer    	: 
Last Modified	: 14-11-2015
*************************************************************/

module bottle_counter(
	//----------------inputs-----------------------------------
		input wire[11:0] distance_out,
		input wire done,
		inout wire rst,
	//----------------OUtputs----------------------------------
		output reg[11:0] bottle_250ml_counter,
		output reg[11:0] bottle_500ml_counter,
		output reg[11:0] bottle_1250ml_counter,
		output reg error);
	
	
//-------------------Counter bottle type----------------------
	always @(negedge done or posedge rst) begin
		if(!done) begin
			bottle_250ml_counter = 12'b0;
			bottle_500ml_counter = 12'b0;
			bottle_1250ml_counter = 12'b0;
			error = 1'b0;
		end
		
		else begin
			if(distance_out > 12'd39 && distance_out < 12'd45) begin
				bottle_250ml_counter = bottle_250ml_counter + 12'd1;
				error = 1'b0;
			end
			
			else if(distance_out > 12'd15 && distance_out < 12'd25) begin
				bottle_500ml_counter = bottle_500ml_counter + 12'd1;
				error = 1'b0;
			end
			
			else if(distance_out > 12'd10 && distance_out < 12'd15) begin
				bottle_1250ml_counter = bottle_1250ml_counter + 12'd1;
				error = 1'b0;
			end
			else
				error = 1'b1;
			
		end
	end
	
endmodule
