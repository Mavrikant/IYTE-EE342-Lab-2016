module AND_XOR(Input1, Input2, Select, Output);
	input Input1;
	input Input2;
	input Select;
	output Output;
	//Select 1 => AND Gate
	//Select 0 0> XOR Gate
	
	assign Output = (Select == 1'b0) ? (Input1 & Input2) : (Input1 ^ Input2);
	
endmodule
