module clock(serialClock, syncDAC, syncADC);

input serialClock; //16 MHz

integer countSync;

output reg syncDAC, syncADC;

initial
	begin
		countSync = 0;
	end

always @(posedge serialClock)
	begin
	
		//Control block for syncDAC pulse
		countSync = countSync + 1;
		if (countSync == 32)
			syncDAC = 1;
			
		//Control block for syncADC pulse
		if (countSync == 16)
			syncADC = 1;
			
		else if (countSync == 64) //Delay makes it so that syncADC and syncDAC pulses are aligned
			begin
				syncADC = 0;
				syncDAC = 0;
				countSync = 0;
			end
	end
endmodule