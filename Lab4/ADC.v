module ADC(adcSerialClock, syncADC, adcDataOut, adcDataOutPackage, adcDataIn);

input adcSerialClock, syncADC, adcDataOut;

integer count;

output reg [7:0] adcDataOutPackage;
output reg adcDataIn;

initial
	begin
		count = 0;
		adcDataIn = 0;
	end

always @(posedge adcSerialClock)
	begin
		if (~syncADC)
			begin
				count = count + 1;
				
				//Control block for writing to adcDataIn
				if (count < 1)
					adcDataIn = 1;
				else if (count < 6)
					adcDataIn = 0;
				else if (count < 8)
					adcDataIn = 1;
				else if (count < 11)
					adcDataIn = 0;
				else if (count < 12)
					adcDataIn = 1;
					
				//Control block for reading from adcDataOut and packaging into adcDataOutPackage
				if (count == 4)
					adcDataOutPackage[7] = adcDataOut;
				else if (count == 5)
					adcDataOutPackage[6] = adcDataOut;
				else if (count == 6)
					adcDataOutPackage[5] = adcDataOut;
				else if (count == 7)
					adcDataOutPackage[4] = adcDataOut;
				else if (count == 8)
					adcDataOutPackage[3] = adcDataOut;
				else if (count == 9)
					adcDataOutPackage[2] = adcDataOut;
				else if (count == 10)
					adcDataOutPackage[1] = adcDataOut;
				else if (count == 11)
					adcDataOutPackage[0] = adcDataOut;
			end
		
		if (syncADC)
			count = 0;
	end	
endmodule 