module pixelOutput(clk9MHz, characterPixels, redPixels, greenPixels, bluePixels, vgaCount, lineCount, start);

input wire clk9MHz, start;
input wire [24:0] characterPixels;
input wire [9:0] vgaCount;
input wire [8:0] lineCount;

output reg [7:0] 	redPixels, greenPixels, bluePixels;

`define zero 8'b00000000
`define one 8'b11111111

always @(posedge clk9MHz)
	begin
		if (~start)
			begin
				redPixels[7:0] = 0;
				greenPixels[7:0] = 0;
				bluePixels[7:0] = 0;
			end
			
		else if (start)
			begin
				if (lineCount == 0)
					begin
						if (vgaCount == 43)
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
							
						if (vgaCount == 44)
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
							
						if (vgaCount == 45)
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
							
						if (vgaCount == 46)
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
							
						if (vgaCount == 47)
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
								redPixels[7:0] = 0;
								greenPixels[7:0] = 0;
								bluePixels[7:0] = 0;
							end
					end
				
				if (lineCount == 1)
						begin
							if (vgaCount == 43)
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
								
							if (vgaCount == 44)
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
								
							if (vgaCount == 45)
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
								
							if (vgaCount == 46)
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
								
							if (vgaCount == 47)
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
						end
					if (lineCount == 2)
						begin
							if (vgaCount == 43)
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
								
							if (vgaCount == 44)
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
								
							if (vgaCount == 45)
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
								
							if (vgaCount == 46)
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
								
							if (vgaCount == 47)
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
						end
						
					if (lineCount == 3)
						begin
							if (vgaCount == 43)
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
								
							if (vgaCount == 44)
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
								
							if (vgaCount == 45)
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
								
							if (vgaCount == 46)
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
								
							if (vgaCount == 47)
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
						end
						
					if (lineCount == 4)
						begin
							if (vgaCount == 43)
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
								
							if (vgaCount == 44)
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
								
							if (vgaCount == 45)
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
								
							if (vgaCount == 46)
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
								
							if (vgaCount == 47)
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
						end
			end
	end
endmodule
