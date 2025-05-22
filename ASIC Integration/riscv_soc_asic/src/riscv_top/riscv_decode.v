`include "def.v"
module riscv_decode(

    // Clock and Reset
    input wire clk_i, 
    input wire rst_i, 

    // Instruction Fetch Inputs
    input wire fetch_valid_i, 
    input wire [31:0] fetch_instr_i, 
    input wire [31:0] fetch_pc_i, 

    // Branch Inputs
    input wire branch_request_i, 
    input wire [31:0] branch_pc_i, 
    input wire branch_csr_request_i,
    input wire [31:0] branch_csr_pc_i,

    // Writeback Inputs
    input wire [4:0] writeback_exec_idx_i,
    input wire writeback_exec_squash_i, 
    input wire [31:0] writeback_exec_value_i, 
    input wire [4:0] writeback_mem_idx_i, 
    input wire writeback_mem_squash_i, 
    input wire [31:0] writeback_mem_value_i,
    input wire [4:0] writeback_csr_idx_i,
    input wire writeback_csr_squash_i, 
    input wire [31:0] writeback_csr_value_i,
    input wire [4:0] writeback_muldiv_idx_i, 
    input wire writeback_muldiv_squash_i,
    input wire [31:0] writeback_muldiv_value_i,

    // Stall Inputs
    input wire exec_stall_i, 
    input wire lsu_stall_i, 
    input wire csr_stall_i, 

    // Fetch Control Outputs
    output reg fetch_branch_o, 
    output reg [31:0] fetch_branch_pc_o, 
    output reg fetch_accept_o, 
    output reg fetch_invalidate_o,
 
    // Opcode Validation Outputs
    output reg exec_opcode_valid_o, 
    output reg lsu_opcode_valid_o,
    output reg csr_opcode_valid_o, 
    output reg muldiv_opcode_valid_o,

    // Decoded Instruction Outputs
    output reg [57:0] opcode_instr_o,
    output reg [31:0] opcode_opcode_o,
    output reg [31:0] opcode_pc_o,

    // Register Operand Outputs
    output reg [4:0] opcode_rd_idx_o, 
    output reg [4:0] opcode_ra_idx_o, 
    output reg [4:0] opcode_rb_idx_o, 
    output reg [31:0] opcode_ra_operand_o,
    output reg [31:0] opcode_rb_operand_o 
    
);
   
    wire [56:0] op_instr;

   always @(posedge clk_i) begin
    if (rst_i) 
     begin 
        opcode_instr_o <= 0;
        opcode_opcode_o <= 0;
        opcode_pc_o <= 0;
        fetch_accept_o <=0;
        fetch_invalidate_o <= 0;
     end 
    else
     begin
        fetch_accept_o <= (!((exec_stall_i)|| (lsu_stall_i) || (csr_stall_i)));
        opcode_instr_o <= 0;
        if (fetch_valid_i) 
        begin
             opcode_opcode_o <= fetch_instr_i;
             opcode_pc_o <= fetch_pc_i;
             fetch_invalidate_o <= 1'b0;
             
             if(op_instr[56:0] == 57'd0)
                opcode_instr_o[57] <= 1;
             else
                opcode_instr_o <= op_instr;   
        end
     end 
   end
        

  always @(posedge clk_i) begin
     if (rst_i) 
     begin
        fetch_branch_o <= 1'b0;
        fetch_branch_pc_o <= 0;
     end  
     else begin
     if(branch_request_i) begin
      fetch_branch_o <= 1'b1;
      fetch_branch_pc_o <= branch_pc_i;         
      end
           else if(branch_csr_request_i)
           begin
                fetch_branch_o <= 1'b1;
                fetch_branch_pc_o <= branch_csr_pc_i; 
           end 
          else
          fetch_branch_o <= 1'b0; 
       end 
    end
    
   
integer i;


wire [4:0] t1,t2,t3;

 wire [31:0] data1, data2;
 wire [31:0] writeback_exec_value, writeback_mem_value, writeback_csr_value, writeback_muldiv_value;
 wire [4:0] writeback_exec_idx, writeback_mem_idx, writeback_csr_idx, writeback_muldiv_idx;
 assign  t1 =  fetch_instr_i[11:7]; // rd_index
 assign  t2 =  fetch_instr_i[19:15]; // ra_index
 assign  t3 =  fetch_instr_i[24:20]; // rb_index
 
 assign writeback_exec_value = writeback_exec_value_i & {32{~writeback_exec_squash_i}};
 assign writeback_mem_value = writeback_mem_value_i & {32{~writeback_mem_squash_i}};
 assign writeback_csr_value = writeback_csr_value_i & {32{~writeback_csr_squash_i}};
 assign writeback_muldiv_value = writeback_muldiv_value_i & {32{~writeback_muldiv_squash_i}};
 
 assign writeback_exec_idx = writeback_exec_idx_i & {5{~writeback_exec_squash_i}};
 assign writeback_mem_idx = writeback_mem_idx_i & {5{~writeback_mem_squash_i}};
 assign writeback_csr_idx = writeback_csr_idx_i & {5{~writeback_csr_squash_i}};
 assign writeback_muldiv_idx = writeback_muldiv_idx_i & {5{~writeback_muldiv_squash_i}};
 
riscv_regfile reg_file_i
(
// Inputs
.clk_i(clk_i),.rst_i(rst_i),.rd0_i(writeback_exec_idx)
,.rd1_i(writeback_mem_idx)
,.rd2_i(writeback_csr_idx)
,.rd3_i(writeback_muldiv_idx)
,.rd0_value_i(writeback_exec_value)
,.rd1_value_i(writeback_mem_value)
,.rd2_value_i(writeback_csr_value)
,.rd3_value_i(writeback_muldiv_value)
,.ra_i(t2)
,.rb_i(t3)
// Outputs
,.ra_value_o(data1)
,.rb_value_o(data2)
);

always @(posedge clk_i) begin
    opcode_rd_idx_o <= t1;
    opcode_ra_idx_o <= t2;
    opcode_rb_idx_o <= t3;
    opcode_ra_operand_o <= data1;
    opcode_rb_operand_o <= data2;    
end

wire [6:0] op_code;
assign  op_code = fetch_instr_i[6:0];
always @(posedge clk_i ) begin
      if (rst_i) 
      begin
          exec_opcode_valid_o <= 1'b0;
          lsu_opcode_valid_o  <= 1'b0;  
          csr_opcode_valid_o <= 1'b0;
          muldiv_opcode_valid_o <= 1'b0;
      end  
      else begin
      if(fetch_valid_i) begin
          if ((op_code == 7'b1100011) || (op_code == 7'b0010011) || (op_code == 7'b0110011) || (op_code == 7'b1101111) || (op_code == 7'b1100111)|| (op_code == 7'b0010111) )
                 exec_opcode_valid_o <= 1'b1;
          else if ((op_code == 7'b0000011) || (op_code == 7'b0100011) || (op_code == 7'b0110111))
                 lsu_opcode_valid_o <= 1'b1;
          else if(op_code == 7'b1110011) // changed
                 csr_opcode_valid_o <= 1'b1;   
          else if(op_instr[`ENUM_INST_MUL] | op_instr[`ENUM_INST_MULH] | op_instr[`ENUM_INST_MULHSU] | op_instr[`ENUM_INST_MULHU])
                 muldiv_opcode_valid_o <= 1'b1;
          else begin
                 exec_opcode_valid_o <= 1'b0;
                 lsu_opcode_valid_o <= 1'b0;
                 csr_opcode_valid_o <= 1'b0;
                 muldiv_opcode_valid_o <= 1'b0;
          end
      end
   end   
end
      
    assign op_instr[`ENUM_INST_ANDI]  = ((fetch_instr_i & `INST_ANDI_MASK)  == `INST_ANDI);  // ANDI  (0)
    assign op_instr[`ENUM_INST_ADDI]  = ((fetch_instr_i & `INST_ADDI_MASK)  == `INST_ADDI);  // ADDI  (1)
    assign op_instr[`ENUM_INST_SLTI]  = ((fetch_instr_i & `INST_SLTI_MASK)  == `INST_SLTI);  // SLTI  (2)
    assign op_instr[`ENUM_INST_SLTIU] = ((fetch_instr_i & `INST_SLTIU_MASK) == `INST_SLTIU); // SLTIU (3)
    assign op_instr[`ENUM_INST_ORI]   = ((fetch_instr_i & `INST_ORI_MASK)   == `INST_ORI);   // ORI   (4)
    assign op_instr[`ENUM_INST_XORI]  = ((fetch_instr_i & `INST_XORI_MASK)  == `INST_XORI);  // XORI  (5)
    assign op_instr[`ENUM_INST_SLLI]  = ((fetch_instr_i & `INST_SLLI_MASK)  == `INST_SLLI);  // SLLI  (6)
    assign op_instr[`ENUM_INST_SRLI]  = ((fetch_instr_i & `INST_SRLI_MASK)  == `INST_SRLI);  // SRLI  (7)
    assign op_instr[`ENUM_INST_SRAI]  = ((fetch_instr_i & `INST_SRAI_MASK)  == `INST_SRAI);  // SRAI  (8)
    assign op_instr[`ENUM_INST_LUI]   = ((fetch_instr_i & `INST_LUI_MASK)   == `INST_LUI);   // LUI   (9)
    assign op_instr[`ENUM_INST_AUIPC] = ((fetch_instr_i & `INST_AUIPC_MASK) == `INST_AUIPC); // AUIPC (10)
    assign op_instr[`ENUM_INST_ADD]   = ((fetch_instr_i & `INST_ADD_MASK)   == `INST_ADD);   // ADD   (11)
    assign op_instr[`ENUM_INST_SUB]   = ((fetch_instr_i & `INST_SUB_MASK)   == `INST_SUB);   // SUB   (12)
    assign op_instr[`ENUM_INST_SLT]   = ((fetch_instr_i & `INST_SLT_MASK)   == `INST_SLT);   // SLT   (13)
    assign op_instr[`ENUM_INST_SLTU]  = ((fetch_instr_i & `INST_SLTU_MASK)  == `INST_SLTU);  // SLTU  (14)
    assign op_instr[`ENUM_INST_XOR]   = ((fetch_instr_i & `INST_XOR_MASK)   == `INST_XOR);   // XOR   (15)
    assign op_instr[`ENUM_INST_OR]    = ((fetch_instr_i & `INST_OR_MASK)    == `INST_OR);    // OR    (16)
    assign op_instr[`ENUM_INST_AND]   = ((fetch_instr_i & `INST_AND_MASK)   == `INST_AND);   // AND   (17)
    assign op_instr[`ENUM_INST_SLL]   = ((fetch_instr_i & `INST_SLL_MASK)   == `INST_SLL);   // SLL   (18)
    assign op_instr[`ENUM_INST_SRL]   = ((fetch_instr_i & `INST_SRL_MASK)   == `INST_SRL);   // SRL   (19)
    assign op_instr[`ENUM_INST_SRA]   = ((fetch_instr_i & `INST_SRA_MASK)   == `INST_SRA);   // SRA   (20)
    assign op_instr[`ENUM_INST_JAL]   = ((fetch_instr_i & `INST_JAL_MASK)   == `INST_JAL);   // JAL   (21)
    assign op_instr[`ENUM_INST_JALR]  = ((fetch_instr_i & `INST_JALR_MASK)  == `INST_JALR);  // JALR  (22)
    assign op_instr[`ENUM_INST_BEQ]   = ((fetch_instr_i & `INST_BEQ_MASK)   == `INST_BEQ);   // BEQ   (23)
    assign op_instr[`ENUM_INST_BNE]   = ((fetch_instr_i & `INST_BNE_MASK)   == `INST_BNE);   // BNE   (24)
    assign op_instr[`ENUM_INST_BLT]   = ((fetch_instr_i & `INST_BLT_MASK)   == `INST_BLT);   // BLT   (25)
    assign op_instr[`ENUM_INST_BGE]   = ((fetch_instr_i & `INST_BGE_MASK)   == `INST_BGE);   // BGE   (26)
    assign op_instr[`ENUM_INST_BLTU]  = ((fetch_instr_i & `INST_BLTU_MASK)  == `INST_BLTU);  // BLTU  (27)
    assign op_instr[`ENUM_INST_BGEU]  = ((fetch_instr_i & `INST_BGEU_MASK)  == `INST_BGEU);  // BGEU  (28)
    assign op_instr[`ENUM_INST_LB]    = ((fetch_instr_i & `INST_LB_MASK)    == `INST_LB);    // LB    (29)
    assign op_instr[`ENUM_INST_LH]    = ((fetch_instr_i & `INST_LH_MASK)    == `INST_LH);    // LH    (30)
    assign op_instr[`ENUM_INST_LW]    = ((fetch_instr_i & `INST_LW_MASK)    == `INST_LW);    // LW    (31)
    assign op_instr[`ENUM_INST_LBU]   = ((fetch_instr_i & `INST_LBU_MASK)   == `INST_LBU);   // LBU   (32)
    assign op_instr[`ENUM_INST_LHU]   = ((fetch_instr_i & `INST_LHU_MASK)   == `INST_LHU);   // LHU   (33)
    assign op_instr[`ENUM_INST_LWU]   = ((fetch_instr_i & `INST_LWU_MASK)   == `INST_LWU);   // LWU   (34)
    assign op_instr[`ENUM_INST_SB]    = ((fetch_instr_i & `INST_SB_MASK)    == `INST_SB);    // SB    (35)
    assign op_instr[`ENUM_INST_SH]    = ((fetch_instr_i & `INST_SH_MASK)    == `INST_SH);    // SH    (36)
    assign op_instr[`ENUM_INST_SW]    = ((fetch_instr_i & `INST_SW_MASK)    == `INST_SW);    // SW    (37)
    assign op_instr[`ENUM_INST_ECALL]    = ((fetch_instr_i & `INST_ECALL_MASK)    == `INST_ECALL);    // ECALL    (38)
    assign op_instr[`ENUM_INST_EBREAK]   = ((fetch_instr_i & `INST_EBREAK_MASK)   == `INST_EBREAK);   // EBREAK   (39)
    assign op_instr[`ENUM_INST_ERET]     = ((fetch_instr_i & `INST_MRET_MASK)     == `INST_MRET);     // ERET     (40)
    assign op_instr[`ENUM_INST_CSRRW]    = ((fetch_instr_i & `INST_CSRRW_MASK)    == `INST_CSRRW);    // CSRRW    (41)
    assign op_instr[`ENUM_INST_CSRRS]    = ((fetch_instr_i & `INST_CSRRS_MASK)    == `INST_CSRRS);    // CSRRS    (42)
    assign op_instr[`ENUM_INST_CSRRC]    = ((fetch_instr_i & `INST_CSRRC_MASK)    == `INST_CSRRC);    // CSRRC    (43)
    assign op_instr[`ENUM_INST_CSRRWI]   = ((fetch_instr_i & `INST_CSRRWI_MASK)   == `INST_CSRRWI);   // CSRRWI   (44)
    assign op_instr[`ENUM_INST_CSRRSI]   = ((fetch_instr_i & `INST_CSRRSI_MASK)   == `INST_CSRRSI);   // CSRRSI   (45)
    assign op_instr[`ENUM_INST_CSRRCI]   = ((fetch_instr_i & `INST_CSRRCI_MASK)   == `INST_CSRRCI);   // CSRRCI   (46)
    assign op_instr[`ENUM_INST_MUL]      = ((fetch_instr_i & `INST_MUL_MASK)      == `INST_MUL);      // MUL      (47)
    assign op_instr[`ENUM_INST_MULH]     = ((fetch_instr_i & `INST_MULH_MASK)     == `INST_MULH);     // MULH     (48)
    assign op_instr[`ENUM_INST_MULHSU]   = ((fetch_instr_i & `INST_MULHSU_MASK)   == `INST_MULHSU);   // MULHSU   (49)
    assign op_instr[`ENUM_INST_MULHU]    = ((fetch_instr_i & `INST_MULHU_MASK)    == `INST_MULHU);    // MULHU    (50)
    assign op_instr[`ENUM_INST_DIV]      = ((fetch_instr_i & `INST_DIV_MASK)      == `INST_DIV);      // DIV      (51)
    assign op_instr[`ENUM_INST_DIVU]     = ((fetch_instr_i & `INST_DIVU_MASK)     == `INST_DIVU);     // DIVU     (52)
    assign op_instr[`ENUM_INST_REM]      = ((fetch_instr_i & `INST_REM_MASK)      == `INST_REM);      // REM      (53)
    assign op_instr[`ENUM_INST_REMU]     = ((fetch_instr_i & `INST_REMU_MASK)     == `INST_REMU);     // REMU     (54)
    assign op_instr[`ENUM_INST_FAULT]    = ((fetch_instr_i & `INST_FAULT_MASK)      == `INST_FAULT);    // FAULT  (55)
    assign op_instr[`ENUM_INST_PAGE_FAULT]  = ((fetch_instr_i & `INST_PAGE_FAULT_MASK) == `INST_PAGE_FAULT);  // PAGE_FAULT  (56) 
    
    endmodule



