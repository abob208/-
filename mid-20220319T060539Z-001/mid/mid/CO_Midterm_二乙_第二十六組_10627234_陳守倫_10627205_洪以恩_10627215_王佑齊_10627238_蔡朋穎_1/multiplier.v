`timescale 1ns/1ns
module multiplier( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [63:0] dataOut ;


parameter MULTU = 6'b011001;
parameter OUT = 6'b111111;

// 訊號
reg LSBofMultiplier;
reg [63:0] product ;
reg [63:0] multiplicandreg ;
reg [31:0] multipliereg ;

always@( reset )
begin
  if ( reset == 1 )
  begin
     product = 0 ;
	 multiplicandreg = 64'b0;
	 multipliereg = 32'b0 ;
	 LSBofMultiplier = 0;
  end
/*
如果訊號改變成乘法 就把counter歸0
*/
end

always@( Signal ) begin
if( Signal == MULTU )
begin
	multiplicandreg = dataA;
	multipliereg = dataB;
end
end

always@( posedge clk ) begin
	if ( Signal == MULTU ) 
	begin
	LSBofMultiplier = multipliereg[0];
	if ( LSBofMultiplier == 1 )
	begin
		product = product + multiplicandreg;
	end
	multiplicandreg = multiplicandreg<<1;
	multipliereg = multipliereg>>1;
	end
end


assign dataOut = product;

endmodule

