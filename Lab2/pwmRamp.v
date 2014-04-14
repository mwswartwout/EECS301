//Outputs a pwm pusle to motor inputs
module pwmRamp(correction, clk, out1, out2, enable);

input [7:0] correction; //This is the output from gainLogic
input clk, enable; //clk is 50MHz FPGA clock, enable is a signal that runs pwm counter at ~5MHz
output reg out1, out2;

integer i = 0;

always @(posedge clk && enable == 1)
begin					
	if (i < correction)
	begin
		out1 = 0;
		out2 = 1;
	end
					
	else 
	begin
		out1 = 1;
		out2 = 0;
	end
					
	if (i == 255)
		i = 0;
	else
		i = i + 1;
end	
	
endmodule