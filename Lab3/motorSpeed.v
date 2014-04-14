module motorSpeed(A, B, motorspeed, reset, serialClock);

//A = PIN_AA14
//B = PIN_AB14
input A, B, reset, serialClock;
reg aOld;
reg signed [7:0] count;
output reg signed [7:0] motorspeed;

initial
count = 8'b00000000;



always @(posedge serialClock)
	begin
		if ( reset == 1)
			begin
					motorspeed = count;
					count = 8'b00000000;
			end
		
		if (aOld == 0 && A == 1)
			begin
				if (B == 0)// && count > 8'b10000000)
					begin
						count = count - 8'b00000001;
						aOld = A;
					end
				else if (B == 1)// && count < 8'b01111111)
					begin
						count = count + 8'b00000001;
						aOld = A;
					end
			end
		
		else 
			aOld = A;
	end
	
endmodule