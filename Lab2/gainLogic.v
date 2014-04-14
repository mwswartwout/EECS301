//recieves error from errorLogic and calculates amount of correction using gain switches
module gainLogic( s0, s1, s2, s3, s4, s5, s6, s7, clk, error, out, actualSpeed, direction);

input s0, s1, s2, s3, s4, s5, s6, s7, clk, direction; //sX are FPGA switches, clk is 50MHz FPGA clock, direction represents whether goal < actual or goal > actual
input [7:0] error;
input signed [7:0] actualSpeed; 

wire [7:0] switchSetting;
reg [7:0] unsignedActualSpeed;
reg [15:0] gainProduct;
reg [7:0] gainQuotient;

output reg [7:0] out; //output is an unsigned 8-bit number representing a duty cycle (128 = 50%), where the output = actual +- error*gain

//takes the FPGA switches and stores values in an 8-bit register
assign switchSetting[0] = s0;
assign switchSetting[1] = s1;
assign switchSetting[2] = s2;
assign switchSetting[3] = s3;
assign switchSetting[4] = s4;
assign switchSetting[5] = s5;
assign switchSetting[6] = s6;
assign switchSetting[7] = s7;

always @(posedge clk)
begin
	if (actualSpeed[7] == 1) //Converts actualSpeed to unsigned
		unsignedActualSpeed = 8'b10000000 - (~actualSpeed + 8'b00000001);
	else 
		unsignedActualSpeed = actualSpeed + 8'b10000000;
		
gainProduct = error * switchSetting; //multiplies error by switchSetting, which is between 0 & 255
gainQuotient[7:0] = gainProduct[15:8]; //divides by 256, allowing gain to be from 0 to ~1

	if (direction == 0) //Determines whether the speed correction should be added or subtracted from the actualSpeed
		out = unsignedActualSpeed - gainQuotient;
	else 
		out = unsignedActualSpeed + gainQuotient;
end

endmodule