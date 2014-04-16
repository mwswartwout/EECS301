module DAC(adcDataOutPackage, dacSerialClock, ldac, dacDataIn, syncDAC);

input [11:0] adcDataOutPackage;
input dacSerialClock, syncDAC;

reg powerUp; 
integer count;

output reg ldac, dacDataIn;

initial
	begin
		ldac = 0;
		count = 0;
		dacDataIn = 0;
		powerUp = 0;
	end
	
always @(posedge dacSerialClock)
	begin
	if (~syncDAC)
		begin
			if (~powerUp)
				begin
					if (count < 3)
						dacDataIn = 0;
						
					else if (count < 4)
						dacDataIn = 0;
				
					else if (count < 5)
						dacDataIn = 1;
					
					else if (count < 31)
						dacDataIn = 0;
						
					else if (count == 31)
						begin
							count = 0;
							powerUp = 1;
						end
				end
		
		else
			begin
						if (count < 3)
							dacDataIn = 0;
							
						else if (count < 5)
							dacDataIn = 0;
						
						else if (count < 6)
							dacDataIn = 1;
						
						else if (count < 11)
							dacDataIn = 0;
							
						else if (count < 12)
							dacDataIn = 0;
							
						else if (count < 13)
							dacDataIn = 0;
							
						else if (count < 14)
							dacDataIn = 0;
							
						else if (count < 15)
							dacDataIn = 0;
							
						else if (count < 16)
							dacDataIn = adcDataOutPackage[11];
							
						else if (count < 17)
							dacDataIn = adcDataOutPackage[10];
							
						else if (count < 18)
							dacDataIn = adcDataOutPackage[9];
							
						else if (count < 19)
							dacDataIn = adcDataOutPackage[8];
							
						else if (count < 20)
							dacDataIn = adcDataOutPackage[7];
							
						else if (count < 21)
							dacDataIn = adcDataOutPackage[6];
							
						else if (count < 22)
							dacDataIn = adcDataOutPackage[5];
							
						else if (count < 23)
							dacDataIn = adcDataOutPackage[4];
							
						else if (count < 24)
							dacDataIn = adcDataOutPackage[3];
							
						else if (count < 25)
							dacDataIn = adcDataOutPackage[2];
							
						else if (count < 26)
							dacDataIn = adcDataOutPackage[1];
							
						else if (count < 27)
							dacDataIn = adcDataOutPackage[0];
							
						else if (count < 31)
							dacDataIn = 0;
			end
		count = count + 1;
		
		end
		
		else if (syncDAC)
			count = 0;
	end							
endmodule