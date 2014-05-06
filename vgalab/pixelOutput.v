module pixelOutput(clk9MHz, characterPixels, redPixels, greenPixels, bluePixels, vgaCount, lineCount);

input wire clk9MHz;
input wire [24:0] characterPixels;
input wire [9:0] vgaCount;
input wire [8:0] lineCount;

output reg [7:0] 	redPixels, greenPixels, bluePixels;

always @(posedge clk9MHz)
	begin
		if (lineCount == 0)
			begin
				if (vgaCount == 43)
					begin
						redPixels[7:0] = characterPixels[24];
						greenPixels[7:0] = characterPixels[24];
						bluePixels[7:0] = characterPixels[24];
					end
					
				if (vgaCount == 44)
					begin
						redPixels[7:0] = characterPixels[23];
						greenPixels[7:0] = characterPixels[23];
						bluePixels[7:0] = characterPixels[23];
					end
					
				if (vgaCount == 45)
					begin
						redPixels[7:0] = characterPixels[22];
						greenPixels[7:0] = characterPixels[22];
						bluePixels[7:0] = characterPixels[22];
					end
					
				if (vgaCount == 46)
					begin
						redPixels[7:0] = characterPixels[21];
						greenPixels[7:0] = characterPixels[21];
						bluePixels[7:0] = characterPixels[21];
					end
					
				if (vgaCount == 47)
					begin
						redPixels[7:0] = characterPixels[20];
						greenPixels[7:0] = characterPixels[20];
						bluePixels[7:0] = characterPixels[20];
					end
					
				else
					begin
						redPixels[7:0] = 0;
						greenPixels[7:0] = 0;
						bluePixels[7:0] = 0;
					end
			end
	end
endmodule
