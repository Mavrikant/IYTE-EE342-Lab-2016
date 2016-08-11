module Exp7Top(Clock, Sel1, RnW1, Sel2, RnW2, Sel3, RnW3, Sel4, RnW4, DioExt, Dbuss);

	input Clock;  
	input Sel1, Sel2, Sel3, Sel4;  
	input RnW1, RnW2, RnW3, RnW4;  
	inout [7:0] DioExt;
	tri  [7:0] Dbus;  
	output [7:0] Dbuss;
	assign Dbuss [7:0] = Dbus [7:0];
	
	Reg8bit R1(Clock, Sel1, RnW1, Dbus);  
	Reg8bit R2(Clock, Sel2, RnW2, Dbus); 
	Reg8bit R3(Clock, Sel3, RnW3, Dbus);
	Accumulator Ac(Clock, Sel4, RnW4, Dbus);
	
	wire giris;
	assign giris = ( (RnW1|RnW2|RnW3) & (~Sel4) & ~(Sel1&Sel2) & ~(Sel1&Sel3) & ~(Sel2&Sel3) ) | ( ~(Sel1|Sel2|Sel3) & Sel4 ) ;
	wire cikis;
	assign cikis = ~giris;
	
	assign Dbus[7:0]   = (giris) ?  DioExt[7:0] : 8'bZ; 
	assign DioExt[7:0] = (cikis) ?  Dbus[7:0]   : 8'bZ; 

endmodule 