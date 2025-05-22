`timescale 1ns / 1ps 
`include "def.v"

module riscv_exec(
	input clk_i,
	input rst_i,
	input opcode_valid_i,					// is instruction valid or not
	input [57:0] opcode_instr_i,			
	input [31:0] opcode_opcode_i,			// 32-bit instruction
	input [31:0] opcode_pc_i,				
	input [4:0]  opcode_rd_idx_i,			// destination reg
	input [4:0]  opcode_ra_idx_i,			// source reg 1
	input [4:0]  opcode_rb_idx_i,			// source reg 2
	input [31:0] opcode_ra_operand_i,	// value in source reg 1
	input [31:0] opcode_rb_operand_i,	// value in source reg 2
	
	output reg branch_request_o,				// make high to indicate branching
	output reg [31:0] branch_pc_o,				// target address for branch
	output reg [4:0] writeback_idx_o,			// index of destination register
	output reg writeback_squash_o,				// set zero
	output reg [31:0] writeback_value_o,		// final result
	output reg stall_o								// set zero
	);
	
	reg [0:0] branch_request 	;		//defines as to drive as output at posedge of clk. store results here according to execution.
	reg [31:0] branch_pc 		;		//defines as to drive as output at posedge of clk. store results here according to execution.
	//reg [4:0] //writeback_idx		;		//defines as to drive as output at posedge of clk. store results here according to execution.
	wire [0:0] writeback_squash	;		//defines as to drive as output at posedge of clk. store results here according to execution.
	wire [31:0] writeback_value	;		//defines as to drive as output at posedge of clk. store results here according to execution.
	wire [31:0] writeback_value2;		//defines as to drive as output at posedge of clk. store results here according to execution.
	wire [0:0] stall			;		//defines as to drive as output at posedge of clk. store results here according to execution.
	
	assign stall = 1'b0;
	assign writeback_squash = 1'b0;
	
	reg [3:0] 	alu_func_r;
	reg [31:0] 	alu_input_a_r;
	reg [31:0] 	alu_input_b_r;
	
	reg [3:0] 	alu_func_r2;
	reg [31:0] 	alu_input_a_r2;
	reg [31:0] 	alu_input_b_r2;
	
	//ALU instance
	riscv_alu u_alu 
		( 
			.alu_op_i(alu_func_r), 
			.alu_a_i(alu_input_a_r), 
			.alu_b_i(alu_input_b_r), 
			.alu_p_o(writeback_value) 
		); 
	
	riscv_alu u_alu2 
		( 
			.alu_op_i(alu_func_r2), 
			.alu_a_i(alu_input_a_r2), 
			.alu_b_i(alu_input_b_r2), 
			.alu_p_o(writeback_value2) 
		); 
		
	
	always @(posedge clk_i) //Confirm the type of reset
	begin
		if(rst_i & opcode_valid_i) begin
			branch_request_o 	<= branch_request;
			branch_pc_o 		<= branch_pc;
			writeback_idx_o		<= opcode_rd_idx_i;
			writeback_squash_o	<= writeback_squash;
			writeback_value_o	<= writeback_value;
			stall_o				<= stall;
		end
		else begin 
			branch_request_o 	<= 1'b0;
			branch_pc_o 		<= 32'b0;
			writeback_idx_o		<= 5'b0;
			writeback_squash_o	<= 1'b1;
			writeback_value_o	<= 32'b0;
			stall_o				<= 1'b0;
		end
	end
		
	always @(*)
	begin
		//0 = ANDI
		if(opcode_instr_i[`ENUM_INST_ANDI] == 1) begin
			alu_func_r 		= `ALU_AND;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_opcode_i[31:20];
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		// 1 = ADDI
		else if(opcode_instr_i[`ENUM_INST_ADDI] == 1) begin
			alu_func_r 		= `ALU_ADD;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_opcode_i[31:20];
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		// 4 = ORI
		else if(opcode_instr_i[`ENUM_INST_ORI] == 1) begin
			alu_func_r 		= `ALU_OR;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_opcode_i[31:20];
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		// 5 = XORI
		else if(opcode_instr_i[`ENUM_INST_XORI] == 1) begin
			alu_func_r 		= `ALU_XOR;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_opcode_i[31:20];
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		// 6 = SLLI
		else if(opcode_instr_i[`ENUM_INST_SLLI] == 1) begin
			alu_func_r 		= `ALU_SHIFTL;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= {27'b0,opcode_opcode_i[20],opcode_opcode_i[21],opcode_opcode_i[22],opcode_opcode_i[23],opcode_opcode_i[24]};
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		// 7 = SRLI
		else if(opcode_instr_i[`ENUM_INST_SRLI] == 1) begin
			alu_func_r 		= `ALU_SHIFTR;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= {27'b0,opcode_opcode_i[20],opcode_opcode_i[21],opcode_opcode_i[22],opcode_opcode_i[23],opcode_opcode_i[24]};
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		// 8 = SRAI
		else if(opcode_instr_i[`ENUM_INST_SRAI] == 1) begin
			alu_func_r 		= `ALU_SHIFTR_ARITH;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= {27'b0,opcode_opcode_i[20],opcode_opcode_i[21],opcode_opcode_i[22],opcode_opcode_i[23],opcode_opcode_i[24]};
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		
		//11 = ENUM_INST_ADD
		else if(opcode_instr_i[`ENUM_INST_ADD] == 1) begin
			alu_func_r 		= `ALU_ADD;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//12 = ENUM_INST_SUB
		else if(opcode_instr_i[`ENUM_INST_SUB] == 1) begin
			alu_func_r 		= `ALU_SUB;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//17 = ENUM_INST_AND
		else if(opcode_instr_i[`ENUM_INST_AND] == 1) begin
			alu_func_r 		= `ALU_AND;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//16 = ENUM_INST_OR
		else if(opcode_instr_i[`ENUM_INST_OR] == 1) begin
			alu_func_r 		= `ALU_OR;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//15 = ENUM_INST_XOR
		else if(opcode_instr_i[`ENUM_INST_XOR] == 1) begin
			alu_func_r 		= `ALU_XOR;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//18 = ENUM_INST_SLL
		else if(opcode_instr_i[`ENUM_INST_SLL] == 1) begin
			alu_func_r 		= `ALU_SHIFTL;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//19 = ENUM_INST_SRL
		else if(opcode_instr_i[`ENUM_INST_SRL] == 1) begin
			alu_func_r 		= `ALU_SHIFTR;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//20 = ENUM_INST_SRA
		else if(opcode_instr_i[`ENUM_INST_SRA] == 1) begin
			alu_func_r 		= `ALU_SHIFTR_ARITH;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//13 = ENUM_INST_SLT
		else if(opcode_instr_i[`ENUM_INST_SLT] == 1) begin
			alu_func_r 		= `ALU_LESS_THAN_SIGNED;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//14 = ENUM_INST_SLTU
		else if(opcode_instr_i[`ENUM_INST_SLTU] == 1) begin
			alu_func_r 		= `ALU_LESS_THAN;
			alu_input_a_r 	= opcode_ra_operand_i;
			alu_input_b_r	= opcode_rb_operand_i;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
        //23 = ENUM_INST_BEQ
		else if(opcode_instr_i[`ENUM_INST_BEQ] == 1) begin
			alu_func_r2     = `ALU_XOR;
			alu_input_a_r2  = opcode_ra_operand_i;
			alu_input_b_r2  = opcode_rb_operand_i;
		    if(writeback_value2 == 32'b0) begin
			    alu_func_r 		= `ALU_ADD;
			    alu_input_a_r 	= opcode_pc_i;
			    alu_input_b_r	= {opcode_opcode_i[31], opcode_opcode_i[7], opcode_opcode_i[30:25], opcode_opcode_i[11:8], 1'b0};		//LSB is not given in Instruction, so adding 0
                branch_request	= 1'b1;
                branch_pc       = writeback_value;
            end
            else begin
                branch_request  = 1'b0;
                branch_pc       = opcode_pc_i;
            end
		end
		
        //24 = ENUM_INST_BNE
		else if(opcode_instr_i[`ENUM_INST_BNE] == 1) begin
			alu_func_r2     = `ALU_XOR;
			alu_input_a_r2  = opcode_ra_operand_i;
			alu_input_b_r2  = opcode_rb_operand_i;
		    if(writeback_value2 != 32'b0) begin
			    alu_func_r 		= `ALU_ADD;
			    alu_input_a_r 	= opcode_pc_i;
			    alu_input_b_r	= {opcode_opcode_i[31], opcode_opcode_i[7], opcode_opcode_i[30:25], opcode_opcode_i[11:8], 1'b0};
                branch_request	= 1'b1;
                branch_pc       = writeback_value;
            end
            else begin
                branch_request  = 1'b0;
                branch_pc       = opcode_pc_i;
            end
		end
		
        //25 = ENUM_INST_BLT
		else if(opcode_instr_i[`ENUM_INST_BLT] == 1) begin
			alu_func_r2     = `ALU_LESS_THAN_SIGNED;
			alu_input_a_r2  = opcode_ra_operand_i;
			alu_input_b_r2  = opcode_rb_operand_i;
		    if(writeback_value2 != 32'b0) begin
			    alu_func_r 		= `ALU_ADD;
			    alu_input_a_r 	= opcode_pc_i;
			    alu_input_b_r	= {opcode_opcode_i[31], opcode_opcode_i[7], opcode_opcode_i[30:25], opcode_opcode_i[11:8], 1'b0};
                branch_request	= 1'b1;
                branch_pc       = writeback_value;
            end
            else begin
                branch_request  = 1'b0;
                branch_pc       = opcode_pc_i;
            end
		end
		
        //26 = ENUM_INST_BGE
		else if(opcode_instr_i[`ENUM_INST_BGE] == 1) begin
			alu_func_r2     = `ALU_LESS_THAN_SIGNED;
			alu_input_a_r2  = opcode_rb_operand_i;
			alu_input_b_r2  = opcode_ra_operand_i;
		    if(writeback_value2 != 32'b0) begin		
			    alu_func_r 		= `ALU_ADD;
			    alu_input_a_r 	= opcode_pc_i;
			    alu_input_b_r	= {opcode_opcode_i[31], opcode_opcode_i[7], opcode_opcode_i[30:25], opcode_opcode_i[11:8], 1'b0};
                branch_request	= 1'b1;
                branch_pc       = writeback_value;
            end
            else begin
                branch_request  = 1'b0;
                branch_pc       = opcode_pc_i;
            end
		end
		
        //27 = ENUM_INST_BLTU
		else if(opcode_instr_i[`ENUM_INST_BLTU] == 1) begin
			alu_func_r2     = `ALU_LESS_THAN;
			alu_input_a_r2  = opcode_ra_operand_i;
			alu_input_b_r2  = opcode_rb_operand_i;
		    if(writeback_value2 != 32'b0) begin
			    alu_func_r 		= `ALU_ADD;
			    alu_input_a_r 	= opcode_pc_i;
			    alu_input_b_r	= {opcode_opcode_i[31], opcode_opcode_i[7], opcode_opcode_i[30:25], opcode_opcode_i[11:8], 1'b0};
                branch_request	= 1'b1;
                branch_pc       = writeback_value;
            end
            else begin
                branch_request  = 1'b0;
                branch_pc       = opcode_pc_i;
            end
		end
		
		//28 = ENUM_INST_BGEU
		else if(opcode_instr_i[`ENUM_INST_BGEU] == 1) begin
			alu_func_r2     = `ALU_LESS_THAN;
			alu_input_a_r2  = opcode_ra_operand_i;
			alu_input_b_r2  = opcode_rb_operand_i;
		    if(writeback_value2 == 32'b0) begin
			    alu_func_r 		= `ALU_ADD;
			    alu_input_a_r 	= opcode_pc_i;
			    alu_input_b_r	= {opcode_opcode_i[31], opcode_opcode_i[7], opcode_opcode_i[30:25], opcode_opcode_i[11:8], 1'b0};
                branch_request	= 1'b1;
                branch_pc       = writeback_value;
            end
            else begin
                branch_request  = 1'b0;
                branch_pc       = opcode_pc_i;
            end
		end
		
		//21 = ENUM_INST_JAL
		else if(opcode_instr_i[`ENUM_INST_JAL] == 1) begin
			alu_func_r 		= `ALU_ADD;
			alu_input_a_r 	= opcode_pc_i;
			alu_input_b_r	= 32'h4;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b1;
			
			alu_func_r2     = `ALU_ADD;
			alu_input_a_r2  = opcode_pc_i;
			alu_input_b_r2  = {opcode_opcode_i[31], opcode_opcode_i[19:12], opcode_opcode_i[20], opcode_opcode_i[30:21], 1'b0};
			branch_pc 		= writeback_value2;
		end
		
		//22 = ENUM_INST_JALR
		else if(opcode_instr_i[`ENUM_INST_JALR] == 1) begin
			alu_func_r 		= `ALU_ADD;
			alu_input_a_r 	= opcode_pc_i;
			alu_input_b_r	= 32'h4;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b1;
			
			alu_func_r2     = `ALU_ADD;
			alu_input_a_r2  = opcode_ra_operand_i;
			alu_input_b_r2  = opcode_opcode_i[31:20];
			branch_pc 		= writeback_value2;
		end
		
		//9 = ENUM_INST_LUI
		else if(opcode_instr_i[`ENUM_INST_LUI] == 1) begin
			alu_func_r 		= `ALU_SHIFTL;
			alu_input_a_r 	= opcode_opcode_i[31:12];
			alu_input_b_r	= 32'd12;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
		end
		
		//10 = ENUM_INST_AUIPC
		else if(opcode_instr_i[`ENUM_INST_AUIPC] == 1) begin
			alu_func_r2 	= `ALU_SHIFTL;
			alu_input_a_r2 	= opcode_opcode_i[31:12];
			alu_input_b_r2	= 32'd12;
			//writeback_idx	= opcode_opcode_i[11:7 ];
			branch_request	= 1'b0;
			branch_pc		= opcode_pc_i;
			alu_func_r 		= `ALU_ADD;
			alu_input_a_r 	= opcode_pc_i;
			alu_input_b_r	= writeback_value2;
		end
		
		else begin
			alu_func_r      = 4'b0;
			alu_func_r2  	= 4'b0;
			alu_input_a_r	= 32'b0;
			alu_input_a_r2	= 32'b0;
			alu_input_b_r	= 32'b0;
			alu_input_b_r2	= 32'b0;
			branch_request	= 1'b0;
			branch_pc		= 32'b0;	
		end
		
	end
	
endmodule
