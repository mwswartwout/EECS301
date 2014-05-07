module pixelOutput(clk9MHz, highPassOutput, lowPassOutput, redPixels, greenPixels, bluePixels, vgaCount, lineCount, start);

input wire clk9MHz, start;
input wire [11:0] highPassOutput, lowPassOutput;
input wire [9:0] vgaCount;
input wire [8:0] lineCount;

output reg [7:0] 	redPixels, greenPixels, bluePixels;

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
								
			end
	end
endmodule
