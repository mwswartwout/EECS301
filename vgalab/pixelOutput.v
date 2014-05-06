module pixelOutput(clk9MHz, characterPixels, redPixels, greenPixels, bluePixels, vgaCount, lineCount, start, ifReached);

input wire clk9MHz, start;
input wire [24:0] characterPixels;
input wire [9:0] vgaCount;
input wire [8:0] lineCount;

output reg [7:0] 	redPixels, greenPixels, bluePixels;
output reg ifReached = 0;

`define zero 8'b00000000
`define one 8'b11111111

always @(posedge clk9MHz)
	begin
		if (~start)
			begin
				redPixels[7:0] = `zero;
				greenPixels[7:0] = `zero;
				bluePixels[7:0] = `zero;
			end
			
		else if (start)
			begin
				if (lineCount < 50)
					begin
						if (vgaCount > 43 && vgaCount < 93)
							begin
								if (characterPixels[24] == 0)
									begin
										redPixels[7:0] = `zero;
										greenPixels[7:0] = `zero;
										bluePixels[7:0] = `zero;
									end
									
								else
									begin
										redPixels[7:0] = `one;
										greenPixels[7:0] = `one;
										bluePixels[7:0] = `one;
									end
							end
							
						else if (vgaCount >= 93 && vgaCount < 143)
							begin
								if (characterPixels[23] == 0)
									begin
										redPixels[7:0] = `zero;
										greenPixels[7:0] = `zero;
										bluePixels[7:0] = `zero;
									end
									
								else
									begin
										redPixels[7:0] = `one;
										greenPixels[7:0] = `one;
										bluePixels[7:0] = `one;
									end
							end
							
						else if (vgaCount >= 143 && vgaCount < 193)
							begin
								if (characterPixels[22] == 0)
									begin
										redPixels[7:0] = `zero;
										greenPixels[7:0] = `zero;
										bluePixels[7:0] = `zero;
									end
									
								else
									begin
										redPixels[7:0] = `one;
										greenPixels[7:0] = `one;
										bluePixels[7:0] = `one;
									end
							end
							
						else if (vgaCount >= 193 && vgaCount < 243)
							begin
								if (characterPixels[21] == 0)
									begin
										redPixels[7:0] = `zero;
										greenPixels[7:0] = `zero;
										bluePixels[7:0] = `zero;
									end
									
								else
									begin
										redPixels[7:0] = `one;
										greenPixels[7:0] = `one;
										bluePixels[7:0] = `one;
									end
							end
							
						else if (vgaCount >= 243 && vgaCount < 293)
							begin
								if (characterPixels[20] == 0)
									begin
										redPixels[7:0] = `zero;
										greenPixels[7:0] = `zero;
										bluePixels[7:0] = `zero;
									end
									
								else
									begin
										redPixels[7:0] = `one;
										greenPixels[7:0] = `one;
										bluePixels[7:0] = `one;
									end
							end
					
						else
							begin
								redPixels[7:0] = `zero;
								greenPixels[7:0] = `zero;
								bluePixels[7:0] = `zero;
							end
					end
				
				else if (lineCount < 100)
						begin
							if (vgaCount > 43 && vgaCount < 93)
								begin
									if (characterPixels[19] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 93 && vgaCount < 143)
								begin
									if (characterPixels[18] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 143 && vgaCount < 193)
								begin
									if (characterPixels[17] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >=193 && vgaCount < 243)
								begin
									if (characterPixels[16] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 243 && vgaCount < 293)
								begin
									if (characterPixels[15] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
							
							else
								begin
									redPixels[7:0] = `zero;
									greenPixels[7:0] = `zero;
									bluePixels[7:0] = `zero;
								end
						end
					else if (lineCount < 150)
						begin
							if (vgaCount > 43 && vgaCount < 93)
								begin
									if (characterPixels[14] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 93 && vgaCount < 143)
								begin
									if (characterPixels[13] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 143 && vgaCount < 193)
								begin
									if (characterPixels[12] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 193 && vgaCount < 243)
								begin
									if (characterPixels[11] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 243 && vgaCount < 293)
								begin
									if (characterPixels[10] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else
								begin
									redPixels[7:0] = `zero;
									greenPixels[7:0] = `zero;
									bluePixels[7:0] = `zero;
								end
						end
						
					else if (lineCount < 200)
						begin
							if (vgaCount > 43 && vgaCount < 93)
								begin
									if (characterPixels[9] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 93 && vgaCount < 143)
								begin
									if (characterPixels[8] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 143 && vgaCount < 193)
								begin
									if (characterPixels[7] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 193 && vgaCount < 243)
								begin
									if (characterPixels[6] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 243 && vgaCount < 293)
								begin
									if (characterPixels[5] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
							
							else
								begin
									redPixels[7:0] = `zero;
									greenPixels[7:0] = `zero;
									bluePixels[7:0] = `zero;
								end
						end
						
					else if (lineCount < 250)
						begin
							if (vgaCount > 43 && vgaCount < 93)
								begin
									if (characterPixels[4] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 93 && vgaCount < 143)
								begin
									if (characterPixels[3] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 143 && vgaCount < 193)
								begin
									if (characterPixels[2] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 193 && vgaCount < 243)
								begin
									if (characterPixels[1] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else if (vgaCount >= 243 && vgaCount < 293)
								begin
									if (characterPixels[0] == 0)
										begin
											redPixels[7:0] = `zero;
											greenPixels[7:0] = `zero;
											bluePixels[7:0] = `zero;
										end
										
									else
										begin
											redPixels[7:0] = `one;
											greenPixels[7:0] = `one;
											bluePixels[7:0] = `one;
										end
								end
								
							else
								begin
									redPixels[7:0] = `zero;
									greenPixels[7:0] = `zero;
									bluePixels[7:0] = `zero;
								end
						end
			end
	end
endmodule
