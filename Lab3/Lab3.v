module Lab3(MHz50Clk, A, B, s0, s1, ldac, dIn, serialClock, syncDAC, syncNCO);

input MHz50Clk, A, B, s0, s1; //50 MHz clock
//reg out_valid;
wire validS0, validS1, out_valid, motorSpeedReset, serialClock, syncDAC, syncNCO;
wire [7:0] motorspeed, aCount;
output wire syncDAC;
wire [15:0] fCount;
wire signed [11:0] fsin_o;
wire [11:0] fsin_oBinary;
wire [11:0] gainedOut;
wire faEnable;
output wire ldac, dIn, serialClock, syncNCO;

switches switches(s0, s1, validS0, validS1); //Controls whether amplitude or frequency is being adjusted
clock clock(motorSpeedReset, serialClock, syncDAC, syncNCO, faEnable); //generates all different clock frequencies
fCounter fCounter(validS0, validS1, motorspeed, faEnable, fCount); //frequency control counter
aCounter aCounter(validS0, validS1, motorspeed, faEnable, aCount); //amplitude control counter
NCO NCO(fCount, serialClock, 1'b1, syncNCO, fsin_o, out_valid); //Altera NCO
binaryConverter binaryConverter(fsin_o, fsin_oBinary); //Converts NCO output from 2s complement to binary
motorSpeed motorSpeed(A, B, motorspeed, motorSpeedReset, serialClock); //Checks direction that motor is spinning
gainLogic gainLogic( aCount, MHz50Clk, fsin_oBinary, gainedOut); //Implements gain logic for the NCO output
DAC DAC(gainedOut, serialClock, ldac, dIn, out_valid, syncDAC, syncNCO); //Bundles data bits together for output to DAC
PLL PLL(, MHz50Clk, serialClock);

endmodule
