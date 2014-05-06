module pixelOutput(clk9MHz, characterPixels, redPixels, greenPixels, bluePixels, vgaCount, lineCount);

input wire clk9MHz;
input wire [24:0] characterPixels;
input wire [7:0] 	redPixels, greenPixels, bluePixels;
input wire [9:0] vgaCount;
input wire [8:0] lineCount;

endmodule
