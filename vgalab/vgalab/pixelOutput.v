module pixelOutput(enable, inCount, vgaclk, hsync, vsync, hden, vden);

// per value of count, have hard coded patterns that output into the vga

// 10 black frames on startup determined by startUp() module;


/*
example of what we want to output to lcd
	0: {
			11100000...00 - hsync 
			10100000...00 - hsync
			11100000...00 - hsync
			...
			hsync	
	}
*/
 
// want to make the output data variable on solely inCount. clock stuff should be handled internal to the module.
 
endmodule
