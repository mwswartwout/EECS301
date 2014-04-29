// order of things to turn on
/*		vcc											
			avdd										change lo-hi : 0.5 ms
				ck															50 ms after VCC is high
				hsync
				vsync
				data
					disp 													0.5 ms after ck hi (make sure vsync is high when switching disp from low to hi)
						lcd display
					
*/

// enable goes from low to high when it is ok to input data (see SHARP LCM- 05042pg 9 of 23)

module startUp(vcc, avdd, clk50mhz, vgaclk, disp, lcdDisp, enable);

input clk50mhz, vgaclk;
input wire vcc, avdd, disp, lcdDisp;

output wire vcc, avdd, disp, lcdDisp, enable;


// TODO: implement logic and timing of when to turn on vcc, avdd...etc.


endmodule
