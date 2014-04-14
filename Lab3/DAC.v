module DAC(gainedOut, serialClock, ldac, dIn, out_valid, syncDAC, syncNCO);

input [11:0] gainedOut;
input serialClock, out_valid, syncNCO;
reg powerUp; 
input syncDAC;
integer count;
output reg ldac, dIn;

initial
	begin
		ldac = 0;
		count = 0;
		dIn = 0;
		powerUp = 0;
	end
	
always @(posedge serialClock)
	begin
	if (~syncDAC)
		begin
			if (~powerUp)
				begin
					if (count < 3)
						dIn = 0;
						
					else if (count < 4)
						dIn = 0;
				
					else if (count < 5)
						dIn = 1;
					
					else if (count < 31)
						dIn = 0;
						
					else if (count == 31)
						begin
							count = 0;
							powerUp = 1;
						end
				end
		
		else
			begin
				if (out_valid)
					begin
						if (count < 3)
							dIn = 0;
							
						else if (count < 5)
							dIn = 0;
						
						else if (count < 6)
							dIn = 1;
						
						else if (count < 11)
							dIn = 0;
							
						else if (count < 12)
							dIn = gainedOut[11];
							
						else if (count < 13)
							dIn = gainedOut[10];
							
						else if (count < 14)
							dIn = gainedOut[9];
							
						else if (count < 15)
							dIn = gainedOut[8];
							
						else if (count < 16)
							dIn = gainedOut[7];
							
						else if (count < 17)
							dIn = gainedOut[6];
							
						else if (count < 18)
							dIn = gainedOut[5];
							
						else if (count < 19)
							dIn = gainedOut[4];
							
						else if (count < 20)
							dIn = gainedOut[3];
							
						else if (count < 21)
							dIn = gainedOut[2];
							
						else if (count < 22)
							dIn = gainedOut[1];
							
						else if (count < 23)
							dIn = gainedOut[0];
							
						else if (count < 30)
							dIn = 0;
							
				end
			end
		count = count + 1;
		end
		
	if (syncNCO)
		count = 0;
	end
				
								
endmodule