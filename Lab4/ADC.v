module ADC(adcSerialClock, syncADC, adcDataOut, adcDataOutPackage, adcDataIn);

input adcSerialClock, syncADC, adcDataOut;

integer count;

output [7:0] adcDataOutPackage;
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
			end
		
		if (syncADC)
			count = 0;
	end	
endmodule 