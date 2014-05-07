module finalProject(fpgaClock, adcDataOut, adcSerialClock, dacSerialClock, lcdClock, ldac, adcDataIn, dacDataIn);

input wire fpgaClock, adcDataOut;

wire syncADC, syncDAC;	//Sync pulses for the ADC and DAC
wire [11:0] adcDataOutPackage; //Data coming out of the ADC after it has been packaged by the ADC block
wire sinkValid, highPassOutValid, lowPassOutValid; //Valid signals from the filters (sinkValid = input, outValid = output)
wire [11:0] highPassOutput, lowPassOutput; //12-bit output from the filters
wire [1:0]	highPassError, lowPassError; //Output error from the filters, these are ignored completely

output wire adcSerialClock, dacSerialClock, lcdClock, adcDataIn, ldac, dacDataIn;

PLL	PLL(fpgaClock, adcSerialClock, dacSerialClock, lcdClock); //PLL built using Altera MegaFunction; Input is 50MHz clock from FPGA, output is two 16MHz serial clocks (for DAC & ADC) and a 9MHz clock for the LCD.
ADC	ADC(adcSerialClock, syncADC, adcDataOut, adcDataOutPackage, adcDataIn); //ADC block sends dataIn to the ADC and takes dataOut and packages it.
DAC	DAC(highPassOutput, dacSerialClock, ldac, dacDataIn, syncDAC); //DAC block packages data for DAC and sends it
clock	clock(dacSerialClock, syncDAC, syncADC, sinkValid); //Clock creates the sync pulses for the ADC and DAC so that they are receiving and outputting data at the same time
highPass highPass(dacSerialClock, 1, adcDataOutPackage, sinkValid, 2'b00, highPassOutput, highPassOutValid, highPassError); //FIR high pass filter, coefficients obtained using Altera FIR Compiler I
lowPass	lowPass(dacSerialClock, 1, adcDataOutPackage, sinkValid, 2'b00, lowPassOutput, lowPassOutValid, lowPassError);	//FIR low pass filter, coefficients obtained using online FIR coefficient calculator

endmodule
