module Lab4 (Clk, Send, PDin, PDout, PDready, SDout, SClk );

	input Clk, Send;
	input [7:0]PDin;
	output [7:0]PDout;
	output PDready;
	output SDout;
	output SClk;
	wire Clk2;
	wire Wire;
	
	assign SDout = Wire;
	assign SClk = Clk2;
	
	Transmitter TR (.Clk(Clk),  .PDin(PDin[7:0]), .Send(Send),        .SDClk(Clk2), .SDout(Wire) );
	Receiver    RC (.Clk(Clk2), .SDin(Wire),   .PDout(PDout[7:0]), .PDready(PDready) );
	
endmodule
