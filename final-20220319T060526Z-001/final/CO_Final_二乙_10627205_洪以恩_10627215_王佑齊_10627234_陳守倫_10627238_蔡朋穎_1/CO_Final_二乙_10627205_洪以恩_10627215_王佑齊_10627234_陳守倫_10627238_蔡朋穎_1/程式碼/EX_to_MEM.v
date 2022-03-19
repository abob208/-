
module EX_to_MEM(clk, rst, in_pc_bgt, in_RegWrite, in_Branch, inmemoryToreg, inmemoryRead, inmemoryWrite, in_Jump,
			   in_pc_bgt, in_zero, in_neq ,in_alu_out, in_rd2, in_mux, out_pc_bgt, out_zero, out_neq, out_alu_out, out_rd2, out_mux,
			  out_RegWrite, out_Branch, out_memoryToreg, out_memoryRead, out_memoryWrite, out_Jump, in_jump_addr, out_jump_addr);

	input clk, rst;
	input in_zero, in_neq ;
	input [4:0] in_mux;
	input [31:0] in_pc_bgt, in_alu_out, in_rd2, in_jump_addr;
	input in_RegWrite, in_Branch, inmemoryToreg, inmemoryRead, inmemoryWrite, in_Jump;
	output out_zero, out_neq ;
	output [4:0] out_mux;
	output [31:0] out_pc_bgt, out_alu_out, out_rd2, out_jump_addr;
	output out_RegWrite, out_Branch, out_memoryToreg, out_memoryRead, out_memoryWrite, out_Jump;
	
//===========================================================================================================================
	reg out_neq ;
	reg out_zero;
	reg [4:0] out_mux;
	reg [31:0]  out_pc_bgt, out_alu_out, out_rd2, out_jump_addr;
	reg out_RegWrite, out_Branch, out_memoryToreg, out_memoryRead, out_memoryWrite, out_Jump;
	
//===========================================================================================================================

	always @(posedge clk) begin
		if (rst) begin
			out_pc_bgt <= 32'b0;
			out_zero <= 1'b0;
			out_mux <= 5'b0;
			out_Jump <= 1'b0;
			out_jump_addr <= 32'b0;
			out_pc_bgt <= 32'b0;
			out_alu_out <= 32'b0;
			out_rd2 <= 32'b0;
			out_RegWrite <= 1'b0;
			out_Branch <= 1'b0;
			out_memoryToreg <= 1'b0;
			out_memoryRead <= 1'b0;
			out_memoryWrite <= 1'b0;
		end
		else begin
			out_neq <= in_neq ;
			out_zero <= in_zero;
			out_mux <= in_mux;
			out_rd2 <= in_rd2;
			out_pc_bgt <= in_pc_bgt;
			out_alu_out <= in_alu_out;
			out_Jump <= in_Jump;
			out_jump_addr <= in_jump_addr;
			out_RegWrite <= in_RegWrite;
			out_Branch <= in_Branch;
			out_memoryToreg <= inmemoryToreg;
			out_memoryRead <= inmemoryRead;
			out_memoryWrite <= inmemoryWrite;
		end
	end
	
endmodule

