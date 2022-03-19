module Shifter_mux2x1(d1, d2, judge, out, Signal) ;
input d1,d2,judge ;
output out ;
input [5:0] Signal ;

parameter SLL = 6'b000000;

assign out = (judge == 1'b1 && Signal == SLL)?d2:
			  d1 ;
			  
endmodule