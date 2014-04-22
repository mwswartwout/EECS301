module vgalab(clk50mhz);

input clk50mhz;
wire vgaclk;
reg hsync, vsync;

cloking cloking(clk50mhz, vgaclk, hsync, vsync);                    		// controls the clocks that determine timing
altpll0 altpll0(clk50mhz, vgaclk);                     						// generates 25.175 MHz clock


endmodule
