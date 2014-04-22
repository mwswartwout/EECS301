module cloking(clk50mhz, vgaclk, hsync, vsync, hden, vden);

input clk50mhz;         // PIN_G21
input vgaclk;          

integer vgaCount, hcount, vcount;
reg hden, vden;			// horizontal data enable, vertical data enable

output reg hsync, vsync;    	// 640 vgaclk to 1 hsync, 480 hsync to 1 vsync
										// OR, timing diagram says 
														// 41+484 vgaclk to 1 hsync
														// 10+276 hsync to 1 vsync
output hden, vden;		// enable signals for data transfer
				
initial
	begin	
		hsync = 0;
		vsync = 0;
		hden  = 0;
		vden  = 0;
		vgaCount = 0;
		hcount   = 0;
		vcount   = 0;	// TODO: determine if vcount is needed
	end
				
always @(posedge vgaclk)
	begin
		// vgacounter and hsync controller
		vgaCount = vgaCount + 1;
		if (vgaCount == 0)
			hsync = 0;
		if (vgaCount == 41)
			hsync = 1;
		if (vgaCount == 43)
			hden = 1;
		if (vgaCount == 523)		// TODO: figure out if this is 523 or 524, in timing diagram it looks like data must be held until rising edge of next cycle
			hden = 0;
		if (vgaCount == 525)					// if vga reaches its cycle
			begin	
				vgaCount = 0;						// reset vgaCount
				hsync = ~hsync;					// invert hsync
				hcount = hcount + 1;				// increment hcount
			end
		
		// hcounter and vsync controller
		if (hcount == 0)
			vsync = 0;
		if (hcount == 10)
			vsync = 1;
		if (hcount == 12)
			vden = 1;
		if (hcount == 284)		// TODO: figure out if this is 284 or 285, in timing diagram it looks like data must be held until rising edge of next cycle
			vden = 0;
		if (hcount == 286)
			begin	
				hcount = 0;
				vsync = ~vsync;
				vcount = vcount + 1;
			end
	end
	

endmodule
