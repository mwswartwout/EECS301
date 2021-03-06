module Lab4(fpgaClock, adcDataOut, ldac, dacDataIn, syncDAC, dacSerialClock, adcSerialClock, syncADC, adcDataIn);

input fpgaClock, adcDataOut;

wire syncDAC, syncADC;
wire [11:0] adcDataOutPackage;

output ldac, dacDataIn, syncDAC, dacSerialClock, adcSerialClock, syncADC, adcDataIn;

PLL PLL(fpgaClock, dacSerialClock, adcSerialClock); //Both serial clocks are 16MHz
clock clock(dacSerialClock, syncDAC, syncADC);
DAC DAC(adcDataOutPackage, dacSerialClock, ldac, dacDataIn, syncDAC);
ADC ADC(adcSerialClock, syncADC, adcDataOut, adcDataOutPackage, adcDataIn);
endmodule 