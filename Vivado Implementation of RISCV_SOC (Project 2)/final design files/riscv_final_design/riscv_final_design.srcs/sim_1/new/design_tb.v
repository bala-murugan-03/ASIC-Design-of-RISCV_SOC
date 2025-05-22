`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2025 15:05:15
// Design Name: 
// Module Name: design_tb
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


module design_tb();

    // Clock and reset
    reg clk_i;
    reg rst_i;
    reg rst_axi_n;
    reg rst_cpu_i_0;
    reg [31:0] reset_vector_i_0;
    
    // AXI interface signals
    reg [31:0] inport_araddr_i_0;
    wire [31:0]gpio_output_o_0;
    wire [31:0]gpio_output_enable_o_0;
    wire spi_clk_o_0;
    wire spi_cs_o_0;
    reg spi_miso_i_0;
    wire spi_mosi_o_0;

    
    wire [31:0] inport_rdata_o_0;

    
    
    // Memory interface signals
    wire [3:0] mem_arid_o_0;
    reg [3:0] mem_rid_i_0;
    

    
    // UART
    wire uart_rxd_o_0;
    reg uart_txd_i_0;
    
    // Instantiate DUT
    design_1_wrapper dut (
        .clk_i_0(clk_i),
        .rst_i_0(rst_i),
        .s_axi_aresetn_0(rst_axi_n),
        .rst_cpu_i_0(rst_cpu_i_0),
        .inport_araddr_i_0(inport_araddr_i_0),
        .inport_rdata_o_0(inport_rdata_o_0),
        .mem_arid_o_0(mem_arid_o_0),
        .mem_rid_i_0(mem_rid_i_0),
        .uart_rxd_o_0(uart_rxd_o_0),
        .uart_txd_i_0(uart_txd_i_0),
        .gpio_output_o_0(gpio_output_o_0),
        .gpio_output_enable_o_0(gpio_output_enable_o_0),
        .spi_clk_o_0(spi_clk_o_0),
        .spi_cs_o_0(spi_cs_o_0),
        .spi_miso_i_0(spi_miso_i_0),
        .spi_mosi_o_0(spi_mosi_o_0)
        
    );
    // Clock generation
    always #5 clk_i = ~clk_i;
    
    // Test sequence
    initial begin
        // Initialize signals
        clk_i = 0;
        rst_i = 0;
        rst_axi_n = 1;
        inport_araddr_i_0 = 0;
        uart_txd_i_0 = 0;
        mem_rid_i_0 = 4'b0000;
        reset_vector_i_0 = 32'h0;
		rst_cpu_i_0 = 1'b0;
        // Reset pulse
        #20 rst_i = 1;
        rst_axi_n = 0;
        rst_cpu_i_0 = 1'b1;
        #20 rst_i = 0;
        rst_axi_n = 1;
        rst_cpu_i_0 = 1'b0;
        mem_rid_i_0 = 4'd8;
        
        
        // Finish test
        #50000;
        $finish;
    end
endmodule
