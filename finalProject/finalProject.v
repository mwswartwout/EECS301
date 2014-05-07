module finalProject(fpgaClock, adcDataOut, adcSerialClock, dacSerialClock, lcdClock, ldac, adcDataIn, dacDataIn, disp, hSync, vSync, syncADC, syncDAC, redPixels, greenPixels, bluePixels);

input wire fpgaClock, adcDataOut;

wire [11:0] adcDataOutPackage; //Data coming out of the ADC after it has been packaged by the ADC block
wire sinkValid, highPassOutValid, lowPassOutValid; //Valid signals from the filters (sinkValid = input, outValid = output)
wire [11:0] highPassOutput, lowPassOutput; //12-bit output from the filters
wire [1:0]	highPassError, lowPassError; //Output error from the filters, these are ignored completely
wire start;	//Forces pixelOutput to display 10 black frames upon start-up of LCD screen
wire [9:0] vgaCount; //10-bit counter that tracks horizontal location of the pixel being drawn
wire [8:0] lineCount; //9-bit counter that tracks the vertical location of the pixel being drawn

output wire adcSerialClock, dacSerialClock, lcdClock, adcDataIn, ldac, dacDataIn, disp;
output wire hSync, vSync;
output wire syncADC, syncDAC; //sync/cs pulses for ADC/DAC
output wire [7:0] redPixels, greenPixels, bluePixels; //8-bit values for setting RGB pixels on the LCD screen

PLL	PLL(fpgaClock, adcSerialClock, dacSerialClock, lcdClock); //PLL built using Altera MegaFunction; Input is 50MHz clock from FPGA, output is two 16MHz serial clocks (for DAC & ADC) and a 9MHz clock for the LCD.
ADC	ADC(adcSerialClock, syncADC, adcDataOut, adcDataOutPackage, adcDataIn); //ADC block sends dataIn to the ADC and takes dataOut and packages it.
DAC	DAC(highPassOutput, dacSerialClock, ldac, dacDataIn, syncDAC); //DAC block packages data for DAC and sends it
clock	clock(dacSerialClock, syncDAC, syncADC, sinkValid); //Clock creates the sync pulses for the ADC and DAC so that they are receiving and outputting data at the same time
highPass highPass(dacSerialClock, 1, adcDataOutPackage, sinkValid, 2'b00, highPassOutput, highPassOutValid, highPassError); //FIR high pass filter, coefficients obtained using Altera FIR Compiler I
lowPass	lowPass(dacSerialClock, 1, adcDataOutPackage, sinkValid, 2'b00, lowPassOutput, lowPassOutValid, lowPassError);	//FIR low pass filter, coefficients obtained using online FIR coefficient calculator
pixelOutput	pixelOutput(lcdClock, highPassOutput, lowPassOutput, redPixels, greenPixels, bluePixels, vgaCount, lineCount, start); //Determines what colors are being set for the pixel being drawn
syncPulses	syncPulses(lcdClock, hSync, vSync, disp, vgaCount, lineCount, start); //Creates the hSync & vSync pulses for the LCD, and output vgaCount & lineCount which track which pixel is being drawn

endmodule
