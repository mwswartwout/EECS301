module errorLogic(goal, actual, error, clk, direction, unsignedGoal, unsignedActual);

input signed [7:0] goal, actual; //goalSpeed and actualSpeed are received as signed 8-bit numbers, representing a pwm duty cycle
output reg [7:0] error; //output is an unsigned, 8-bit number representing the diffferent between goal and actual
input clk; //input clk is the 50MHz FPGA clock
output reg direction; //1-bit direction output is 0 if motor needs to go "more forward", 1 if needs to go "more backward"

output reg [7:0] unsignedGoal, unsignedActual; //regs hold unsigned values of goal and actual (128 represents 50% duty cycle)

always @(posedge clk)
begin
	if (goal[7] == 1) //if goal is negative, converts to unsigned
		unsignedGoal = 8'b10000000 - (~goal + 8'b00000001); //Because of duty cycle representation, the positive, unsigned number must be subtracted from 128 to represent the correct duty cycle
	else 
		unsignedGoal = goal + 8'b10000000; //if positive goal is added to 128 to represent correct duty cycle
		
	if (actual[7] == 1)
		unsignedActual = 8'b10000000 - (~actual + 8'b00000001);
	else 
		unsignedActual = actual + 8'b10000000;
		
	if (unsignedGoal < unsignedActual) //To prevent wraparound, we must never subtract a larger number from a smaller number
	begin
		direction = 0; //Direction is set to 0 if goal is less than actual
		error = unsignedActual - unsignedGoal; //But goal is subtracted from actual to get the difference between the two, without wrap-around
	end

	else 
	begin
		direction = 1;
		error = unsignedGoal - unsignedActual;
	end
end

endmodule