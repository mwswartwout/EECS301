module finalProject(fpgaClock, adcDataOut, adcSerialClock, dacSerialClock, lcdClock, ldac, adcDataIn, dacDataIn);

input wire fpgaClock, adcDataOut;

wire syncADC, syncDAC;	//Sync pulses for the ADC and DAC
wire [11:0] adcDataOutPackage; //Data coming out of the ADC after it has been packaged by the ADC block
wire highPassSinkValid, highPassOutValid; //Valid signals from the highPass filter (sinkValid = input, outValid = output)
wire [11:0] highPassOutput; //12-bit output from the highPass filter
wire [1:0]	highPassError; //Output error from the highPass filter

output wire adcSerialClock, dacSerialClock, lcdClock, adcDataIn, ldac, dacDataIn;

PLL	PLL(fpgaClock, adcSerialClock, dacSerialClock, lcdClock); //PLL built using Altera MegaFunction; Input is 50MHz clock from FPGA, output is two 16MHz serial clocks (for DAC & ADC) and a 9MHz clock for the LCD.
ADC	ADC(adcSerialClock, syncADC, adcDataOut, adcDataOutPackage, adcDataIn); //ADC block sends dataIn to the ADC and takes dataOut and packages it.
DAC	DAC(/*adcDataOutPackage went here in wire lab, this should change*/, dacSerialClock, ldac, dacDataIn, syncDAC); //DAC block packages data for DAC and sends it
clock	clock(dacSerialClock, syncDAC, syncADC); //Clock creates the sync pulses for the ADC and DAC so that they are receiving and outputting data at the same time
highPass highPass(dacSerialClock, 1, adcDataOutPackage, highPassSinkValid, 2'b00, highPassOutput, highPassOutValid, highPassError);	
endmodule
