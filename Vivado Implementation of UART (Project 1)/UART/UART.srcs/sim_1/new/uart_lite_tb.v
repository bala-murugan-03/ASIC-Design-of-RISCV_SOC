`timescale 1ns / 1ps

module uart_lite_tb;

// Testbench signals
reg clk_i;
reg rst_i;

// AXI-Lite Inputs
reg cfg_awvalid_i;
reg [31:0] cfg_awaddr_i;
reg cfg_wvalid_i;
reg [31:0] cfg_wdata_i;
reg [3:0] cfg_wstrb_i;
reg cfg_bready_i;
reg cfg_arvalid_i;
reg [31:0] cfg_araddr_i;
reg cfg_rready_i;
reg rx_i;

// AXI-Lite Outputs
wire cfg_awready_o;
wire cfg_wready_o;
wire cfg_bvalid_o;
wire [1:0] cfg_bresp_o;
wire cfg_arready_o;
wire cfg_rvalid_o;
wire [31:0] cfg_rdata_o;
wire [1:0] cfg_rresp_o;
wire tx_o;
wire intr_o;

// Instantiate UART Lite Module
uart_lite dut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .cfg_awvalid_i(cfg_awvalid_i),
    .cfg_awaddr_i(cfg_awaddr_i),
    .cfg_wvalid_i(cfg_wvalid_i),
    .cfg_wdata_i(cfg_wdata_i),
    .cfg_wstrb_i(cfg_wstrb_i),
    .cfg_bready_i(cfg_bready_i),
    .cfg_arvalid_i(cfg_arvalid_i),
    .cfg_araddr_i(cfg_araddr_i),
    .cfg_rready_i(cfg_rready_i),
    .rx_i(rx_i),
    .cfg_awready_o(cfg_awready_o),
    .cfg_wready_o(cfg_wready_o),
    .cfg_bvalid_o(cfg_bvalid_o),
    .cfg_bresp_o(cfg_bresp_o),
    .cfg_arready_o(cfg_arready_o),
    .cfg_rvalid_o(cfg_rvalid_o),
    .cfg_rdata_o(cfg_rdata_o),
    .cfg_rresp_o(cfg_rresp_o),
    .tx_o(tx_o),
    .intr_o(intr_o)
);

// Clock Generation
always #4 clk_i = ~clk_i; // 125MHz clk(10ns period)

initial begin
    // Initialize Inputs
    clk_i = 0;
    rst_i = 1;
    cfg_awvalid_i = 0;
    cfg_awaddr_i = 0;
    cfg_wvalid_i = 0;
    cfg_wdata_i = 0;
    cfg_wstrb_i = 4'b1111;
    cfg_bready_i = 0;
    cfg_arvalid_i = 0;
    cfg_araddr_i = 0;
    cfg_rready_i = 0;
    rx_i = 1; // Idle state for UART RX
    
    // Reset the DUT
    #20 rst_i = 0;
    #8000 rx_i = 0; // start bit
    #8000 rx_i = 1;
    #8000 rx_i = 1;
    #8000 rx_i = 1;
    #8000 rx_i = 0;
    #8000 rx_i = 1;
    #8000 rx_i = 0;
    #8000 rx_i = 0;
    #8000 rx_i = 1;
    #8000 rx_i = 1; // stop bit
    
    // Write TX Register (0x04) with data 0x55 ('U' ASCII)
    #10 cfg_awvalid_i = 1;
        cfg_awaddr_i = 32'h04;
        cfg_wvalid_i = 1;
        cfg_wdata_i = 32'h00000055;
        cfg_bready_i = 1;
    
    // Wait for write response
    wait (cfg_bvalid_o);
    #1000 cfg_awvalid_i = 0;
        cfg_wvalid_i = 0;
        cfg_bready_i = 0;
    
    // Control register
    #10 cfg_awvalid_i = 1;
        cfg_awaddr_i = 32'h0C;
        cfg_wvalid_i = 1;
        cfg_wdata_i = 32'd16;
        cfg_bready_i = 1;
    
    // Wait for write response
    wait (cfg_bvalid_o);
    #1000 cfg_awvalid_i = 0;
        cfg_wvalid_i = 0;
        cfg_bready_i = 0;
        cfg_wdata_i = 32'd0;
    
    // Read Status Register (0x08)
    #10 cfg_arvalid_i = 1;
        cfg_araddr_i = 32'h08;
        cfg_rready_i = 1;
    
    // Wait for read response
    wait (cfg_rvalid_o);
    #1000 cfg_arvalid_i = 0;
        cfg_rready_i = 0;
    
    #10 cfg_arvalid_i = 1;
        cfg_araddr_i = 32'h0000;
        cfg_rready_i = 1;
    
    // Wait for read response
    wait (cfg_rvalid_o);
    #1000 cfg_arvalid_i = 0;
        cfg_rready_i = 0;
    
    // End simulation
    #10 $finish;
end

endmodule
