module pushButtons(Button_0, Button_1, count, clk);

input Button_0, Button_1, clk;
output reg signed [7:0] count;

initial
	begin
		count = 8'b00000000;
	end

always @(posedge clk)
	begin
		 if( Button_0 ^ Button_1 == 1)
			begin
				if (Button_0 ^ Button_1 == 0);
				else if (Button_0 == 1 && count != 8'b10000000)
					count = count - 8'b00000001;
				else if (Button_1 == 1 && count != 8'b01111111)
					count = count + 8'b00000001;
				else;
			end
	end
	
endmodule