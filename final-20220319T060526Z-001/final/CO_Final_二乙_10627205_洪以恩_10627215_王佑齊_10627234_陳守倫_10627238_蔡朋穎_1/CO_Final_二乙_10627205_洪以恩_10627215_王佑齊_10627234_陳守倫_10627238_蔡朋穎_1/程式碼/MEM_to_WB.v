
module MEM_to_WB(clk, rst, in_regWrite, in_memoryToreg, in_rd, in_alu_out, in_mux, out_rd, out_alu_out, out_mux,out_regWrite, out_memoryToreg );

	input clk, rst;
	input [4:0] in_mux;
	input [31:0] in_rd, in_alu_out;
	input in_regWrite, in_memoryToreg ;
	
	output [4:0] out_mux;
	output [31:0] out_rd, out_alu_out;
	output out_regWrite, out_memoryToreg;
	
//========================================================================================================
	reg [4:0] out_mux;
	reg [31:0] out_rd, out_alu_out;
	reg out_regWrite, out_memoryToreg ;
//========================================================================================================

	always @(posedge clk) begin
		if (rst) begin
			out_regWrite <= 1'b0;
			out_memoryToreg <= 1'b0;
			out_mux <= 5'b0;
			out_rd <= 32'b0;
			out_alu_out <= 32'b0;
		end
		else begin
			out_mux <= in_mux;
			out_rd <= in_rd;
			out_alu_out <= in_alu_out;
			out_regWrite <= in_regWrite;
			out_memoryToreg <= in_memoryToreg;
		end
	end
	
endmodule
