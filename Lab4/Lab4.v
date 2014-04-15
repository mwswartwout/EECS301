module Lab4(fpgaClock, ldac, dacDataIn, syncDAC, dacSerialClock, adcSerialClock);

input fpgaClock;

wire syncDAC;
wire [11:0] dataDAC;

output ldac, dacDataIn, syncDAC, dacSerialClock, adcSerialClock;

PLL PLL(fpgaClock, dacSerialClock, adcSerialClock); //Both serial clocks are 16MHz
clock clock(dacSerialClock, syncDAC);
DAC DAC(dataDAC, dacSerialClock, ldac, dacDataIn, syncDAC);

endmodule