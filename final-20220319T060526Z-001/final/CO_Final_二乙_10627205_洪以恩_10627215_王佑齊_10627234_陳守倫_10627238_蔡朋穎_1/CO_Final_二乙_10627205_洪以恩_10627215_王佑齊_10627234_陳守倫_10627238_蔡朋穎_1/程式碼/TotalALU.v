module TotalALU( dataA, dataB, Signal, immediate, operation, Output, zero, neq, BneSignal );
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
input [15:0] immediate ;
input [2:0] operation ;
input BneSignal ;
output [31:0] Output ;
output zero ;
output neq ;
//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SRL  : 2
//   SLT  : 42
//   DIVU : 27

wire [5:0] funct;
assign funct = immediate[5:0];

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SLL = 6'b000000;
parameter MULTU = 6'b011001;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;
/*
定義各種訊號
*/
//============================

wire [31:0] ALUOut, ShifterOut ;
/*
定義各種接線
*/
//============================

//ALUControl ALUControl( .clk(clk), .Signal(Signal), .SignaltoALU(SignaltoALU), .SignaltoSHT(SignaltoSHT), .SignaltoMULTU(SignaltoMULTU), .SignaltoMUX(SignaltoMUX) );
alu ALU( .dataA(dataA), .dataB(dataB), .Signal(operation), .dataOut(ALUOut), .zero(zero), .neq(neq), .BneSignal(BneSignal) );
//multiplier multiplier( .clk(clk), .dataA(dataA), .dataB(dataB), .Signal(SignaltoMULTU), .dataOut(MultuAns), .reset(reset) );
Shifter Shifter( .dataA(dataA), .dataB(dataB), .Signal(funct), .dataOut(ShifterOut) );
//HiLo HiLo( .clk(clk), .MultuAns(MultuAns), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
//MUX MUX( .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Signal(SignaltoMUX), .dataOut(dataOut) );
/*
建立各種module
*/
assign Output = (funct == 6'b0) ? ShifterOut : 
									ALUOut; 


endmodule