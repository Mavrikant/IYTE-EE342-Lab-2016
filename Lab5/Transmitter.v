module Transmitter (Clk, PDin, Send, SDClk, SDout);

	input Send, Clk;
	input [7:0]PDin;
	output SDClk;
	output SDout;
	reg [9:0]SR;
	reg SendReg;
	reg Sout;
	reg EPout;
	wire SendNew;
	
	assign SDClk = Clk;
	assign SDout = SR[9];
	
	//Part 1
	assign SendNew = Send & ~SendReg;
	
	always @(posedge Clk)
		SendReg <= Send;
	////
	
    //Part 2
	always @(posedge SendNew or posedge EPout)
	if (EPout)
		Sout <= 1'b0;
	else
		Sout <= 1'b1;
		
	always @(posedge Clk)
		EPout <= Sout;
	////
	
	always @(posedge Clk) 
		begin 
			if (EPout)
				begin
					SR[9]   <= 1'b1;
					SR[8:1] <= PDin[7:0];
					SR[0]   <= ((PDin[7]+PDin[6])+(PDin[5]+PDin[4]))+((PDin[3]+PDin[2])+(PDin[1]+PDin[0])); //Part 3 - Parity bit
					
				end
			else
				begin
					SR[9:1] <= SR[8:0];
					SR[0]   <= 1'b0;
				end
		end
	
endmodule
