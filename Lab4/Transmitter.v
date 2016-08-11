module Transmitter (Clk, PDin, Send, SDClk, SDout);

	input Send, Clk;
	input [7:0]PDin;
	output SDClk;
	output SDout;
	reg [8:0]SR;
	reg SendReg;
	wire SendNew;
	
	assign SDClk = Clk;
	assign SDout = SR[8];
	assign SendNew = Send && ~SendReg;
	
	always @(posedge Clk)
		SendReg <= Send;
	
	always @(posedge Clk) 
		begin 
			if (SendNew)
				begin
					SR[7:0] <= PDin[7:0];
					SR[8]   <= 1'b1;
				end
			else
				begin
					SR[8:1] <= SR[7:0];
					SR[0]   <= 1'b0;
				end
		end
	
endmodule
