module Lab2(motorOut1, motorOut2, button1, button2, clk, s0, s1, s2, s3, s4, s5, s6, s7, motorIn1, motorIn2);

input motorOut1, motorOut2, button1, button2, clk; //MotorOutX is the output from the motor's optical encoder, buttonX are the pushButtons, clk is the 50MHz FPGA clock
input s0, s1, s2, s3, s4, s5, s6, s7; //sX are the FPGA switches, they are used to set the gain in the form of an 8-bit, unsigned number
output motorIn1, motorIn2; //MotorInX are the motor's optical encoder inputs

wire slowClk, reset, direction, enable;
wire signed [7:0] actualSpeed, goalSpeed, error;
wire [7:0] correction;

clock clock(clk, slowClk); //Runs the reduced speed clock for the pushButton logic
reset resetSignal(clk, reset); //Runs the reset signal for the motorSpeed logic
pwmEnable pwmEnable(clk, enable); //Runs the enable signal for the pwmRamp logic

pushButtons pushButtons( ~button1 /*Input inverted because buttons are active low */, ~button2, goalSpeed, slowClk); //Accepts input from the buttons and slowClk, outputs the goalSpeed (8-bit, signed number)
motorSpeed motorSpeed(motorOut1, motorOut2, actualSpeed, reset, clk); //Accepts input from the motor's optical encoder, the reset signal and FPGA clock, outputs the actual speed of the motor
errorLogic errorLogic(goalSpeed, actualSpeed, error, clk, direction); //Calculates how far off the goalSpeed is from the actualSpeed
gainLogic gainLogic( s0, s1, s2, s3, s4, s5, s6, s7, clk, error, correction, actualSpeed, direction); //Uses the gain inputs to determine the amount of correction that should be made
pwmRamp pwmRamp( correction, clk, motorIn1, motorIn2, enable); //Takes correction from gainLogic and outputs a pwm signal to the motor

endmodule