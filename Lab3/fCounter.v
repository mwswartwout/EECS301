module fCounter(validS0, validS1, motorspeed, faEnable, fCount);

input faEnable, validS0, validS1;
input signed [7:0] motorspeed;
output reg [15:0] fCount;

//Need to make to make boundary controls for this go from 1- 655. Debug counting logic.
initial
	begin
		fCount = 16'b0000000110100011;		// (20000+20)/2 <- new values
	end


/** this logic depends on whether or not verilog can compare different # bit values 
		8 bit vs 15 bit   */		
// imnplement boundary control (20 Hz - 20 KHz) : (1 - 655)
always @ (posedge faEnable) //This clock may need to be slowed to allow for accurate changes in frequency
	begin				
		if (validS0)
			begin
				if (fCount >= 16'b0000000000000001 && fCount <= 16'b0000001101000111)
				//	 if	  fCount > 1				and      fCount < 655
					begin
						if (motorspeed >= 8'sb00000001 && fCount != 16'b0000001101000111)       // if motorspeed is positive
							begin
								fCount = fCount + 16'b0000000000000001;			// add 1 to fCount
							end
						else if (motorspeed < 8'sb00000000 && fCount != 16'b0000000000000001)	// if motorspeed is negative
							begin
								fCount = fCount - 16'b0000000000000001;			// subtract 1 fromffCount
							end
					end
			end
	end

	
endmodule