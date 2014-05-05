module vgalab(clk50mhz, button1, button0);

input clk50mhz, button1, button0;															// inputs
wire vgaclk;																						// 9 MHz clock that the LCD gathers data with
wire hsync, vsync;																				// pulses that tell the LCD pixel pointer when to horizontally or vertically reset the pointer
wire [3:0] inCount;																				// counter that determines which character to display
wire clk3Hz;																						// clk for gathering user input (on rising edge)
wire enable;																						// enable for all data (hi after 10 black frames)
// output wire vcc, avdd, disp, lcdDisp;					/** NOT SURE WHAT TO DO HERE */

cloking 		cloking(clk50mhz, vgaclk, hsync, vsync, hden, vden, clk3Hz);    		// controls: the clocks that determine overall timing
altpll0 		altpll0(clk50mhz, vgaclk);                     								// generates: 9 MHz clock
startUp 		startUp(vcc, avdd, clk50mhz, vgaclk, disp, lcdDisp, enable);			// powers up: the LCD display properly
userInput 	userInput(button1, button0, inCount, clk3Hz);								// controls: the user input
pixelOutput pixelOutput(enable, inCount, vgaclk, hsync, vsync, hden, vden);		// controls: placing the pixels to the right place at the right time


endmodule
