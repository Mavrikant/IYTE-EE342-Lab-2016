module debouncer2(Clk,In, Out);

	input Clk;
	input In;
	output reg Out;
	reg [1:0] Count;
	
	always @(posedge Clk)
	begin
		if (Count == 2'b11)
			begin
			if (In != Out)
				begin
					Out <= ~Out;
					Count <= 2'b00;
				end
			else
				begin
					Out <= Out;
					Count <= Count;
				end
			
			end
		else
			begin
				if (Count != 2'b11)
					Count <= Count + 2'b01;
				else
					Count <= Count;
			end
			
	end
	
endmodule

