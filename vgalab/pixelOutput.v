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
			
			if (lineCount == 1)
			begin
				if (vgaCount == 43)
					begin
						redPixels[7:0] = characterPixels[19];
						greenPixels[7:0] = characterPixels[19];
						bluePixels[7:0] = characterPixels[19];
					end
					
				if (vgaCount == 44)
					begin
						redPixels[7:0] = characterPixels[18];
						greenPixels[7:0] = characterPixels[18];
						bluePixels[7:0] = characterPixels[18];
					end
					
				if (vgaCount == 45)
					begin
						redPixels[7:0] = characterPixels[17];
						greenPixels[7:0] = characterPixels[17];
						bluePixels[7:0] = characterPixels[17];
					end
					
				if (vgaCount == 46)
					begin
						redPixels[7:0] = characterPixels[16];
						greenPixels[7:0] = characterPixels[16];
						bluePixels[7:0] = characterPixels[16];
					end
					
				if (vgaCount == 47)
					begin
						redPixels[7:0] = characterPixels[15];
						greenPixels[7:0] = characterPixels[15];
						bluePixels[7:0] = characterPixels[15];
					end
					
				else
					begin
						redPixels[7:0] = 0;
						greenPixels[7:0] = 0;
						bluePixels[7:0] = 0;
					end
			end
			
			if (lineCount == 2)
			begin
				if (vgaCount == 43)
					begin
						redPixels[7:0] = characterPixels[14];
						greenPixels[7:0] = characterPixels[14];
						bluePixels[7:0] = characterPixels[14];
					end
					
				if (vgaCount == 44)
					begin
						redPixels[7:0] = characterPixels[13];
						greenPixels[7:0] = characterPixels[13];
						bluePixels[7:0] = characterPixels[13];
					end
					
				if (vgaCount == 45)
					begin
						redPixels[7:0] = characterPixels[12];
						greenPixels[7:0] = characterPixels[12];
						bluePixels[7:0] = characterPixels[12];
					end
					
				if (vgaCount == 46)
					begin
						redPixels[7:0] = characterPixels[11];
						greenPixels[7:0] = characterPixels[11];
						bluePixels[7:0] = characterPixels[11];
					end
					
				if (vgaCount == 47)
					begin
						redPixels[7:0] = characterPixels[10];
						greenPixels[7:0] = characterPixels[10];
						bluePixels[7:0] = characterPixels[10];
					end
					
				else
					begin
						redPixels[7:0] = 0;
						greenPixels[7:0] = 0;
						bluePixels[7:0] = 0;
					end
			end
			
			if (lineCount == 3)
			begin
				if (vgaCount == 43)
					begin
						redPixels[7:0] = characterPixels[9];
						greenPixels[7:0] = characterPixels[9];
						bluePixels[7:0] = characterPixels[9];
					end
					
				if (vgaCount == 44)
					begin
						redPixels[7:0] = characterPixels[8];
						greenPixels[7:0] = characterPixels[8];
						bluePixels[7:0] = characterPixels[8];
					end
					
				if (vgaCount == 45)
					begin
						redPixels[7:0] = characterPixels[7];
						greenPixels[7:0] = characterPixels[7];
						bluePixels[7:0] = characterPixels[7];
					end
					
				if (vgaCount == 46)
					begin
						redPixels[7:0] = characterPixels[6];
						greenPixels[7:0] = characterPixels[6];
						bluePixels[7:0] = characterPixels[6];
					end
					
				if (vgaCount == 47)
					begin
						redPixels[7:0] = characterPixels[5];
						greenPixels[7:0] = characterPixels[5];
						bluePixels[7:0] = characterPixels[5];
					end
				
				else
					begin
						redPixels[7:0] = 0;
						greenPixels[7:0] = 0;
						bluePixels[7:0] = 0;
					end
			end
			
			if (lineCount == 4)
			begin
				if (vgaCount == 43)
					begin
						redPixels[7:0] = characterPixels[4];
						greenPixels[7:0] = characterPixels[4];
						bluePixels[7:0] = characterPixels[4];
					end
					
				if (vgaCount == 44)
					begin
						redPixels[7:0] = characterPixels[3];
						greenPixels[7:0] = characterPixels[3];
						bluePixels[7:0] = characterPixels[3];
					end
					
				if (vgaCount == 45)
					begin
						redPixels[7:0] = characterPixels[2];
						greenPixels[7:0] = characterPixels[2];
						bluePixels[7:0] = characterPixels[2];
					end
					
				if (vgaCount == 46)
					begin
						redPixels[7:0] = characterPixels[1];
						greenPixels[7:0] = characterPixels[1];
						bluePixels[7:0] = characterPixels[1];
					end
					
				if (vgaCount == 47)
					begin
						redPixels[7:0] = characterPixels[0];
						greenPixels[7:0] = characterPixels[0];
						bluePixels[7:0] = characterPixels[0];
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
