module syncPulses(clk9MHz, hSync, vSync, disp, vgaCount, lineCount, start);

input clk9MHz;          

//integer vcount;
output reg [9:0] vgaCount;
output reg [8:0] lineCount;
reg hData, vData;			// horizontal data enable, vertical data enable
integer startCount;					// to output 10 black frames at the start

output reg hSync, vSync;    	// 640 clk9MHz to 1 hSync, 480 hSync to 1 vSync
										// OR, timing diagram says 
														// 41+484 clk9MHz to 1 hSync
														// 10+276 hSync to 1 vSync
														
output reg disp, start;		// character change clock 3 Hz

				
initial
	begin	
		hSync = 0;
		vSync = 1;
		vgaCount	= 0;
		lineCount = 0;
		disp = 0;
		start = 0;
		startCount = 0;
	end

	
always @(posedge clk9MHz)
	begin
		if (~start)
			begin
				disp = 1;
				vSync = 0;
				startCount = startCount + 1;
				
				if (startCount == 9)
					start = 1;
			end
		
		else if (start)
			begin
				// vgaCount counts clock cycles and controls hSync pulses, vgaCount can also be used to determine the horizontal location of the pixel being set
				vgaCount = vgaCount + 10'b0000000001;
				if (vgaCount == 0)
					hSync = 0;
				if (vgaCount == 41)
					hSync = 1;
				if (vgaCount == 525)					// if vga reaches its cycle
					begin	
						vgaCount = 0;						// reset vgaCount
						hSync = 0;				// invert hSync
						lineCount = lineCount + 9'b000000001;				// increment lineCount
					end
				
				// lineCount controls vSync
				if (lineCount == 0)
					vSync = 0;
				if (lineCount == 10)
					vSync = 1;
				if (lineCount == 286)
					begin	
						lineCount = 0;
						vSync = 0;
					end
			end	
	end

endmodule
