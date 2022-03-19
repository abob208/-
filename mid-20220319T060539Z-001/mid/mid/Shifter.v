`timescale 1ns/1ns
module Shifter( dataA, dataB, Signal, dataOut, reset );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;


reg [31:0] temp ;
reg [31:0] none = 32'b0 ;
reg [5:0] ctrl = 6'b100000 ;

parameter SLL = 6'b000000;

wire [31:0] q1 ;
wire [31:0] q2 ;
wire [31:0] q3 ;
wire [31:0] q4 ;
wire [31:0] q5 ;

/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
//1
Shifter_mux2x1 sh_031(dataA[31], dataA[30], dataB[0], q1[31], Signal) ;
Shifter_mux2x1 sh_030(dataA[30], dataA[29], dataB[0], q1[30], Signal) ;
Shifter_mux2x1 sh_029(dataA[29], dataA[28], dataB[0], q1[29], Signal) ;
Shifter_mux2x1 sh_028(dataA[28], dataA[27], dataB[0], q1[28], Signal) ;
Shifter_mux2x1 sh_027(dataA[27], dataA[26], dataB[0], q1[27], Signal) ;
Shifter_mux2x1 sh_026(dataA[26], dataA[25], dataB[0], q1[26], Signal) ;
Shifter_mux2x1 sh_025(dataA[25], dataA[24], dataB[0], q1[25], Signal) ;
Shifter_mux2x1 sh_024(dataA[24], dataA[23], dataB[0], q1[24], Signal) ;
Shifter_mux2x1 sh_023(dataA[23], dataA[22], dataB[0], q1[23], Signal) ;
Shifter_mux2x1 sh_022(dataA[22], dataA[21], dataB[0], q1[22], Signal) ;
Shifter_mux2x1 sh_021(dataA[21], dataA[20], dataB[0], q1[21], Signal) ;
Shifter_mux2x1 sh_020(dataA[20], dataA[19], dataB[0], q1[20], Signal) ;
Shifter_mux2x1 sh_019(dataA[19], dataA[18], dataB[0], q1[19], Signal) ;
Shifter_mux2x1 sh_018(dataA[18], dataA[17], dataB[0], q1[18], Signal) ;
Shifter_mux2x1 sh_017(dataA[17], dataA[16], dataB[0], q1[17], Signal) ;
Shifter_mux2x1 sh_016(dataA[16], dataA[15], dataB[0], q1[16], Signal) ;
Shifter_mux2x1 sh_015(dataA[15], dataA[14], dataB[0], q1[15], Signal) ;
Shifter_mux2x1 sh_014(dataA[14], dataA[13], dataB[0], q1[14], Signal) ;
Shifter_mux2x1 sh_013(dataA[13], dataA[12], dataB[0], q1[13], Signal) ;
Shifter_mux2x1 sh_012(dataA[12], dataA[11], dataB[0], q1[12], Signal) ;
Shifter_mux2x1 sh_011(dataA[11], dataA[10], dataB[0], q1[11], Signal) ;
Shifter_mux2x1 sh_010(dataA[10], dataA[9], dataB[0], q1[10], Signal) ;
Shifter_mux2x1 sh_009(dataA[9], dataA[8], dataB[0], q1[9], Signal) ;
Shifter_mux2x1 sh_008(dataA[8], dataA[7], dataB[0], q1[8], Signal) ;
Shifter_mux2x1 sh_007(dataA[7], dataA[6], dataB[0], q1[7], Signal) ;
Shifter_mux2x1 sh_006(dataA[6], dataA[5], dataB[0], q1[6], Signal) ;
Shifter_mux2x1 sh_005(dataA[5], dataA[4], dataB[0], q1[5], Signal) ;
Shifter_mux2x1 sh_004(dataA[4], dataA[3], dataB[0], q1[4], Signal) ;
Shifter_mux2x1 sh_003(dataA[3], dataA[2], dataB[0], q1[3], Signal) ;
Shifter_mux2x1 sh_002(dataA[2], dataA[1], dataB[0], q1[2], Signal) ;
Shifter_mux2x1 sh_001(dataA[1], dataA[0], dataB[0], q1[1], Signal) ;
Shifter_mux2x1 sh_000(dataA[0], 1'b0, dataB[0], q1[0], Signal) ;

//2
Shifter_mux2x1 sh_131(q1[31], q1[29], dataB[1], q2[31], Signal) ;
Shifter_mux2x1 sh_130(q1[30], q1[28], dataB[1], q2[30], Signal) ;
Shifter_mux2x1 sh_129(q1[29], q1[27], dataB[1], q2[29], Signal) ;
Shifter_mux2x1 sh_128(q1[28], q1[26], dataB[1], q2[28], Signal) ;
Shifter_mux2x1 sh_127(q1[27], q1[25], dataB[1], q2[27], Signal) ;
Shifter_mux2x1 sh_126(q1[26], q1[24], dataB[1], q2[26], Signal) ;
Shifter_mux2x1 sh_125(q1[25], q1[23], dataB[1], q2[25], Signal) ;
Shifter_mux2x1 sh_124(q1[24], q1[22], dataB[1], q2[24], Signal) ;
Shifter_mux2x1 sh_123(q1[23], q1[21], dataB[1], q2[23], Signal) ;
Shifter_mux2x1 sh_122(q1[22], q1[20], dataB[1], q2[22], Signal) ;
Shifter_mux2x1 sh_121(q1[21], q1[19], dataB[1], q2[21], Signal) ;
Shifter_mux2x1 sh_120(q1[20], q1[18], dataB[1], q2[20], Signal) ;
Shifter_mux2x1 sh_119(q1[19], q1[17], dataB[1], q2[19], Signal) ;
Shifter_mux2x1 sh_118(q1[18], q1[16], dataB[1], q2[18], Signal) ;
Shifter_mux2x1 sh_117(q1[17], q1[15], dataB[1], q2[17], Signal) ;
Shifter_mux2x1 sh_116(q1[16], q1[14], dataB[1], q2[16], Signal) ;
Shifter_mux2x1 sh_115(q1[15], q1[13], dataB[1], q2[15], Signal) ;
Shifter_mux2x1 sh_114(q1[14], q1[12], dataB[1], q2[14], Signal) ;
Shifter_mux2x1 sh_113(q1[13], q1[11], dataB[1], q2[13], Signal) ;
Shifter_mux2x1 sh_112(q1[12], q1[10], dataB[1], q2[12], Signal) ;
Shifter_mux2x1 sh_111(q1[11], q1[9], dataB[1], q2[11], Signal) ;
Shifter_mux2x1 sh_110(q1[10], q1[8], dataB[1], q2[10], Signal) ;
Shifter_mux2x1 sh_109(q1[9], q1[7], dataB[1], q2[9], Signal) ;
Shifter_mux2x1 sh_108(q1[8], q1[6], dataB[1], q2[8], Signal) ;
Shifter_mux2x1 sh_107(q1[7], q1[5], dataB[1], q2[7], Signal) ;
Shifter_mux2x1 sh_106(q1[6], q1[4], dataB[1], q2[6], Signal) ;
Shifter_mux2x1 sh_105(q1[5], q1[3], dataB[1], q2[5], Signal) ;
Shifter_mux2x1 sh_104(q1[4], q1[2], dataB[1], q2[4], Signal) ;
Shifter_mux2x1 sh_103(q1[3], q1[1], dataB[1], q2[3], Signal) ;
Shifter_mux2x1 sh_102(q1[2], q1[0], dataB[1], q2[2], Signal) ;
Shifter_mux2x1 sh_101(q1[1], 1'b0, dataB[1], q2[1], Signal) ;
Shifter_mux2x1 sh_100(q1[0], 1'b0, dataB[1], q2[0], Signal) ;

//4
Shifter_mux2x1 sh_231(q2[31], q2[27], dataB[2], q3[31], Signal) ;
Shifter_mux2x1 sh_230(q2[30], q2[26], dataB[2], q3[30], Signal) ;
Shifter_mux2x1 sh_229(q2[29], q2[25], dataB[2], q3[29], Signal) ;
Shifter_mux2x1 sh_228(q2[28], q2[24], dataB[2], q3[28], Signal) ;
Shifter_mux2x1 sh_227(q2[27], q2[23], dataB[2], q3[27], Signal) ;
Shifter_mux2x1 sh_226(q2[26], q2[22], dataB[2], q3[26], Signal) ;
Shifter_mux2x1 sh_225(q2[25], q2[21], dataB[2], q3[25], Signal) ;
Shifter_mux2x1 sh_224(q2[24], q2[20], dataB[2], q3[24], Signal) ;
Shifter_mux2x1 sh_223(q2[23], q2[19], dataB[2], q3[23], Signal) ;
Shifter_mux2x1 sh_222(q2[22], q2[18], dataB[2], q3[22], Signal) ;
Shifter_mux2x1 sh_221(q2[21], q2[17], dataB[2], q3[21], Signal) ;
Shifter_mux2x1 sh_220(q2[20], q2[16], dataB[2], q3[20], Signal) ;
Shifter_mux2x1 sh_219(q2[19], q2[15], dataB[2], q3[19], Signal) ;
Shifter_mux2x1 sh_218(q2[18], q2[14], dataB[2], q3[18], Signal) ;
Shifter_mux2x1 sh_217(q2[17], q2[13], dataB[2], q3[17], Signal) ;
Shifter_mux2x1 sh_216(q2[16], q2[12], dataB[2], q3[16], Signal) ;
Shifter_mux2x1 sh_215(q2[15], q2[11], dataB[2], q3[15], Signal) ;
Shifter_mux2x1 sh_214(q2[14], q2[10], dataB[2], q3[14], Signal) ;
Shifter_mux2x1 sh_213(q2[13], q2[9], dataB[2], q3[13], Signal) ;
Shifter_mux2x1 sh_212(q2[12], q2[8], dataB[2], q3[12], Signal) ;
Shifter_mux2x1 sh_211(q2[11], q2[7], dataB[2], q3[11], Signal) ;
Shifter_mux2x1 sh_210(q2[10], q2[6], dataB[2], q3[10], Signal) ;
Shifter_mux2x1 sh_209(q2[9], q2[5], dataB[2], q3[9], Signal) ;
Shifter_mux2x1 sh_208(q2[8], q2[4], dataB[2], q3[8], Signal) ;
Shifter_mux2x1 sh_207(q2[7], q2[3], dataB[2], q3[7], Signal) ;
Shifter_mux2x1 sh_206(q2[6], q2[2], dataB[2], q3[6], Signal) ;
Shifter_mux2x1 sh_205(q2[5], q2[1], dataB[2], q3[5], Signal) ;
Shifter_mux2x1 sh_204(q2[4], q2[0], dataB[2], q3[4], Signal) ;
Shifter_mux2x1 sh_203(q2[3], 1'b0, dataB[2], q3[3], Signal) ;
Shifter_mux2x1 sh_202(q2[2], 1'b0, dataB[2], q3[2], Signal) ;
Shifter_mux2x1 sh_201(q2[1], 1'b0, dataB[2], q3[1], Signal) ;
Shifter_mux2x1 sh_200(q2[0], 1'b0, dataB[2], q3[0], Signal) ;

//8
Shifter_mux2x1 sh_331(q3[31], q3[23], dataB[3], q4[31], Signal) ;
Shifter_mux2x1 sh_330(q3[30], q3[22], dataB[3], q4[30], Signal) ;
Shifter_mux2x1 sh_329(q3[29], q3[21], dataB[3], q4[29], Signal) ;
Shifter_mux2x1 sh_328(q3[28], q3[20], dataB[3], q4[28], Signal) ;
Shifter_mux2x1 sh_327(q3[27], q3[19], dataB[3], q4[27], Signal) ;
Shifter_mux2x1 sh_326(q3[26], q3[18], dataB[3], q4[26], Signal) ;
Shifter_mux2x1 sh_325(q3[25], q3[17], dataB[3], q4[25], Signal) ;
Shifter_mux2x1 sh_324(q3[24], q3[16], dataB[3], q4[24], Signal) ;
Shifter_mux2x1 sh_323(q3[23], q3[15], dataB[3], q4[23], Signal) ;
Shifter_mux2x1 sh_322(q3[22], q3[14], dataB[3], q4[22], Signal) ;
Shifter_mux2x1 sh_321(q3[21], q3[13], dataB[3], q4[21], Signal) ;
Shifter_mux2x1 sh_320(q3[20], q3[12], dataB[3], q4[20], Signal) ;
Shifter_mux2x1 sh_319(q3[19], q3[11], dataB[3], q4[19], Signal) ;
Shifter_mux2x1 sh_318(q3[18], q3[10], dataB[3], q4[18], Signal) ;
Shifter_mux2x1 sh_317(q3[17], q3[9], dataB[3], q4[17], Signal) ;
Shifter_mux2x1 sh_316(q3[16], q3[8], dataB[3], q4[16], Signal) ;
Shifter_mux2x1 sh_315(q3[15], q3[7], dataB[3], q4[15], Signal) ;
Shifter_mux2x1 sh_314(q3[14], q3[6], dataB[3], q4[14], Signal) ;
Shifter_mux2x1 sh_313(q3[13], q3[5], dataB[3], q4[13], Signal) ;
Shifter_mux2x1 sh_312(q3[12], q3[4], dataB[3], q4[12], Signal) ;
Shifter_mux2x1 sh_311(q3[11], q3[3], dataB[3], q4[11], Signal) ;
Shifter_mux2x1 sh_310(q3[10], q3[2], dataB[3], q4[10], Signal) ;
Shifter_mux2x1 sh_309(q3[9], q3[1], dataB[3], q4[9], Signal) ;
Shifter_mux2x1 sh_308(q3[8], q3[0], dataB[3], q4[8], Signal) ;
Shifter_mux2x1 sh_307(q3[7], 1'b0, dataB[3], q4[7], Signal) ;
Shifter_mux2x1 sh_306(q3[6], 1'b0, dataB[3], q4[6], Signal) ;
Shifter_mux2x1 sh_305(q3[5], 1'b0, dataB[3], q4[5], Signal) ;
Shifter_mux2x1 sh_304(q3[4], 1'b0, dataB[3], q4[4], Signal) ;
Shifter_mux2x1 sh_303(q3[3], 1'b0, dataB[3], q4[3], Signal) ;
Shifter_mux2x1 sh_302(q3[2], 1'b0, dataB[3], q4[2], Signal) ;
Shifter_mux2x1 sh_301(q3[1], 1'b0, dataB[3], q4[1], Signal) ;
Shifter_mux2x1 sh_300(q3[0], 1'b0, dataB[3], q4[0], Signal) ;

//16
Shifter_mux2x1 sh_431(q4[31], q4[15], dataB[4], q5[31], Signal) ;
Shifter_mux2x1 sh_430(q4[30], q4[14], dataB[4], q5[30], Signal) ;
Shifter_mux2x1 sh_429(q4[29], q4[13], dataB[4], q5[29], Signal) ;
Shifter_mux2x1 sh_428(q4[28], q4[12], dataB[4], q5[28], Signal) ;
Shifter_mux2x1 sh_427(q4[27], q4[11], dataB[4], q5[27], Signal) ;
Shifter_mux2x1 sh_426(q4[26], q4[10], dataB[4], q5[26], Signal) ;
Shifter_mux2x1 sh_425(q4[25], q4[9], dataB[4], q5[25], Signal) ;
Shifter_mux2x1 sh_424(q4[24], q4[8], dataB[4], q5[24], Signal) ;
Shifter_mux2x1 sh_423(q4[23], q4[7], dataB[4], q5[23], Signal) ;
Shifter_mux2x1 sh_422(q4[22], q4[6], dataB[4], q5[22], Signal) ;
Shifter_mux2x1 sh_421(q4[21], q4[5], dataB[4], q5[21], Signal) ;
Shifter_mux2x1 sh_420(q4[20], q4[4], dataB[4], q5[20], Signal) ;
Shifter_mux2x1 sh_419(q4[19], q4[3], dataB[4], q5[19], Signal) ;
Shifter_mux2x1 sh_418(q4[18], q4[2], dataB[4], q5[18], Signal) ;
Shifter_mux2x1 sh_417(q4[17], q4[1], dataB[4], q5[17], Signal) ;
Shifter_mux2x1 sh_416(q4[16], q4[0], dataB[4], q5[16], Signal) ;
Shifter_mux2x1 sh_415(q4[15], 1'b0, dataB[4], q5[15], Signal) ;
Shifter_mux2x1 sh_414(q4[14], 1'b0, dataB[4], q5[14], Signal) ;
Shifter_mux2x1 sh_413(q4[13], 1'b0, dataB[4], q5[13], Signal) ;
Shifter_mux2x1 sh_412(q4[12], 1'b0, dataB[4], q5[12], Signal) ;
Shifter_mux2x1 sh_411(q4[11], 1'b0, dataB[4], q5[11], Signal) ;
Shifter_mux2x1 sh_410(q4[10], 1'b0, dataB[4], q5[10], Signal) ;
Shifter_mux2x1 sh_409(q4[9], 1'b0, dataB[4], q5[9], Signal) ;
Shifter_mux2x1 sh_408(q4[8], 1'b0, dataB[4], q5[8], Signal) ;
Shifter_mux2x1 sh_407(q4[7], 1'b0, dataB[4], q5[7], Signal) ;
Shifter_mux2x1 sh_406(q4[6], 1'b0, dataB[4], q5[6], Signal) ;
Shifter_mux2x1 sh_405(q4[5], 1'b0, dataB[4], q5[5], Signal) ;
Shifter_mux2x1 sh_404(q4[4], 1'b0, dataB[4], q5[4], Signal) ;
Shifter_mux2x1 sh_403(q4[3], 1'b0, dataB[4], q5[3], Signal) ;
Shifter_mux2x1 sh_402(q4[2], 1'b0, dataB[4], q5[2], Signal) ;
Shifter_mux2x1 sh_401(q4[1], 1'b0, dataB[4], q5[1], Signal) ;
Shifter_mux2x1 sh_400(q4[0], 1'b0, dataB[4], q5[0], Signal) ;


assign dataOut = (dataB >= ctrl)? none :q5 ;
/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

endmodule