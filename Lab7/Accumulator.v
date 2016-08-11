module Accumulator(Clk, Sel, RnW, Dio); 
	input Clk;
	input Sel;
	input RnW;
	inout [7:0]Dio;
	reg   [7:0]FFstore;
	wire Reset;
	assign Reset = Sel & RnW; 
	
	always @(posedge Clk) 
		if (RnW == 1'b0 && Sel == 1'b1) 
		    FFstore[7:0] <= FFstore[7:0] + Dio[7:0]; 
		else if (Reset)
		    FFstore[7:0] <= 8'b0;
		else
		    FFstore[7:0] <= FFstore[7:0];
		
	assign Dio[7:0] = (Sel == 1'b1 && RnW == 1'b1) ? FFstore[7:0] : 8'bZ; 
endmodule

