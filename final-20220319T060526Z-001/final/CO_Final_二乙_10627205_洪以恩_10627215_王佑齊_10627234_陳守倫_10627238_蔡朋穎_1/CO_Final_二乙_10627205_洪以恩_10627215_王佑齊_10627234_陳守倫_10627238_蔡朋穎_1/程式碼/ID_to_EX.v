
module ID_to_EX( clk, rst,pc_in,pc_out,in_RegDst, in_ALUSrc, in_memorytoReg, inRegWrite, in_memoryRead, inMemWrite, in_Branch_sel, in_Jump_sel,
				outRegDst, outALUSrc, out_memoryToreg, outRegWrite, outmemoryRead, outmemoryWrite, out_Branch_sel, out_Jump_sel,
			  inRD1, inRD2, inextend_immediate,outRD1, outRD2, outextend_immediate, inrt, inrd, outrt, outrd,inopcode, outopcode, 
			  inoperation, outoperation, in_jump_addr, out_jump_addr, in_Bne, out_Bne );
	input clk, rst;
	input [31:0] pc_in ;
	input [4:0] inrt, inrd ;
	input [5:0] inopcode;
	input [2:0] inoperation;
	input [31:0] in_jump_addr;
	input in_RegDst, in_ALUSrc, in_memorytoReg, inRegWrite, in_memoryRead, inMemWrite, in_Branch_sel, in_Jump_sel, in_Bne ;
	input [31:0] inRD1, inRD2, inextend_immediate ;
	output [31:0] pc_out ;
	output [31:0] outRD1, outRD2, outextend_immediate ;
	output [4:0] outrt, outrd ;
	output [5:0] outopcode;
	output [2:0] outoperation;
	output [31:0] out_jump_addr;
	output outRegDst, outALUSrc, out_memoryToreg, outRegWrite, outmemoryRead, outmemoryWrite, out_Branch_sel, out_Jump_sel, out_Bne ;
	
//===========================================================================================================================

	reg outRegDst, outALUSrc, out_memoryToreg, outRegWrite, outmemoryRead, outmemoryWrite, out_Branch_sel, out_Jump_sel, out_Bne ;
	reg [2:0] outoperation;
	reg [4:0] outrt, outrd ;
	reg [5:0] outopcode;
	reg [31:0] pc_out,outRD1, outRD2, outextend_immediate, out_jump_addr;
	
//===========================================================================================================================

	always @( posedge clk ) begin
		if (rst) begin
			pc_out <= 32'b0;
			outRegDst <= 1'b0;
			outALUSrc <= 1'b0;
			out_memoryToreg <= 1'b0;
			outRegWrite <= 1'b0;
			outmemoryRead <= 1'b0;
			outmemoryWrite <= 1'b0;
			out_Branch_sel <= 1'b0;
			out_Jump_sel <= 1'b0;
			outRD1 <= 32'b0;
			outRD2 <= 32'b0;
			outextend_immediate <= 32'b0;
			outopcode <= 6'b0;
			outoperation <= 3'b0;
			outrt <= 4'b0;
			outrd <= 4'b0;
			out_jump_addr <= 32'b0;
			out_Bne <= 1'b0 ;
		end
		else begin
			pc_out <= pc_in ;
			outRegDst <= in_RegDst ;
			outALUSrc <= in_ALUSrc ;
			out_memoryToreg <= in_memorytoReg ;
			outRegWrite <= inRegWrite ;
			outmemoryRead <= in_memoryRead ;
			outmemoryWrite <= inMemWrite ;
			out_Branch_sel <= in_Branch_sel ;
			out_Jump_sel <= in_Jump_sel ;
			outRD1 <= inRD1 ;
			outRD2 <= inRD2 ;
			outextend_immediate <= inextend_immediate ;
			outopcode <= inopcode ;
			outoperation <= inoperation;
			outrt <= inrt ;
			outrd <= inrd ;
			out_jump_addr <= in_jump_addr;
			out_Bne <= in_Bne ;
		end
	end
		
endmodule