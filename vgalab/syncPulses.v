module syncPulses(clk9MHz, hSync, vSync, hData, vData, clk3Hz);

input clk9MHz;          

integer vgaCount, lineCount, vcount, hzcount;
reg hData, vData;			// horizontal data enable, vertical data enable
//reg start;					// to output 10 black frames at the start

output reg hSync, vSync;    	// 640 clk9MHz to 1 hSync, 480 hSync to 1 vSync
										// OR, timing diagram says 
														// 41+484 clk9MHz to 1 hSync
														// 10+276 hSync to 1 vSync
output hData, vData;		// enable signals for data transfer
output reg clk3Hz;		// character change clock 3 Hz

				
initial
	begin	
		hSync = 0;
		vSync = 0;
		hData  = 0;
		vData  = 0;
		vgaCount = 0;
		lineCount   = 0;
		hzcount = 0;
		clk3Hz  = 0;
	end

	
always @(posedge clk9MHz)
	begin
		// vgaCount counts clock cycles and controls hSync pulses, vgaCount can also be used to determine the horizontal location of the pixel being set
		vgaCount = vgaCount + 1;
		if (vgaCount == 0)
			hSync = 0;
		if (vgaCount == 41)
			hSync = 1;
		if (vgaCount == 43)
			hData = 1;
		if (vgaCount == 523)		// TODO: figure out if this is 523 or 524, in timing diagram it looks like data must be held until rising edge of next cycle
			hData = 0;
		if (vgaCount == 525)					// if vga reaches its cycle
			begin	
				vgaCount = 0;						// reset vgaCount
				hSync = 0;				// invert hSync
				lineCount = lineCount + 1;				// increment lineCount
			end
		
		// lineCount controls vSync
		if (lineCount == 0)
			vSync = 0;
		if (lineCount == 10)
			vSync = 1;
		if (lineCount == 12)
			vData = 1;
		if (lineCount == 284)		// TODO: figure out if this is 284 or 285, in timing diagram it looks like data must be held until rising edge of next cycle
			vData = 0;
		if (lineCount == 286)
			begin	
				lineCount = 0;
				vSync = 0;
			end
			
		/* I can't see why this is necessary
		if (vcount == 10) 		// hard reset everything but "start"
			begin	
				hSync = 0;
				vSync = 0;
				hData  = 0;
				vData  = 0;
				vgaCount = 0;
				lineCount   = 0;
				vcount   = 0;	
				hzcount = 0;
				clk3Hz  = 0;
			end
		*/
		
		// clock for user input
		hzcount = hzcount + 1;
		if (hzcount == 4000000)
			begin	
				clk3Hz = ~clk3Hz;
				hzcount = 0;
			end
			
	end
	

endmodule
