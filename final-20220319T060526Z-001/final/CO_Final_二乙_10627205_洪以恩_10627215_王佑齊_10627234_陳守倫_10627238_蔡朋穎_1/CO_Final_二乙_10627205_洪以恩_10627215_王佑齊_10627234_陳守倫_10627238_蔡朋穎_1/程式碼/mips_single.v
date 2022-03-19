//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
module mips_single( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt, pc_next,
                pc, pc_incr, dmem_rdata, jump_addr, branch_addr;

	// control signals
    wire RegWrite, Branch, PCSrc, PCSrc2, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump, neq, Bne ;
    wire [1:0] ALUOp;
    wire [2:0] Operation;
	
// ==================================================================================================== 

	wire c2_Regdst_Out, c2_aluSrc_Out, c2_MemoryTOReg_Out, c2_regWrite_Out, c2_memoryRead_Out, c2_memoryWrite_Out, c2_BrOut, c2_Jout, c2_Bne_out,
		 c3_regWrite_Out, c3_BrOut, c3_memoryTOreg_Out, c3_memoryRead_Out, c3_memoryWrite_Out, c3_Jout, c3_ZeroOut , c3_neqOut,
		 c4_regWriteOut, c4_memoryTOreg_Out ;
		 
	wire [1:0] c2_aluop_Out;
	wire [2:0] c2_CtlOut ;
	wire [5:0] c2_OpOut ;
	
	wire [4:0] c2_RtOut, c2_RdOut, c3_MUXOut, c4_MUXOut;
	
	wire [31:0] c1_pcout, c1_instrout, 
				c2_pcout, c2_OutRD1, c2_OutRD2, c2_extend_Out, c2_Jout_addr,
				 c3_pcout, c3_aluOut, c3_OutRD2, c3_Jout_addr,
				 c4_RDOut, c4_aluOut;
				
//cycle====================================================================================================


    assign funct = c1_instrout[5:0];
	assign shamt = c1_instrout[10:6];
    assign immed = c1_instrout[15:0];
	assign rd = c1_instrout[15:11];
	assign rt = c1_instrout[20:16];
	assign rs = c1_instrout[25:21];
	assign jumpoffset = c1_instrout[25:0];
	assign opcode = c1_instrout[31:26];
	
//====================================================================================================


	// branch offset shifter
    assign b_offset = c2_extend_Out << 2;
	// jump offset shifter & concatenation
	assign jump_addr = { pc_incr[31:28], jumpoffset << 2 };

	// module instantiations
				   	
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );
	// sign-extender
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) );
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );

    add32 BRADD( .a(c2_pcout), .b(b_offset), .result(b_tgt) );

    and BR_AND(PCSrc, c3_BrOut, c3_ZeroOut );
	
	
    mux2 #(5) RFMUX( .sel(c2_Regdst_Out), .a(c2_RtOut), .b(c2_RdOut), .y(rfile_wn) );
	
	
    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(c3_pcout), .y(branch_addr) );

	
	mux2 #(32) JMUX( .sel(c3_Jout), .a(branch_addr), .b(c3_Jout_addr), .y(pc_next) );
	
    mux2 #(32) ALUMUX( .sel(c2_aluSrc_Out), .a(c2_OutRD2), .b(c2_extend_Out), .y(alu_b) );

    mux2 #(32) WRMUX( .sel(c4_memoryTOreg_Out), .a(c4_aluOut), .b(c4_RDOut), .y(rfile_wd) ); // jal
	

    control_single CTL(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), 
                       .Jump(Jump), .ALUOp(ALUOp), .instr(c1_instrout), .Bne(Bne) );

    alu_ctl ALUCTL( .ALUOp(ALUOp), .Funct(funct), .ALUOperation(Operation) );
	
	TotalALU TotalALU( .dataA(c2_OutRD1), .dataB(alu_b), .Signal(c2_OpOut), .immediate(c2_extend_Out[15:0]), .operation(c2_CtlOut), .Output(alu_out), .zero(Zero), .neq(neq), .BneSignal(c2_Bne_out) );
	
	reg_file RegFile( .clk(clk), .RegWrite(c4_regWriteOut), .RN1(rs), .RN2(rt), .WN(c4_MUXOut), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );

	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) );

	memory DatMem( .clk(clk), .MemRead(c3_memoryRead_Out), .MemWrite(c3_memoryWrite_Out), .wd(c3_OutRD2), 
				   .addr(c3_aluOut), .rd(dmem_rdata) );	
				   
