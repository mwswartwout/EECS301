module clock(serialClock, syncDAC);

input serialClock; //16 MHz
output reg syncDAC;
integer countSyncDAC;

always @(posedge serialClock)
	begin
	
		countSyncDAC = countSyncDAC + 1;
		if (countSyncDAC == 32)
			syncDAC = 1;
				
		else if (countSyncDAC == 64) // Must stay low for 2 microseconds = 32 serialClock pules
			begin
				syncDAC = 0;
				countSyncDAC = 0;
			end
	end
endmodule