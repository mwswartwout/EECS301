module motorSpeed(A, B, finalCount, reset, clk);

input A, B, reset, clk;
reg aOld;
reg signed [7:0] count;
output reg signed [7:0] finalCount;

initial
count = 8'b00000000;



always @(posedge clk)
	begin
		if ( reset == 1)
		begin
				finalCount = count;
				count = 8'b00000000;
		end
		
		if (aOld == 0 && A == 1)
			begin
				if (B == 0)
					begin
						count = count - 8'b00000001;
						aOld = A;
					end
				else if (B == 1)
					begin
						count = count + 8'b00000001;
						aOld = A;
					end
			end
		
		else 
			aOld = A;
	end
	
endmodule