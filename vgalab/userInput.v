module userInput(button1, button0, characterAddress, clk3Hz);

input button1, button0, clk3Hz;
output reg [3:0] characterAddress;

always @ (posedge clk3Hz)
	begin	
		if( button0 ^ button1 == 1)
			begin
				if (button1 == 1 && characterAddress != 4'b0000)
					characterAddress = characterAddress - 4'b0001;
				else if (button0 == 1 && characterAddress != 4'b1101)
					characterAddress = characterAddress + 4'b0001;
				else;
			end
	end

endmodule
