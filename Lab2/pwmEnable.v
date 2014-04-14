module pwmEnable(clk, out);

input clk;
output reg out;
reg [3:0] count = 4'b0000;

initial
out = 0;
	
always @(posedge clk)
begin
	if (count == 4'b1010)
		begin
			out = 1;
			count = 4'b0000;
		end
		
	else 
	begin
		count = count + 4'b0001;
		out = 0;
	end
end

endmodule
