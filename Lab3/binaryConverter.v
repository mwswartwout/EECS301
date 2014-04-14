module binaryConverter(fsin_o, fsin_oBinary);

input [11:0] fsin_o;
output reg [11:0] fsin_oBinary;

always
	begin
		if (fsin_o[11] == 1)
			fsin_oBinary = 12'b100000000000 - (~fsin_o + 12'b000000000001);
		else 
			fsin_oBinary = fsin_o + 12'b011111111111;
	end
	
endmodule