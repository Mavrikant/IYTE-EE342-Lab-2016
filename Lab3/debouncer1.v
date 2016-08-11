module debouncer1(Clk,In, Out);

	input In, Clk;
	output reg Out;
	reg [3:0] Reg;

	always @(posedge Clk)
		begin
			Reg[0] <= In;
			Reg[3:1] <= Reg[2:0];
		
			if ((Reg[0] == Reg[1]) && (Reg[0] == Reg[2]) && (Reg[0] == Reg[3]))
				Out <= Reg[0];
			else
				Out <= Out;
		end

endmodule
