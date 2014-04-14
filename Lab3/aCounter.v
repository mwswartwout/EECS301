module aCounter(validS0, validS1, motorspeed, faEnable, aCount);

input faEnable, validS0, validS1; 
input signed [7:0] motorspeed;
output reg [7:0] aCount;

initial
	begin
		aCount = 8'b00000000;     // (20000+20)/2 <- new values
	end	


/** this logic depends on whether or not verilog can compare different # bit values 
		8 bit vs 15 bit   */		
// imnplement boundary control (0-255)
always @ (posedge faEnable) //Need to slow this down
	begin							
		if (validS1)
			begin
				if (aCount >= 8'b00000000 && aCount <= 8'b11111111)
				//	 if	   aCount > 1				and       aCount < 255
					begin
					if (motorspeed[7] && aCount != 8'b00000000)      // if motorspeed is negative and not equal to 0
						aCount = aCount - 8'b00000001;			// subtract 1 from aCount
					else if (motorspeed > 8'b00000000 && aCount != 8'b11111111)	// if motorspeed is positive and not equal to 255
						aCount = aCount + 8'b00000001;			// add 1 to aCount
				end
		end
	end
	
endmodule
