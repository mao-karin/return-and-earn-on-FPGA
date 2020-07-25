/*************************************************************
Design Name 	: ulta_sonic_sensor
File Name   	: ulta_sonic_sensor.v
Function    	: ulta sonic sensor using 50MHz clock
programmer    	: 
Last Modified	: 14-12-2015
*************************************************************/

module ulta_sonic_sensor(
	//----------------Input ports------------------------------
		input wire clk,
		input wire echo,
		input wire rst,
	//----------------Output ports-----------------------------
		output wire[11:0] distance_out,
		output reg trig);

//-------------------Internal Signals-------------------------	
	integer echo_start; 
	integer counter;
	integer elapsed;										//echo pulse width calculator
	
//-------------------Counter----------------------------------
	always @(posedge clk) begin
		if(rst)
			counter <= 0;
		else
			counter <= counter + 1;
	end

//-------------------Execution--------------------------------
	//----------------Triger ON/OFF----------------------------
	always @(counter) begin
		if(counter < 500)
			trig = 1'b1;									//Triger starts after reset is zero
		else
			trig = 1'b0;									//after 10 usec, trig is set to zero and the ultrasonic bursts begin
	end	
	
	//-----------------Timing Echo ON/OFF----------------------
	always @(posedge echo)	begin	   //if echo pin is high
		echo_start = counter;      	//counter value at that time is stored in echo_start_time
	end
	
	always @(negedge echo) begin			//when echo pulse becomes low,
		elapsed = counter - echo_start;	//elasped calculates the echo pulse width
	end
	
	//----------------Distance Calculation---------------------
	assign distance_out = elapsed / 2847;   //Distance calculation in cm
	
endmodule
