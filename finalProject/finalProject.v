module finalProject(fpgaClock, adcDataOut, adcSerialClock, dacSerialClock, lcdClock, ldac, adcDataIn, dacDataIn);

input wire fpgaClock, adcDataOut;

wire syncADC, syncDAC;
wire [12:0] adcDataOutPackage;

output wire adcSerialClock, dacSerialClock, lcdClock, adcDataIn, ldac, dacDataIn;

PLL	PLL(fpgaClock, adcSerialClock, dacSerialClock, lcdClock);
ADC	ADC(adcSerialClock, syncADC, adcDataOut, adcDataOutPackage, adcDataIn);
DAC	DAC(/*adcDataOutPackage went here in wire lab, this should change*/, dacSerialClock, ldac, dacDataIn, syncDAC);
clock	clock(dacSerialClock, syncDAC, syncADC);	
endmodule
