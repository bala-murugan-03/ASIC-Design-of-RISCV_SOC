`timescale 1ns/1ps

module spi_lite_tb;

    // Testbench signals
    // INPUTS
    reg clk_i = 1'b0;
    reg rst_i;
    reg cfg_awvalid_i ;      // Write enable
    reg [31:0] cfg_awaddr_i;  // Address for writes
    reg cfg_wvalid_i; 
    reg [31:0] cfg_wdata_i;   // Data to write 
 reg [3:0] cfg_wstrb_i;   
    reg cfg_bready_i;
    reg cfg_arvalid_i;
    reg [31:0] cfg_araddr_i;
    reg cfg_rready_i;
    reg spi_miso_i;
    
    // OUTPUTS
    wire cfg_awready_o;
    wire cfg_wready_o;
    wire cfg_bvalid_o;
    wire [1:0] cfg_bresp_o;
    wire cfg_arready_o;
    wire cfg_rvalid_o;
    wire [31:0] cfg_rdata_o;
    wire [1:0] cfg_rresp_o;
    wire spi_clk_o;
    wire spi_mosi_o;
    wire spi_cs_o;
    wire intr_o;
    
     // SPI Module Instantiation
    spi_lite uut (
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
        .spi_miso_i(spi_miso_i),
        .cfg_awready_o(cfg_awready_o),
        .cfg_wready_o(cfg_wready_o),
        .cfg_bvalid_o(cfg_bvalid_o),
        .cfg_bresp_o(cfg_bresp_o),
        .cfg_arready_o(cfg_arready_o),
        .cfg_rvalid_o(cfg_rvalid_o),
        .cfg_rdata_o(cfg_rdata_o),
        .cfg_rresp_o(cfg_rresp_o),
        .spi_clk_o(spi_clk_o),
        .spi_mosi_o(spi_mosi_o),
        .spi_cs_o(spi_cs_o),
        .intr_o(intr_o)
    );


    // Clock Generation
    always #5 clk_i = ~clk_i;  // 10ns clock period (100MHz)

    // Test Sequence
    initial begin
        // Initialize Signals
        clk_i = 0;
        rst_i = 1;       // Assert Reset

        #20;
        
        rst_i = 0;  // Deassert Reset
        
        cfg_awvalid_i = 1;
        cfg_awaddr_i = 8'h1c;
        cfg_wdata_i = 32'h80000000;//Enable Gobal Interrupt
        cfg_bready_i = 1;
        cfg_arvalid_i = 0;
        //cfg_bvalid_i = 0;
        #120;
        
        //Enable TX interrupt
        cfg_awaddr_i = 8'h28;
        cfg_wdata_i = 32'h00000004;
        
        #120;
        
        // Write to SPI_CR to enable SPI and Master Mode
        cfg_awaddr_i =  8'h60;  // Address of SPI_CR register
        cfg_wdata_i = 32'h000000c6; // Enable SPI (bit 0) and Master Mode (bit 6)        //cfg_wvalid_i = 1;
        
        
        #120;
        
        // Write to DTR to start SPI MOSI
        cfg_awaddr_i = 8'h68;
        cfg_wdata_i = 32'h000000aa;
        
        #120;
        
        // MISO
        spi_miso_i = 1'b1;
        cfg_araddr_i = 32'h0000006c;
        cfg_arvalid_i = 1'b1;
        cfg_awvalid_i = 1'b0;
        cfg_bready_i = 1'b0;
        cfg_rready_i = 1'b1;
        
        #1500;
        $finish;

    end
initial begin
    $monitor("Time: %0t | SPI_CLK: %b | SPI_MOSI: %b | SPI_CS: %b | SPI_MISO: %b", 
             $time, spi_clk_o, spi_mosi_o, spi_cs_o, spi_miso_i);
end

initial begin
    $dumpfile("spi_lite_tb.vcd");     // Name of the dump file
    $dumpvars(0, spi_lite_tb);        // Dump all variables in the testbench hierarchy
end
endmodule