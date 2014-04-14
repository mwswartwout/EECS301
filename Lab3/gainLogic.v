//recieves fsin_o wave from NCO and calculates amount of correction ufsin_og gain switches
module gainLogic( aCount, MHz50Clk, fsin_o, gainedOut);

input MHz50Clk;
input [7:0] aCount;
input [11:0] fsin_o;

reg [19:0] gainProduct;

output reg [11:0] gainedOut;

always @(posedge MHz50Clk)
begin
	gainProduct = fsin_o * aCount; //multiplies fsin_o by aCount, which is between 0 & 255
	gainedOut[11:0] = gainProduct[19:8]; //divides by 256, allowing gain to be from 0 to ~1
end

endmodule