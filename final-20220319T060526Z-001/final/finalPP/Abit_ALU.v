module Abit_ALU(a, b, carry_in, cout, sum, Bin_vert, Signal);

input a, b, carry_in, Bin_vert ;
input [2:0] Signal ;
output cout, sum ;

wire judge_b, fa_sum ;
wire and_sum, or_sum ;

parameter AND = 3'b000;
parameter OR  = 3'b001;

and(and_sum, a, b) ;
or(or_sum, a, b) ;
xor(judge_b, b, Bin_vert) ;
FA fa(a, judge_b, carry_in, cout, fa_sum) ;

assign sum = (Signal == AND)?and_sum:
             (Signal == OR)?or_sum:
			  fa_sum ;
			  
endmodule
			  
			  