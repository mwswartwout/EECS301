module userInput(button1, button0, count, clk3Hz);

input button1, button0, clk3Hz;
output reg [3:0] count;

// will be a counter from 0 - 12
/*
	countValue:displayValue
	0:null
	1:1
	2:2
	3:3
	...
	9:9
	10:0
	11:+
	12:-
	13:=
*/

always @ (posedge clk3Hz)
	begin	
		if( button0 ^ button1 == 1)
			begin
				if (button1 == 1 && count != 4'b0000)
					count = count - 4'b0001;
				else if (button0 == 1 && count != 4'b1101)
					count = count + 4'b0001;
				else;
			end
	end

endmodule
