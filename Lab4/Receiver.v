module Receiver(Clk, SDin, PDout, PDready);

	input Clk, SDin;
	output PDready;
	output [7:0]PDout ;
	reg Hold, Data;
	reg [8:0]SR ;
	
	assign PDout[7:0] = (SR[8]) ? SR[7:0] : 8'b0;
	assign PDready    = SR[8];
	
	always @(posedge Clk)
		begin
			if (SDin && ~Data)
				begin
					Data <= 1'b1;
				end
			else if (SR[8])
				begin
					Data <= 1'b0;
				end
		end

	always @(posedge Clk)
		Hold <= SDin;


	always @(posedge Clk)
		begin
			if (Data && SR[8])
				SR[8:0] <= 9'b0;
			else if (Data && ~SR[8])
				begin
					SR[8:1] <= SR[7:0];
					SR[0]   <= Hold;
				end
			else
				SR[8:0] <= SR[8:0];
		end
		
endmodule
