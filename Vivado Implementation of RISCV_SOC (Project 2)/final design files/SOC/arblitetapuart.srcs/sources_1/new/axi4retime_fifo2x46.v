`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2025 22:23:59
// Design Name: 
// Module Name: axi4retime_fifo2x46
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

module axi4retime_fifo2x46 (
    input wire clk_i,
    input wire rst_i,
    input wire [45:0] data_in_i,
    input wire push_i,
    input wire pop_i,
    output reg [45:0] data_out_o,
    output wire accept_o,
    output wire valid_o
);

    // Internal signals
    reg [1:0] rd_ptr = 2'b00;  // Read pointer
    reg [1:0] wr_ptr = 2'b00;  // Write pointer
    reg [45:0] buffer[0:1];  // 2-entry buffer

    // Set accept and valid signals
    // Logic -> additional MSB bit used to determine if FIFO state when read and write pointers are equal
    assign accept_o = ((rd_ptr[0] == wr_ptr[0]) && (rd_ptr[1] != wr_ptr[1])) ? 1'b0 : 1'b1;
    assign valid_o = (rd_ptr == wr_ptr) ? 1'b0 : 1'b1;

    // Update FIFO and pointers sequentially
    always @(posedge clk_i) begin
        // Check if reset is low
        if (~rst_i) begin
            rd_ptr <= 2'b00;
            wr_ptr <= 2'b00;
            buffer[0] <= 0;
            buffer[1] <= 0;
            data_out_o <= 0;
        end
        else begin
            // Simultaneous push and pop
            // Can happen only when one entry in FIFO
            if (accept_o & push_i & valid_o & pop_i) begin
                data_out_o <= buffer[rd_ptr[0]];
                buffer[wr_ptr[0]] <= data_in_i;
                wr_ptr <= wr_ptr + 1;
                rd_ptr <= rd_ptr + 1;
            end
            // Push operation
            else if (accept_o & push_i) begin
                buffer[wr_ptr[0]] <= data_in_i;
                wr_ptr <= wr_ptr + 1;
                data_out_o <= 0;
            end
            // Pop operations
            else if (valid_o & pop_i) begin
                data_out_o <= buffer[rd_ptr[0]];
                rd_ptr <= rd_ptr + 1;
            end
        end
    end

endmodule