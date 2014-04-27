module vgalab(clk50mhz, button1, button0);

input clk50mhz, button1, button0;
wire vgaclk;
wire hsync, vsync;
wire [3:0] inCount;
wire clk3Hz;

cloking cloking(clk50mhz, vgaclk, hsync, vsync);                    		// controls the clocks that determine timing
altpll0 altpll0(clk50mhz, vgaclk);                     						// generates 25.175 MHz clock
userInput userInput(button1, button0, inCount, clk3Hz);						// controls the user input

endmodule
