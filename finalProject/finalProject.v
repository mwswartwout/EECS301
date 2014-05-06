module finalProject(fpgaClock, adcSerialClock, dacSerialClock, lcdClock);

input wire fpgaClock;

output wire adcSerialClock, dacSerialClock, lcdClock;

PLL PLL(fpgaClock, adcSerialClock, dacSerialClock, lcdClock);

endmodule
