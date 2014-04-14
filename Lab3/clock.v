module clock(motorSpeedReset, serialClock, syncDAC, syncNCO, faEnable);

input serialClock; //PIN_G21
output reg motorSpeedReset, syncDAC, syncNCO, faEnable;
integer countMotorSpeedReset, countSerialClock, countSyncDAC, countFaEnable;

reg syncDACold;

initial
	begin
		syncDACold = 0;
	end
	
always @(posedge serialClock)
	begin
		
		countMotorSpeedReset = countMotorSpeedReset + 1;
		if (countMotorSpeedReset == 5000000)
			begin
				countMotorSpeedReset	= 0;
				motorSpeedReset = 1;
			end
			
		else if(countMotorSpeedReset == 1)
			begin
				motorSpeedReset = 0;
			end
		
		countSyncDAC = countSyncDAC + 1;
			if (countSyncDAC == 32)
				syncDAC = 1;
			else if (countSyncDAC == 82)
				begin
					syncDAC = 0;
					countSyncDAC = 0;
				end
			
		if (syncDACold == 0 && syncDAC == 1)
			begin
				syncNCO = 1;
			end
		
		else
			syncNCO = 0;
			
		syncDACold = syncDAC;
		
		countFaEnable = countFaEnable + 1;
		if (countFaEnable == 25000)
			faEnable = ~faEnable;
			
		if (countFaEnable == 50000)
			begin	
				faEnable = ~faEnable;
				countFaEnable = 0;
			end
	end

endmodule