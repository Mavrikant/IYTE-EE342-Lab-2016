module Lab3(Clk,In,Out1,Out2);

	input Clk, In;
	output Out1, Out2;

	debouncer1 deb1(.Clk(Clk), .In(In), .Out(Out1)); 
	debouncer2 deb2(.Clk(Clk), .In(In), .Out(Out2)); 
	
endmodule
