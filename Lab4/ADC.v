module ADC(adcSerialClock, syncADC, adcDataOut, adcDataOutPackage, adcDataIn);

input adcSerialClock, syncADC, adcDataOut;

output [7:0] adcDataOutPackage;
output adcDataIn;

endmodule 