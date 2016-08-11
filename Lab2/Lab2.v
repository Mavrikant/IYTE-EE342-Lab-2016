module Lab2(nrst,clk,cnten, Co1, Co10, Co100);
input clk,cnten;
input nrst;
wire [1:0] W;
output [3:0] Co1;
output [3:0] Co10;
output [3:0] Co100;

BCDcounter C1(.nrst(nrst), .clk(clk), .cnten(cnten), .cout(Co1), .nexten(W[0]));
BCDcounter C10(.nrst(nrst), .clk(clk), .cnten(W[0] && cnten), .cout(Co10), .nexten(W[1]));
BCDcounter C100(.nrst(nrst), .clk(clk), .cnten(W[0] && W[1] && cnten), .cout(Co100), .nexten( ));
endmodule 