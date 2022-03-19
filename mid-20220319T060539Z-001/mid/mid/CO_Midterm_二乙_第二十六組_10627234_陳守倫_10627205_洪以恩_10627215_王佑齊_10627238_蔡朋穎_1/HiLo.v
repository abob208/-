`timescale 1ns/1ns
module HiLo ( clk, MultuAns, HiOut, LoOut, reset );

input clk ;
input reset ;
input [63:0] MultuAns;
output [31:0] HiOut, LoOut;
reg [31:0] tempHi, tempLo;

always@ ( posedge clk )
begin
	if (reset == 1)
	begin
		tempLo = 32'b0;
		tempHi = 32'b0;
	end
end

always@ ( posedge clk )
begin
	tempLo = MultuAns[31:0];
	tempHi = MultuAns[63:32];
end

assign HiOut = tempHi;
assign LoOut = tempLo;

endmodule