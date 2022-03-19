module FA(a, b, carry_in, cout, sum);


    input a, b, carry_in;
    output cout, sum;
    wire e1, e2, e3;

	xor(e1, a, b) ;
	and(e2, a, b) ;
	and(e3, e1, carry_in) ;
	or(cout, e2, e3) ;
	xor(sum, e1, carry_in) ;

endmodule

