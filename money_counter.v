/*************************************************************
Design Name 	: money_counter
File Name   	: money_counter.v
Function    	: Calculates money to be dispansed
programmer    	: 
Last Modified	: 14-11-2015
*************************************************************/

module money_counter(
	//----------------inputs-----------------------------------
		input wire[11:0] bottle_250ml_counter,
		input wire[11:0] bottle_500ml_counter,
		input wire[11:0] bottle_1250ml_counter,
	//----------------outputs----------------------------------
		output wire[11:0] money_out);
	
//-------------------internal signals-------------------------
	reg[11:0] money_250ml_counter;
	reg[11:0] money_500ml_counter;
	reg[11:0] money_1250ml_counter;
	
//-------------------execution--------------------------------
	always @(bottle_250ml_counter) begin
		money_250ml_counter = bottle_250ml_counter * 1;
	end
	
	always @(bottle_500ml_counter) begin
		money_500ml_counter = bottle_500ml_counter * 2;
	end
	
	always @(bottle_1250ml_counter) begin
		money_1250ml_counter = bottle_1250ml_counter * 3;
	end
	
	assign money_out = money_250ml_counter + money_500ml_counter + money_1250ml_counter;
	
endmodule
