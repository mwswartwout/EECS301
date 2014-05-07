module finalProject(fpgaClock, adcDataOut, adcSerialClock, dacSerialClock, lcdClock, ldac, adcDataIn, dacDataIn);

input wire fpgaClock, adcDataOut;

wire syncADC, syncDAC;
wire [12:0] adcDataOutPackage;

output wire adcSerialClock, dacSerialClock, lcdClock, adcDataIn, ldac, dacDataIn;

PLL	PLL(fpgaClock, adcSerialClock, dacSerialClock, lcdClock); //PLL built using Altera MegaFunction; Input is 50MHz clock from FPGA, output is two 16MHz serial clocks (for DAC & ADC) and a 9MHz clock for the LCD.
ADC	ADC(adcSerialClock, syncADC, adcDataOut, adcDataOutPackage, adcDataIn); //ADC block sends dataIn to the ADC and takes dataOut and packages it.
DAC	DAC(/*adcDataOutPackage went here in wire lab, this should change*/, dacSerialClock, ldac, dacDataIn, syncDAC); //DAC block packages data for DAC and sends it
clock	clock(dacSerialClock, syncDAC, syncADC); //Clock creates the sync pulses for the ADC and DAC so that they are receiving and outputting data at the same time
highPass highPass()	
endmodule
