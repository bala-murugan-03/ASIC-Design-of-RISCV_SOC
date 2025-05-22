`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 10:48:25 PM
// Design Name: 
// Module Name: controller
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


module controller(
 input clk_i,
 input rst_i,
 output );
 
 11: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd0,5'd10,7'b0110011}; // ADD instruction
end
12: begin
    mem_i_inst_i = {7'h20,5'd2,5'd1,3'd0,5'd10,7'b0110011}; // SUB instruction
end
17: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd7,5'd10,7'b0110011}; // AND instruction
end
16: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd6,5'd10,7'b0110011}; // OR instruction
end
15: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd4,5'd10,7'b0110011}; // XOR instruction
end
18: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd1,5'd10,7'b0110011}; // SLL instruction
end
19: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd5,5'd10,7'b0110011}; // SRL instruction
end
20: begin
    mem_i_inst_i = {7'h20,5'd2,5'd1,3'd5,5'd10,7'b0110011}; // SRA instruction
end
13: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd2,5'd10,7'b0110011}; // SLT instruction
end
14: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd3,5'd10,7'b0110011}; // SLTU instruction
end
1: begin
    mem_i_inst_i = {12'd2,5'd1,3'd0,5'd10,7'b0010011}; // ADDI instruction with imm = 2
end
0: begin
    mem_i_inst_i = {12'd2,5'd1,3'd7,5'd10,7'b0010011}; // ANDI instruction with imm = 2
end
4: begin
    mem_i_inst_i = {12'd2,5'd1,3'd6,5'd10,7'b0010011}; // ORI instruction with imm = 2
end
5: begin
    mem_i_inst_i = {12'd2,5'd1,3'd4,5'd10,7'b0010011}; // XORI instruction with imm = 2
end
6: begin
    mem_i_inst_i = {7'h00,5'b01000,5'd1,3'd1,5'd10,7'b0010011}; // SLLI instruction with imm = 2
end
7: begin
    mem_i_inst_i = {7'h00,5'b01000,5'd1,3'd5,5'd10,7'b0010011}; // SRLI instruction with imm = 2
end
8: begin
    mem_i_inst_i = {7'h20,5'b01000,5'd1,3'd5,5'd10,7'b0010011}; // SRAI instruction with imm = 2
end
23: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd0,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
end
24: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd1,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
end
25: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd4,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
end
26: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd5,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
end
27: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd6,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
end
28: begin
    mem_i_inst_i = {7'h00,5'd2,5'd1,3'd7,4'b1,1'b0,7'b1100011}; // BEQ instruction with imm = 2
end
21: begin
    mem_i_inst_i = {1'b0, 10'd1, 9'b0,5'd10,7'b1101111}; // JAL instruction with imm = 2
end
22: begin
    mem_i_inst_i = {12'd2,5'd1,3'd0,5'd10,7'b1100111}; // JALR           
end
9: begin
    mem_i_inst_i = {20'd2,5'd10, 7'b0110111}; // LUI instruction with imm = 2
end
10: begin
    mem_i_inst_i = {20'd2,5'd10, 7'b0010111}; // AUIPC instruction with imm = 2
end
default: begin
    mem_i_inst_i = 32'h0; // Default opcode
end
endcase
end
end
endmodule

endmodule
