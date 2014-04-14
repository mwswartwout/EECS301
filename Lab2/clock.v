//This clock is used as the clock for the pushButton logic

module clock (clkIn, clkOut);

input clkIn; //clkIn is the 50MHz FPGA clock
output reg clkOut;
integer count;

always @(posedge clkIn)
	begin
		count = count + 1;
		if (count == 2500000) //The reduced clock operates at 20Hz
			begin
				count = 0;
				clkOut = ~clkOut; //Inverts the clock
			end
	end
endmodule