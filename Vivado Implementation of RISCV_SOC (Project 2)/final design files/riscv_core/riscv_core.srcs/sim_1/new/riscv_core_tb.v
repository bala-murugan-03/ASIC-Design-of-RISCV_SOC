`timescale 1ns / 1ps

module riscv_core_tb;

    // Inputs
    reg           clk_i;
    reg           rst_i;
    reg  [31:0]   mem_d_data_rd_i;
    reg           mem_d_accept_i;
    reg           mem_d_ack_i;
    reg           mem_d_error_i;
    reg  [10:0]   mem_d_resp_tag_i;
    reg           mem_i_accept_i;
    reg           mem_i_valid_i;
    reg           mem_i_error_i;
    reg  [31:0]   mem_i_inst_i;
    reg           intr_i;
    reg  [31:0]   reset_vector_i;
    reg  [31:0]   cpu_id_i;

    // Outputs
    wire [31:0]   mem_d_addr_o;
    wire [31:0]   mem_d_data_wr_o;
    wire          mem_d_rd_o;
    wire [3:0]    mem_d_wr_o;
    wire          mem_d_cacheable_o;
    wire [10:0]   mem_d_req_tag_o;
    wire          mem_d_invalidate_o;
    wire          mem_d_flush_o;
    wire          mem_i_rd_o;
    wire          mem_i_flush_o;
    wire          mem_i_invalidate_o;
    wire [31:0]   mem_i_pc_o;

    // Instantiate the RISC-V core
    riscv_core uut (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .mem_d_data_rd_i(mem_d_data_rd_i),
        .mem_d_accept_i(mem_d_accept_i),
        .mem_d_ack_i(mem_d_ack_i),
        .mem_d_error_i(mem_d_error_i),
        .mem_d_resp_tag_i(mem_d_resp_tag_i),
        .mem_i_accept_i(mem_i_accept_i),
        .mem_i_valid_i(mem_i_valid_i),
        .mem_i_error_i(mem_i_error_i),
        .mem_i_inst_i(mem_i_inst_i),
        .intr_i(intr_i),
        .reset_vector_i(reset_vector_i),
        .cpu_id_i(cpu_id_i),
        .mem_d_addr_o(mem_d_addr_o),
        .mem_d_data_wr_o(mem_d_data_wr_o),
        .mem_d_rd_o(mem_d_rd_o),
        .mem_d_wr_o(mem_d_wr_o),
        .mem_d_cacheable_o(mem_d_cacheable_o),
        .mem_d_req_tag_o(mem_d_req_tag_o),
        .mem_d_invalidate_o(mem_d_invalidate_o),
        .mem_d_flush_o(mem_d_flush_o),
        .mem_i_rd_o(mem_i_rd_o),
        .mem_i_flush_o(mem_i_flush_o),
        .mem_i_invalidate_o(mem_i_invalidate_o),
        .mem_i_pc_o(mem_i_pc_o)
    );

    // Clock generation
    always #10 clk_i = ~clk_i;

    initial begin
    
        // Initialize inputs
        clk_i = 0;
        rst_i = 0;
        mem_d_data_rd_i = 0;
        mem_d_accept_i = 0;
        mem_d_ack_i = 0;
        mem_d_error_i = 0;
        mem_d_resp_tag_i = 0;
        mem_i_accept_i = 0;
        mem_i_valid_i = 0;
        mem_i_error_i = 0;
        mem_i_inst_i = 32'h00000000; // NOP instruction (ADDI x0, x0, 0)
        intr_i = 0;
        reset_vector_i = 32'h00000002;
        cpu_id_i = 32'h00000001;

        // Reset sequence
        #30 rst_i = 1;
       #10 mem_i_accept_i = 1; mem_i_valid_i = 1;
     
        // csr instruction mstatus
       #20 mem_i_inst_i = {12'b000000110000, 5'b01010, 3'b001, 5'b00101, 7'b1110011};



        // ADD instruction
      //  #20 mem_i_inst_i = {7'h00,5'd2,5'd1,3'd0,5'd10,7'b0110011}; // ADD instruction
        // immediate instructions
       // #20 mem_i_inst_i = {12'd2,5'd1,3'd0,5'd10,7'b0010011}; // ADDI instruction with imm = 2
        // branch instructions
      //  #20 mem_i_inst_i = {7'h00,5'd2,5'd2,3'd0,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
        // jump instructions
       // #20 mem_i_inst_i = {1'b0, 10'd1, 9'b0,5'd10,7'b1101111}; // JAL instruction with imm = 2
         // Test Load/Store instructions
       // #20 mem_i_inst_i = {20'd2,5'd10, 7'b0110111}; // LUI instruction with imm = 2
      /* #10 mem_i_inst_i = {7'h20,5'd2,5'd1,3'd0,5'd10,7'b0110011}; // SUB instruction
       

        // Test immediate instructions
        #10 mem_i_inst_i = {12'd2,5'd1,3'd0,5'd10,7'b0010011}; // ADDI instruction with imm = 2
        #10 mem_i_inst_i = {12'd2,5'd1,3'd7,5'd10,7'b0010011}; // ANDI instruction with imm = 2
        #10 mem_i_inst_i = {12'd2,5'd1,3'd6,5'd10,7'b0010011}; // ORI instruction with imm = 2
        #10 mem_i_inst_i = {12'd2,5'd1,3'd4,5'd10,7'b0010011}; // XORI instruction with imm = 2
        #10 mem_i_inst_i = {7'h00,5'b01000,5'd1,3'd1,5'd10,7'b0010011}; // SLLI instruction with imm = 2
        #10 mem_i_inst_i = {7'h00,5'b01000,5'd1,3'd5,5'd10,7'b0010011}; // SRLI instruction with imm = 2
        #10 mem_i_inst_i = {7'h20,5'b01000,5'd1,3'd5,5'd10,7'b0010011}; // SRAI instruction with imm = 2

        // Test Branch instructions (BEQ with different cases)
        #10 mem_i_inst_i = {7'h00,5'd2,5'd1,3'd0,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
        #10 mem_i_inst_i = {7'h00,5'd2,5'd1,3'd1,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
        #10 mem_i_inst_i = {7'h00,5'd2,5'd1,3'd4,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
        #10 mem_i_inst_i = {7'h00,5'd2,5'd1,3'd5,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
        #10 mem_i_inst_i = {7'h00,5'd2,5'd1,3'd6,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
        #10 mem_i_inst_i = {7'h00,5'd2,5'd1,3'd7,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2

        // Test Jump and Link instructions
        #10 mem_i_inst_i = {1'b0, 10'd1, 9'b0,5'd10,7'b1101111}; // JAL instruction with imm = 2
        #10 mem_i_inst_i = {12'd2,5'd1,3'd0,5'd10,7'b1100111}; // JALR           

        // Test Load/Store instructions
        #10 mem_i_inst_i = {20'd2,5'd10, 7'b0110111}; // LUI instruction with imm = 2
        #10 mem_i_inst_i = {20'd2,5'd10, 7'b0010111}; // AUIPC instruction with imm = 2*/
         
        // Finish simulation after a while
       #1000 $finish;
   end

endmodule 



