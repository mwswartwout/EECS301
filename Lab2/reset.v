//Provides the synchronous reset signal for the counter that determines actual speed of motor from the optical encoder
module reset(clk, reset);

input clk; //Clock used is the 50 MHz built-in clock on the FPGA
output reg reset;
integer count;

always @(posedge clk )
	begin
		if (reset == 1) //If the rest was set HI on the last iteration:
		begin 
			reset = 0; //Set reset low, so that the pulse lasts only for 1 clock cycle
			count = 0; //Reset the count 
		end
		
		count = count + 1;
		
		if (count == 500000) //The reset pusle is one clock cycle long, running at 100Hz
		begin
			reset = 1;
		end
	end
endmodule