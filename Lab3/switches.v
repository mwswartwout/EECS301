module switches(s0, s1, validS0, validS1);

//s0 = PIN_J6
//s1 = PIN_H5
input s0, s1;

output reg validS0, validS1;

always
begin
	if (s0 ^ s1 == 1)
	begin
		validS0 = s0;
		validS1 = s1;
	end

	else 
	begin
		validS0 = 0;
		validS1 = 0;
	end
end

endmodule