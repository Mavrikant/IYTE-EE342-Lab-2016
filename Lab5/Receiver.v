module Receiver(Clk, SDin, PDout, PDready, ParErr);

	input Clk, SDin;
	output PDready;
	output ParErr;
	output [7:0]PDout ;
	reg SDin_Hold, Data;
	reg [9:0]SR ;
	
	
	always @(posedge Clk)
		SDin_Hold <= SDin;
	
	assign PDout[7:0] = (SR[9]) ? SR[8:1] : 8'b0;
	assign PDready    = SR[9];
	
	always @(posedge Clk)
		begin
			if (SDin && ~Data)
				begin
					Data <= 1'b1;
				end
			else if (SR[9])
				begin
					Data <= 1'b0;
				end
		end

	always @(posedge Clk)
		begin
			if (Data && SR[9])
				SR[9:0] <= 10'b0;
			else if (Data && ~SR[9])
				begin
					SR[9:1] <= SR[8:0];
					SR[0]   <= SDin_Hold;
				end
			else
				SR[9:0] <= SR[9:0];
		end
		
	reg ParErr_Hold;	
	always @(posedge Clk)
		ParErr_Hold <= ParErr;
		
	wire Parr;
	assign Parr       = SR[1]+SR[2]+SR[3]+SR[4]+SR[5]+SR[6]+SR[7]+SR[8];
	assign ParErr = (((~Data & ParErr_Hold) ^ (SR[9]&(SR[0] ^ Parr)))) ? 1'b1 : 1'b0;

		
		
endmodule
