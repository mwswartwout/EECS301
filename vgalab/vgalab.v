module vgalab(clk50MHz, button1, button0, redPixels, greenPixels, bluePixels, clk9MHz, hSync, vSync, disp);

input wire clk50MHz, button1, button0;														// inputs

wire hSync, vSync, hData, vData;																// pulses that tell the LCD pixel pointer when to horizontally or vertically reset the pointer
wire [3:0] characterAddress;																	// counter that determines which character to display
wire [24:0]	characterPixels;																	// output from ROM that contains pixel data (0 = black, 1 = white)
wire clk3Hz;																						// clk for gathering user input (on rising edge)
wire [9:0] vgaCount;
wire [8:0] lineCount;

output wire [7:0] redPixels, greenPixels, bluePixels;
output wire clk9MHz, hSync, vSync, disp;	

syncPulses		syncPulses(clk9MHz, hSync, vSync, hData, vData, clk3Hz, disp);   		// controls: the clocks that determine overall timing
altpll0			PLL(clk50MHz, clk9MHz);                     							// generates: 9 MHz clock
userInput 		userInput(button1, button0, characterAddress, clk3Hz);			// controls: the user input
characterROM	characterROM(characterAddress, clk9MHz, characterPixels);		// ROM that contains pixel data for the 13 different characters
pixelOutput		pixelOutput(clk9MHz, characterPixels, redPixels, greenPixels, bluePixels, vgaCount, lineCount);
	
endmodule
