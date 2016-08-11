module Lab6(Clk,D1,D2,Counter);
parameter S0=4'b0000, S1=4'b0001, S2=4'b0010, S3=4'b0011, S4=4'b0100, S5=4'b0101, S6=4'b0110, S7=4'b0111, S8=4'b1000; 
input D1,D2,Clk; 
reg [3:0]FSM; 
output reg [2:0] Counter;

always@(posedge Clk)
begin
	case(FSM[3:0])
		S0:
			begin
				if((D1==1)&(D2===0))
					FSM[3:0]<=S1;
				else if((D1==0)&(D2===1))
					FSM[3:0]<=S5;
				else 
					FSM[3:0]<=FSM[3:0];
			end
			
		S1:
			begin
				if((D1==1)&(D2===1))
					FSM[3:0]<=S2;
				else if((D1==0)&(D2===0))
					FSM[3:0]<=S0;
				else
					FSM[3:0]<=FSM[3:0];
			end	
			
		S2:
			begin
				if((D1==0)&(D2===1))
					FSM[3:0]<=S3;
				else if((D1==1)&(D2===0))
					FSM[3:0]<=S1;
				else
					FSM[3:0]<=FSM[3:0];
			end
			
		S3:
			begin
				if((D1==0)&(D2===0))
				begin
					FSM[3:0]<=S0;
					Counter <= Counter + 3'b001;
				end
				else if((D1==1)&(D2===1))
					FSM[3:0]<=S2;
				else
					FSM[3:0]<=FSM[3:0];
			end
			
		S5:
			begin
				if((D1==1)&(D2===1))
					FSM[3:0]<=S6;
				else if((D1==0)&(D2===0))
					FSM[3:0]<=S0;
				else
					FSM[3:0]<=FSM[3:0];
			end
			
		S6:
			begin
				if((D1==1)&(D2===0))
					FSM[3:0]<=S7;
				else if((D1==0)&(D2===1))
					FSM[3:0]<=S5;
				else
					FSM[3:0]<=FSM[3:0];
			end	
		S7:
			begin
				if((D1==0)&(D2===0))
				begin
					FSM[3:0]<=S0;
					Counter <= Counter - 3'b001;
				end
				else if((D1==1)&(D2===1))
					FSM[3:0]<=S6;
				else
					FSM[3:0]<=FSM[3:0];
			end	

			
		default:
				FSM[3:0]<=S0;
	endcase
end


endmodule
