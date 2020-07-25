module LCD1(
  input CLOCK_50,	//	50 MHz clock
  input[3:0] hundreds,
  input[3:0] tens,
  input[3:0] ones,
  input[3:0] hundreds_250,
  input[3:0] tens_250,
  input[3:0] ones_250,
  input[3:0] hundreds_500,
  input[3:0] tens_500,
  input[3:0] ones_500,
  input rst,
  input done,
  input error,
//	LCD Module 16X2
  output LCD_ON,	// LCD Power ON/OFF
  output LCD_BLON,	// LCD Back Light ON/OFF
  output LCD_RW,	// LCD Read/Write Select, 0 = Write, 1 = Read
  output LCD_EN,	// LCD Enable
  output LCD_RS,	// LCD Command/Data Select, 0 = Command, 1 = Data
  output [7:0] LCD_DATA	// LCD Data bus 8 bits
);



// reset delay gives some time for peripherals to initialize
wire DLY_RST;


// turn LCD ON
assign	LCD_ON		=	1'b1;
assign	LCD_BLON	=	1'b1;

Reset_Delay r1(
	.iCLK(CLOCK_50),
	.oRESET(DLY_RST)
);

LCD_TEST_1 u1(
// Host Side
   .iCLK(CLOCK_50),
   .iRST_N(DLY_RST),
	.hundreds(hundreds),
	.tens(tens),
	.ones(ones),
	.hundreds_250(hundreds_250),
	.tens_250(tens_250),
	.ones_250(ones_250),
	.hundreds_500(hundreds_500),
	.tens_500(tens_500),
	.ones_500(ones_500),
	.rst(rst),
	.done(done),
	.error(error),
// LCD Side
   .LCD_DATA(LCD_DATA),
   .LCD_RW(LCD_RW),
   .LCD_EN(LCD_EN),
   .LCD_RS(LCD_RS)
);
endmodule
