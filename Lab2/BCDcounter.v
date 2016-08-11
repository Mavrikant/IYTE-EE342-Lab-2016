module BCDcounter(nrst,clk,cnten,cout,nexten);
input clk;
input cnten;
input nrst;
output nexten;
output reg [3:0]cout;

always @(posedge clk or negedge nrst)
	begin
		if(nrst == 1'd0)
			cout[3:0] <= 4'b0;
			else
				if(cnten == 1'd1)
					if(cout[3:0] == 4'd9)
						cout[3:0] <= 4'b0;
					else
						cout[3:0] <= cout[3:0] + 4'b1;
	end 

assign nexten =(cout[3:0] == 4'd9)? 1'b1 : 1'b0;

endmodule 