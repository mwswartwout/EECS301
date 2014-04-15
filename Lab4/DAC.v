module DAC(adcDataOutPackage, dacSerialClock, ldac, dIn, syncDAC);

input [7:0] adcDataOutPackage;
input dacSerialClock, syncDAC;

reg powerUp; 
integer count;

output reg ldac, dIn;

initial
	begin
		ldac = 0;
		count = 0;
		dIn = 0;
		powerUp = 0;
	end
	
always @(posedge dacSerialClock)
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
						if (count < 3)
							dIn = 0;
							
						else if (count < 5)
							dIn = 0;
						
						else if (count < 6)
							dIn = 1;
						
						else if (count < 11)
							dIn = 0;
							
						else if (count < 12)
							dIn = 0;
							
						else if (count < 13)
							dIn = 0;
							
						else if (count < 14)
							dIn = 0;
							
						else if (count < 15)
							dIn = 0;
							
						else if (count < 16)
							dIn = adcDataOutPackage[7];
							
						else if (count < 17)
							dIn = adcDataOutPackage[6];
							
						else if (count < 18)
							dIn = adcDataOutPackage[5];
							
						else if (count < 19)
							dIn = adcDataOutPackage[4];
							
						else if (count < 20)
							dIn = adcDataOutPackage[3];
							
						else if (count < 21)
							dIn = adcDataOutPackage[2];
							
						else if (count < 22)
							dIn = adcDataOutPackage[1];
							
						else if (count < 23)
							dIn = adcDataOutPackage[0];
							
						else if (count < 30)
							dIn = 0;
			end
		count = count + 1;
		
		end
		
		else if (syncDAC)
			count = 0;
	end							
endmodule