//==========================================================================================================================================

	IF_to_ID C1(.clk(clk), .rst(rst), .pc(pc_incr) , .instruction(instr), .pc_out(c1_pcout), .instruction_out(c1_instrout));
	//cycle1
	
	ID_to_EX C2(.clk(clk), .rst(rst), .pc_in(c1_pcout),.pc_out(c2_pcout),.in_RegDst(RegDst), .in_ALUSrc(ALUSrc), .in_memorytoReg(MemtoReg), .inRegWrite(RegWrite), 
				 .in_memoryRead(MemRead), .inMemWrite(MemWrite), .in_Branch_sel(Branch), .in_Jump_sel(Jump), .outRegDst(c2_Regdst_Out), .outALUSrc(c2_aluSrc_Out), 
				 .out_memoryToreg(c2_MemoryTOReg_Out), .outRegWrite(c2_regWrite_Out), .outmemoryRead(c2_memoryRead_Out), .outmemoryWrite(c2_memoryWrite_Out), .out_Branch_sel(c2_BrOut), 
				 .out_Jump_sel(c2_Jout),.inRD1(rfile_rd1), .inRD2(rfile_rd2), .inextend_immediate(extend_immed),.outRD1(c2_OutRD1), .outRD2(c2_OutRD2), 
				 .outextend_immediate(c2_extend_Out), .inrt(rt), .inrd(rd), .outrt(c2_RtOut), .outrd(c2_RdOut), .inopcode(opcode), .outopcode(c2_OpOut), .inoperation(Operation), 
				 .outoperation(c2_CtlOut), .in_jump_addr(jump_addr), .out_jump_addr(c2_Jout_addr), .in_Bne(Bne), .out_Bne(c2_Bne_out));

	//cycle2
	
	EX_to_MEM C3(.clk(clk), .rst(rst), .in_RegWrite(c2_regWrite_Out), .in_Branch(c2_BrOut), .inmemoryToreg(c2_MemoryTOReg_Out),  .inmemoryRead(c2_memoryRead_Out), .inmemoryWrite(c2_memoryWrite_Out),
					.in_Jump(c2_Jout), .in_pc_bgt(b_tgt), .in_zero(Zero), .in_neq(neq), .in_alu_out(alu_out), .in_rd2(c2_OutRD2), .in_mux(rfile_wn), 
					 .out_pc_bgt(c3_pcout), .out_zero(c3_ZeroOut), .out_neq(c3_neqOut), .out_alu_out(c3_aluOut), .out_rd2(c3_OutRD2), .out_mux(c3_MUXOut),
			      .out_RegWrite(c3_regWrite_Out), .out_Branch(c3_BrOut), .out_memoryToreg(c3_memoryTOreg_Out), .out_memoryRead(c3_memoryRead_Out), .out_memoryWrite(c3_memoryWrite_Out), 
				  .out_Jump(c3_Jout), .in_jump_addr(c2_Jout_addr), .out_jump_addr(c3_Jout_addr));
				 
	//cycle3
				  
				  
	MEM_to_WB C4(.clk(clk), .rst(rst), .in_regWrite(c3_regWrite_Out), .in_memoryToreg(c3_memoryTOreg_Out),
			       .in_rd(dmem_rdata), .in_alu_out(c3_aluOut), .in_mux(c3_MUXOut), .out_rd(c4_RDOut),.out_alu_out(c4_aluOut), 
				  .out_mux(c4_MUXOut), .out_regWrite(c4_regWriteOut), .out_memoryToreg(c4_memoryTOreg_Out) );
	//cycle4
				  
//==============================================================================================================================================
endmodule
