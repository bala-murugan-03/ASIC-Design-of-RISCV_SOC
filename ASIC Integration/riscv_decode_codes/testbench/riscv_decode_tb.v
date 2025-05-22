`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2025 12:25:32
// Design Name: 
// Module Name: riscv_decode_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module riscv_decode_tb;

  reg CLK, RST_N;
  reg [31:0] fetch_instr_i, fetch_pc_i;
  reg fetch_valid_i;
  reg branch_request_i;
  reg [31:0] branch_pc_i;
  reg branch_csr_request_i;
  reg [31:0] branch_csr_pc_i;
  reg [4:0] writeback_exec_idx_i, writeback_mem_idx_i, writeback_csr_idx_i, writeback_muldiv_idx_i;
  reg [31:0] writeback_exec_value_i, writeback_mem_value_i, writeback_csr_value_i, writeback_muldiv_value_i;
  reg writeback_exec_squash_i, writeback_mem_squash_i, writeback_csr_squash_i, writeback_muldiv_squash_i;
  reg exec_stall_i,lsu_stall_i,csr_stall_i;
  
 wire fetch_branch_o,fetch_accept_o,fetch_invalidate_o;
 wire [31:0] fetch_branch_pc_o;
 wire exec_opcode_valid_o,lsu_opcode_valid_o,csr_opcode_valid_o,muldiv_opcode_valid_o;
 wire [57:0] opcode_instr_o;
 wire [31:0] opcode_opcode_o,opcode_pc_o;
 wire [4:0] opcode_rd_idx_o,opcode_ra_idx_o,opcode_rb_idx_o;
 wire [31:0] opcode_ra_operand_o,opcode_rb_operand_o;
 
 
  riscv_decode dut (
    .CLK(CLK),
    .RST_N(RST_N),
    .fetch_instr_i(fetch_instr_i),
    .fetch_pc_i(fetch_pc_i),
    .fetch_valid_i(fetch_valid_i),
    .fetch_accept_o(fetch_accept_o),
    .fetch_invalidate_o(fetch_invalidate_o),
    .opcode_instr_o(opcode_instr_o),
    .opcode_opcode_o(opcode_opcode_o),
    .opcode_pc_o(opcode_pc_o),
    .exec_opcode_valid_o(exec_opcode_valid_o),
    .lsu_opcode_valid_o(lsu_opcode_valid_o),
    .muldiv_opcode_valid_o(muldiv_opcode_valid_o),
    .csr_opcode_valid_o(csr_opcode_valid_o),
    .branch_request_i(branch_request_i),
    .branch_pc_i(branch_pc_i),
    .branch_csr_request_i(branch_csr_request_i),
    .branch_csr_pc_i(branch_csr_pc_i),
    .fetch_branch_o(fetch_branch_o),
    .fetch_branch_pc_o(fetch_branch_pc_o),
    .writeback_exec_idx_i(writeback_exec_idx_i),
    .writeback_exec_value_i(writeback_exec_value_i),
    .writeback_exec_squash_i(writeback_exec_squash_i),
    .writeback_mem_idx_i(writeback_mem_idx_i),
    .writeback_mem_value_i(writeback_mem_value_i),
    .writeback_mem_squash_i(writeback_mem_squash_i),
    .writeback_csr_idx_i(writeback_csr_idx_i),
    .writeback_csr_value_i(writeback_csr_value_i),
    .writeback_csr_squash_i(writeback_csr_squash_i),
    .writeback_muldiv_idx_i(writeback_muldiv_idx_i),
    .writeback_muldiv_value_i(writeback_muldiv_value_i),
    .writeback_muldiv_squash_i(writeback_muldiv_squash_i),
    .opcode_rd_idx_o(opcode_rd_idx_o),
    .opcode_ra_idx_o(opcode_ra_idx_o),
    .opcode_rb_idx_o(opcode_rb_idx_o),
    .opcode_ra_operand_o(opcode_ra_operand_o),
    .opcode_rb_operand_o(opcode_rb_operand_o),
    .exec_stall_i(exec_stall_i),
    .lsu_stall_i(lsu_stall_i),
    .csr_stall_i(csr_stall_i)
  );

  // Clock generation
  always #10 CLK = ~CLK;

  initial begin
    CLK = 1'b0;
    RST_N = 1'b1;
    fetch_valid_i = 0;
    branch_csr_request_i=0;
    branch_request_i = 0;
    branch_csr_request_i = 0;
    fetch_instr_i =32'h00000000;
    fetch_pc_i = 32'h00000000;
    exec_stall_i=1'b0;
    lsu_stall_i=1'b0;
    csr_stall_i=1'b0;
    writeback_exec_squash_i = 0;
      writeback_exec_idx_i = 0;
      writeback_exec_value_i = 0 ;
      writeback_mem_squash_i = 0;
      writeback_mem_idx_i = 0;
      writeback_mem_value_i = 0;
      writeback_csr_idx_i = 0;
      writeback_csr_squash_i = 0;
      writeback_csr_value_i = 0;
      writeback_muldiv_idx_i = 0;
      writeback_muldiv_squash_i = 0;
      writeback_muldiv_value_i = 0; 
      branch_pc_i =0;
      branch_csr_pc_i =0;
    #60 RST_N = 0;
    
// test case 0;
//  addi x2, x2, 5
    #30
    fetch_instr_i = 32'b00000000010100010000000100010011;
    fetch_pc_i = 32'h00000011;
    fetch_valid_i = 1;
    

   #30 // Test Case 1: Fetch an instruction (R type)
    fetch_instr_i = 32'b00000000000100010000000110110011; // ADD operation
    fetch_pc_i = 32'h00000001;
    fetch_valid_i = 1;
    
     // #10 fetch_valid_i= 0;
       /*[31:25] funct7  = 0000000  
[24:20] rs2     = 00001     → x1  
[19:15] rs1     = 00010     → x2  
[14:12] funct3  = 000  
[11:7]  rd      = 00011     → x3  
[6:0]   opcode  = 0110011   → Integer Register-Register operations (R-type)
  */
      //stalls
     
      #30 // decoding load/store instruction (I type)
      fetch_instr_i = 32'b00000000001101100101000010000011; // lhu -load half word;
       fetch_pc_i = 32'h00000011;
        fetch_valid_i = 1;
        
        #30 // decoding the store instructions (S type)
              fetch_instr_i = 32'b00001011111000111010001010100011; // sw
               fetch_pc_i = 32'h00100011;
                fetch_valid_i = 1;
       
         #30 // decoding Branch instructions (B type)
          fetch_instr_i = 32'b11101010011010101000010101100011; // beq 
               fetch_pc_i = 32'h00111010;
                fetch_valid_i = 1;
       // U type instructions
         #30
         fetch_instr_i = 32'b01010000000000000101011100110111; // lui load upper immediate
               fetch_pc_i = 32'h1100111;
                fetch_valid_i = 1;
          #30
       // J type instruction
        fetch_instr_i = 32'b01000001011010100110001001101111; // JAL
               fetch_pc_i = 32'h1100101;
                fetch_valid_i = 1;

          #30  // csr signals
          fetch_instr_i = 32'b00000000000010011000111101110011; //ecall
               fetch_pc_i = 32'h1000111;
                fetch_valid_i = 1;
         
         
         
      #10
       exec_stall_i = 1;
       lsu_stall_i = 0;
       csr_stall_i= 0;
    //[31:0] branch_csr_pc_i, 
    // testing all write back(four)signals at a time to different registers
      writeback_exec_squash_i = 0;
      writeback_exec_idx_i = 5'b01001;
      writeback_exec_value_i = 32'b00000000000000000000000000000010 ;
      writeback_mem_squash_i = 0;
      writeback_mem_idx_i = 5'b10100;
      writeback_mem_value_i = 32'b00000000000000000000000000010010;
      writeback_csr_idx_i = 5'b11000;
      writeback_csr_squash_i = 0;
      writeback_csr_value_i = 32'b00000000000000000000000000010110;
      writeback_muldiv_idx_i = 5'b11110;
      writeback_muldiv_squash_i = 0;
      writeback_muldiv_value_i = 32'b00000000000000000000010000010110; 

 
     #30
       exec_stall_i = 0;
       lsu_stall_i = 0;
       csr_stall_i= 0;
    
    
    
#10
 branch_request_i = 1;
 branch_pc_i =  32'b00000000000000000000000000000111;
 
 #20
 branch_csr_request_i = 1;
  branch_csr_pc_i = 32'b00000000000000000000000000000101;
 
 #30
     writeback_csr_squash_i = 1;
      writeback_csr_value_i = 32'b00000000000000000000000011111110;
      writeback_csr_idx_i = 5'b11010;
     
    #5
      exec_stall_i = 0;
      lsu_stall_i=1;
      csr_stall_i=0;
     // branch signals
    
     
     
     
     
     
#100 $finish;

end

	initial
        begin
                $dumpfile("waveforms.vcd");
                $dumpvars(0, dut);
        end
endmodule








