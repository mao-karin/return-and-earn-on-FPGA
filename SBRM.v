/*************************************************************
Design Name 	: reverse_vending_machine
File Name   	: reverse_vending_machine.v
Function    	: reverse vending machine for plastic bottle recycling
programmer    	: 
Last Modified	: 14-11-2015
*************************************************************/

module SBRM(
	//----------------Input ports-------------------------------
		input wire clk,
		input wire echo,
		input wire rst,
		input wire done,
	//----------------Output ports-----------------------------
		output wire trig,
		output wire[6:0] Hex_1,
		output wire[6:0] Hex_2,
		output wire[6:0] Hex_3,
		output wire[6:0] Hex_4,
		output wire[6:0] Hex_5,
		output wire[6:0] Hex_6,
		output wire[11:0] bottle_250ml_counter,
		output wire[11:0] bottle_500ml_counter,
		output wire[11:0] bottle_1250ml_counter,
		output wire error,
		//	LCD Module 16X2
		output LCD_ON,	// LCD Power ON/OFF
		output LCD_BLON,	// LCD Back Light ON/OFF
		output LCD_RW,	// LCD Read/Write Select, 0 = Write, 1 = Read
		output LCD_EN,	// LCD Enable
		output LCD_RS,	// LCD Command/Data Select, 0 = Command, 1 = Data
		output [7:0] LCD_DATA	// LCD Data bus 8 bits
);

//-------------------Internal Signals-------------------------
	wire[11:0] distance_out;
	
	wire[11:0] money_out;
	wire[3:0] hundreds_250;
   wire[3:0] tens_250;
   wire[3:0] ones_250;
   wire[3:0] hundreds_500;
   wire[3:0] tens_500;
   wire[3:0] ones_500;
	wire[3:0] hundreds1;
	wire[3:0] tens1;
	wire[3:0] ones1;
	wire[3:0] hundreds2;
	wire[3:0] tens2;
	wire[3:0] ones2;
	
	
	
//-------------------modules----------------------------------
	ulta_sonic_sensor USS(
		//-------------Input ports------------------------------
			.clk(clk),
			.echo(echo),
			.rst(rst),
		//-------------Output ports-----------------------------
			.distance_out(distance_out),
			.trig(trig));

	bottle_counter BC(
		//-------------Input ports------------------------------
			.distance_out(distance_out),
			.done(done),
			.rst(rst),
		//-------------Output ports-----------------------------
			.bottle_250ml_counter(bottle_250ml_counter),
			.bottle_500ml_counter(bottle_500ml_counter),
			.bottle_1250ml_counter(bottle_1250ml_counter),
			.error(error));
	
	money_counter MC(
		//-------------Input ports------------------------------
			.bottle_250ml_counter(bottle_250ml_counter),
			.bottle_500ml_counter(bottle_500ml_counter),
			.bottle_1250ml_counter(bottle_1250ml_counter),
		//-------------Output ports-----------------------------
			.money_out(money_out));

	bh_to_bcd BHTBCD_250(
		//-------------Input ports------------------------------
			.binary(bottle_250ml_counter),
		//-------------Output ports-----------------------------
			.hundreds(hundreds_250),
			.tens(tens_250),
			.ones(ones_250));

	bh_to_bcd BHTBCD_500(
		//-------------Input ports------------------------------
			.binary(bottle_500ml_counter),
		//-------------Output ports-----------------------------
			.hundreds(hundreds_500),
			.tens(tens_500),
			.ones(ones_500));

	bh_to_bcd BHTBCD1(
		//-------------Input ports------------------------------
			.binary(distance_out),
		//-------------Output ports-----------------------------
			.hundreds(hundreds1),
			.tens(tens1),
			.ones(ones1));

	bh_to_bcd BHTBCD2(
		//-------------Input ports------------------------------
			.binary(money_out),
		//-------------Output ports-----------------------------
			.hundreds(hundreds2),
			.tens(tens2),
			.ones(ones2));
	
	bcd_to_7_segment BCDTSSD1(
		//----------------Input ports------------------------------
			.hundreds(hundreds1),
			.tens(tens1),
			.ones(ones1),
		//----------------Output ports-----------------------------
			.display_0(Hex_1),
			.display_1(Hex_2),
			.display_2(Hex_3));
	
	bcd_to_7_segment BCDTSSD2(
		//----------------Input ports------------------------------
			.hundreds(hundreds2),
			.tens(tens2),
			.ones(ones2),
		//----------------Output ports-----------------------------
			.display_0(Hex_4),
			.display_1(Hex_5),
			.display_2(Hex_6));

	LCD1 LCD_1(
			.CLOCK_50(clk),	//	50 MHz clock
			.hundreds(hundreds2),
			.tens(tens2),
			.ones(ones2),
			.hundreds_250(hundreds_250),
			.tens_250(tens_250),
			.ones_250(ones_250),
			.hundreds_500(hundreds_500),
			.tens_500(tens_500),
			.ones_500(ones_500),
			.rst(rst),
			.done(done),
			.error(error),
		//	LCD Module 16X2
			.LCD_ON(LCD_ON),	// LCD Power ON/OFF
			.LCD_BLON(LCD_BLON),	// LCD Back Light ON/OFF
			.LCD_RW(LCD_RW),	// LCD Read/Write Select, 0 = Write, 1 = Read
			.LCD_EN(LCD_EN),	// LCD Enable
			.LCD_RS(LCD_RS),	// LCD Command/Data Select, 0 = Command, 1 = Data
			.LCD_DATA(LCD_DATA)	// LCD Data bus 8 bits
);
endmodule
