module alu( dataA, dataB, Signal, dataOut, zero, neq, BneSignal );
input [31:0] dataA ;
input [31:0] dataB ;
input [2:0] Signal ;
input BneSignal ;
output [31:0] dataOut ;
output zero ;
output neq ;
wire Bin_vert ;
wire [31:0] carry_out, sum ;


//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLT  : 42
//   SLL  : 00


parameter SUB = 3'b110;
parameter SLT = 3'b111;


/*
定義各種訊號
*/
assign Bin_vert = (Signal == SUB)?1'b1:
				  (Signal == SLT)?1'b1: 
				   1'b0;
				  
/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
Abit_ALU bit_00(.a(dataA[0]), .b(dataB[0]), .carry_in(Bin_vert), .cout(carry_out[0]), .sum(sum[0]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_01(.a(dataA[1]), .b(dataB[1]), .carry_in(carry_out[0]), .cout(carry_out[1]), .sum(sum[1]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_02(.a(dataA[2]), .b(dataB[2]), .carry_in(carry_out[1]), .cout(carry_out[2]), .sum(sum[2]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_03(.a(dataA[3]), .b(dataB[3]), .carry_in(carry_out[2]), .cout(carry_out[3]), .sum(sum[3]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_04(.a(dataA[4]), .b(dataB[4]), .carry_in(carry_out[3]), .cout(carry_out[4]), .sum(sum[4]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_05(.a(dataA[5]), .b(dataB[5]), .carry_in(carry_out[4]), .cout(carry_out[5]), .sum(sum[5]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_06(.a(dataA[6]), .b(dataB[6]), .carry_in(carry_out[5]), .cout(carry_out[6]), .sum(sum[6]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_07(.a(dataA[7]), .b(dataB[7]), .carry_in(carry_out[6]), .cout(carry_out[7]), .sum(sum[7]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_08(.a(dataA[8]), .b(dataB[8]), .carry_in(carry_out[7]), .cout(carry_out[8]), .sum(sum[8]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_09(.a(dataA[9]), .b(dataB[9]), .carry_in(carry_out[8]), .cout(carry_out[9]), .sum(sum[9]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_10(.a(dataA[10]), .b(dataB[10]), .carry_in(carry_out[9]), .cout(carry_out[10]), .sum(sum[10]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_11(.a(dataA[11]), .b(dataB[11]), .carry_in(carry_out[10]), .cout(carry_out[11]), .sum(sum[11]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_12(.a(dataA[12]), .b(dataB[12]), .carry_in(carry_out[11]), .cout(carry_out[12]), .sum(sum[12]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_13(.a(dataA[13]), .b(dataB[13]), .carry_in(carry_out[12]), .cout(carry_out[13]), .sum(sum[13]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_14(.a(dataA[14]), .b(dataB[14]), .carry_in(carry_out[13]), .cout(carry_out[14]), .sum(sum[14]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_15(.a(dataA[15]), .b(dataB[15]), .carry_in(carry_out[14]), .cout(carry_out[15]), .sum(sum[15]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_16(.a(dataA[16]), .b(dataB[16]), .carry_in(carry_out[15]), .cout(carry_out[16]), .sum(sum[16]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_17(.a(dataA[17]), .b(dataB[17]), .carry_in(carry_out[16]), .cout(carry_out[17]), .sum(sum[17]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_18(.a(dataA[18]), .b(dataB[18]), .carry_in(carry_out[17]), .cout(carry_out[18]), .sum(sum[18]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_19(.a(dataA[19]), .b(dataB[19]), .carry_in(carry_out[18]), .cout(carry_out[19]), .sum(sum[19]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_20(.a(dataA[20]), .b(dataB[20]), .carry_in(carry_out[19]), .cout(carry_out[20]), .sum(sum[20]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_21(.a(dataA[21]), .b(dataB[21]), .carry_in(carry_out[20]), .cout(carry_out[21]), .sum(sum[21]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_22(.a(dataA[22]), .b(dataB[22]), .carry_in(carry_out[21]), .cout(carry_out[22]), .sum(sum[22]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_23(.a(dataA[23]), .b(dataB[23]), .carry_in(carry_out[22]), .cout(carry_out[23]), .sum(sum[23]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_24(.a(dataA[24]), .b(dataB[24]), .carry_in(carry_out[23]), .cout(carry_out[24]), .sum(sum[24]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_25(.a(dataA[25]), .b(dataB[25]), .carry_in(carry_out[24]), .cout(carry_out[25]), .sum(sum[25]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_26(.a(dataA[26]), .b(dataB[26]), .carry_in(carry_out[25]), .cout(carry_out[26]), .sum(sum[26]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_27(.a(dataA[27]), .b(dataB[27]), .carry_in(carry_out[26]), .cout(carry_out[27]), .sum(sum[27]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_28(.a(dataA[28]), .b(dataB[28]), .carry_in(carry_out[27]), .cout(carry_out[28]), .sum(sum[28]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_29(.a(dataA[29]), .b(dataB[29]), .carry_in(carry_out[28]), .cout(carry_out[29]), .sum(sum[29]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_30(.a(dataA[30]), .b(dataB[30]), .carry_in(carry_out[29]), .cout(carry_out[30]), .sum(sum[30]), .Bin_vert(Bin_vert), .Signal(Signal)) ;
Abit_ALU bit_31(.a(dataA[31]), .b(dataB[31]), .carry_in(carry_out[30]), .cout(carry_out[31]), .sum(sum[31]), .Bin_vert(Bin_vert), .Signal(Signal)) ;


assign dataOut = (Signal == SLT)?{31'b0, sum[31]}: 
								         sum[31:0] ;

assign zero = (dataOut == 32'b0 && BneSignal == 1'b1 ) ? 1'b0 : 
			(dataOut == 32'b0 && BneSignal == 1'b0 ) ? 	1'b1 :
			(dataOut != 32'b0 && BneSignal == 1'b1 ) ? 	1'b1 :
														1'b0 ;
/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

endmodule
