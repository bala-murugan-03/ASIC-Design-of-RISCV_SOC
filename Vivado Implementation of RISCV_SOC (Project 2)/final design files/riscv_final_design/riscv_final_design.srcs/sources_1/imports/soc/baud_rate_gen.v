`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2025 22:11:37
// Design Name: 
// Module Name: baud_rate_gen
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


module baud_rate_gen #(
    parameter SYSTEM_CLK_FREQ = 100_000_000, // 100 MHz system clock
    parameter OUT_CLK_FREQ = 9600          // Desired baud rate
)(
    input wire clk,      // System clock input
    output reg out_clk   // Generated baud clock output
);


localparam integer HALF_PERIOD = SYSTEM_CLK_FREQ / (2 * OUT_CLK_FREQ);

reg [31:0] counter = 32'b0;
reg flag = 1'b0;

always @(posedge clk) begin
    if (counter >= HALF_PERIOD - 1) begin
        counter <= 32'b0;
        out_clk <= ~out_clk;
    end 
    else if (flag == 1'b0) begin
        out_clk <= 1;
        counter <= counter + 1;
        flag <= 1'b1;
    end 
    else begin
        counter <= counter + 1;
    end
end

endmodule
