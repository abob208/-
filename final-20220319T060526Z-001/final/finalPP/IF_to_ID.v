module IF_to_ID(clk, rst,pc ,instruction, pc_out, instruction_out);

	input clk, rst;
	input [31:0] pc, instruction ;
	output [31:0] pc_out, instruction_out ;
	reg [31:0] pc_out, instruction_out ;

	
	always @( posedge clk ) begin
		if (rst) begin
			pc_out <= 32'b0;
			instruction_out <= 32'b0;
		end
		else begin
			pc_out <= pc ;
			instruction_out <= instruction ;
		end
	end
		
endmodule