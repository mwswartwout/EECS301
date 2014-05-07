module clock(serialClock, syncDAC, syncADC, sinkValid);

input serialClock; //16 MHz

integer countSync;

output reg syncDAC, syncADC, sinkValid;

initial
		countSync = 0;

always @(posedge serialClock)
	begin
	
		//Control block for syncDAC pulse
		countSync = countSync + 1;
		if (countSync == 32) //DAC takes 32-bit input
			syncDAC = 1;
			
		//Control block for syncADC pulse
		if (countSync == 16) //ADC takes 16-bit input
			begin
				syncADC = 1;
				sinkValid = 1;
			end
			
		else if (countSync == 320) //Delay makes it so that syncADC and syncDAC pulses are aligned, and also so that they are operating at 50,000 samples per second.
			begin
				syncADC = 0; //Reset all of the syncPulses and the counter
				syncDAC = 0;
				sinkValid = 0;
				countSync = 0;
			end
	end
endmodule