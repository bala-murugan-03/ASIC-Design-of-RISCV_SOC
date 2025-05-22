`timescale 1ns/1ps

`include "GPIORegDef.v"
module soc_tb;

    // Inputs
    reg           clk_i;
    reg           rst_i;
    reg           inport_awvalid_i;
    reg  [31:0]   inport_awaddr_i;
    reg  [3:0]    inport_awid_i;
    reg  [7:0]    inport_awlen_i;
    reg  [1:0]    inport_awburst_i;
    reg           inport_wvalid_i;
    reg  [31:0]   inport_wdata_i;
    reg  [3:0]    inport_wstrb_i;
    reg           inport_wlast_i;
    reg           inport_bready_i;
    reg           inport_arvalid_i;
    reg  [31:0]   inport_araddr_i;
    reg  [3:0]    inport_arid_i;
    reg  [7:0]    inport_arlen_i;
    reg  [1:0]    inport_arburst_i;
    reg           inport_rready_i;
    reg           mem_awready_i;
    reg           mem_wready_i;
    reg           mem_bvalid_i;
    reg  [1:0]    mem_bresp_i;
    reg  [3:0]    mem_bid_i;
    reg           mem_arready_i;
    reg           mem_rvalid_i;
    reg  [31:0]   mem_rdata_i;
    reg  [1:0]    mem_rresp_i;
    reg  [3:0]    mem_rid_i;
    reg           mem_rlast_i;
    reg           cpu_i_awvalid_i;
    reg  [31:0]   cpu_i_awaddr_i;
    reg  [3:0]    cpu_i_awid_i;
    reg  [7:0]    cpu_i_awlen_i;
    reg  [1:0]    cpu_i_awburst_i;
    reg           cpu_i_wvalid_i;
    reg  [31:0]   cpu_i_wdata_i;
    reg  [3:0]    cpu_i_wstrb_i;
    reg           cpu_i_wlast_i;
    reg           cpu_i_bready_i;
    reg           cpu_i_arvalid_i;
    reg  [31:0]   cpu_i_araddr_i;
    reg  [3:0]    cpu_i_arid_i;
    reg  [7:0]    cpu_i_arlen_i;
    reg  [1:0]    cpu_i_arburst_i;
    reg           cpu_i_rready_i;
    reg           cpu_d_awvalid_i;
    reg  [31:0]   cpu_d_awaddr_i;
    reg  [3:0]    cpu_d_awid_i;
    reg  [7:0]    cpu_d_awlen_i;
    reg  [1:0]    cpu_d_awburst_i;
    reg           cpu_d_wvalid_i;
    reg  [31:0]   cpu_d_wdata_i;
    reg  [3:0]    cpu_d_wstrb_i;
    reg           cpu_d_wlast_i;
    reg           cpu_d_bready_i;
    reg           cpu_d_arvalid_i;
    reg  [31:0]   cpu_d_araddr_i;
    reg  [3:0]    cpu_d_arid_i;
    reg  [7:0]    cpu_d_arlen_i;
    reg  [1:0]    cpu_d_arburst_i;
    reg           cpu_d_rready_i;
    reg           spi_miso_i;
    reg           uart_txd_i;
    reg  [31:0]   gpio_input_i;

    // Outputs
    wire          intr_o;
    wire          inport_awready_o;
    wire          inport_wready_o;
    wire          inport_bvalid_o;
    wire [1:0]    inport_bresp_o;
    wire [3:0]    inport_bid_o;
    wire          inport_arready_o;
    wire          inport_rvalid_o;
    wire [31:0]   inport_rdata_o;
    wire [1:0]    inport_rresp_o;
    wire [3:0]    inport_rid_o;
    wire          inport_rlast_o;
    wire          mem_awvalid_o;
    wire [31:0]   mem_awaddr_o;
    wire [3:0]    mem_awid_o;
    wire [7:0]    mem_awlen_o;
    wire [1:0]    mem_awburst_o;
    wire          mem_wvalid_o;
    wire [31:0]   mem_wdata_o;
    wire [3:0]    mem_wstrb_o;
    wire          mem_wlast_o;
    wire          mem_bready_o;
    wire          mem_arvalid_o;
    wire [31:0]   mem_araddr_o;
    wire [3:0]    mem_arid_o;
    wire [7:0]    mem_arlen_o;
    wire [1:0]    mem_arburst_o;
    wire          mem_rready_o;
    wire          cpu_i_awready_o;
    wire          cpu_i_wready_o;
    wire          cpu_i_bvalid_o;
    wire [1:0]    cpu_i_bresp_o;
    wire [3:0]    cpu_i_bid_o;
    wire          cpu_i_arready_o;
    wire          cpu_i_rvalid_o;
    wire [31:0]   cpu_i_rdata_o;
    wire [1:0]    cpu_i_rresp_o;
    wire [3:0]    cpu_i_rid_o;
    wire          cpu_i_rlast_o;
    wire          cpu_d_awready_o;
    wire          cpu_d_wready_o;
    wire          cpu_d_bvalid_o;
    wire [1:0]    cpu_d_bresp_o;
    wire [3:0]    cpu_d_bid_o;
    wire          cpu_d_arready_o;
    wire          cpu_d_rvalid_o;
    wire [31:0]   cpu_d_rdata_o;
    wire [1:0]    cpu_d_rresp_o;
    wire [3:0]    cpu_d_rid_o;
    wire          cpu_d_rlast_o;
    wire          spi_clk_o;
    wire          spi_mosi_o;
    wire          spi_cs_o;
    wire          uart_rxd_o;
    wire [31:0]   gpio_output_o;
    wire [31:0]   gpio_output_enable_o;
    //register used to read data
    reg [31:0] read_data;

    // Instantiate the Unit Under Test (UUT)
    soc uut (
        // Inputs
        .clk_i(clk_i),
        .rst_i(rst_i),
        .inport_awvalid_i(inport_awvalid_i),
        .inport_awaddr_i(inport_awaddr_i),
        .inport_awid_i(inport_awid_i),
        .inport_awlen_i(inport_awlen_i),
        .inport_awburst_i(inport_awburst_i),
        .inport_wvalid_i(inport_wvalid_i),
        .inport_wdata_i(inport_wdata_i),
        .inport_wstrb_i(inport_wstrb_i),
        .inport_wlast_i(inport_wlast_i),
        .inport_bready_i(inport_bready_i),
        .inport_arvalid_i(inport_arvalid_i),
        .inport_araddr_i(inport_araddr_i),
        .inport_arid_i(inport_arid_i),
        .inport_arlen_i(inport_arlen_i),
        .inport_arburst_i(inport_arburst_i),
        .inport_rready_i(inport_rready_i),
        .mem_awready_i(mem_awready_i),
        .mem_wready_i(mem_wready_i),
        .mem_bvalid_i(mem_bvalid_i),
        .mem_bresp_i(mem_bresp_i),
        .mem_bid_i(mem_bid_i),
        .mem_arready_i(mem_arready_i),
        .mem_rvalid_i(mem_rvalid_i),
        .mem_rdata_i(mem_rdata_i),
        .mem_rresp_i(mem_rresp_i),
        .mem_rid_i(mem_rid_i),
        .mem_rlast_i(mem_rlast_i),
        .cpu_i_awvalid_i(cpu_i_awvalid_i),
        .cpu_i_awaddr_i(cpu_i_awaddr_i),
        .cpu_i_awid_i(cpu_i_awid_i),
        .cpu_i_awlen_i(cpu_i_awlen_i),
        .cpu_i_awburst_i(cpu_i_awburst_i),
        .cpu_i_wvalid_i(cpu_i_wvalid_i),
        .cpu_i_wdata_i(cpu_i_wdata_i),
        .cpu_i_wstrb_i(cpu_i_wstrb_i),
        .cpu_i_wlast_i(cpu_i_wlast_i),
        .cpu_i_bready_i(cpu_i_bready_i),
        .cpu_i_arvalid_i(cpu_i_arvalid_i),
        .cpu_i_araddr_i(cpu_i_araddr_i),
        .cpu_i_arid_i(cpu_i_arid_i),
        .cpu_i_arlen_i(cpu_i_arlen_i),
        .cpu_i_arburst_i(cpu_i_arburst_i),
        .cpu_i_rready_i(cpu_i_rready_i),
        .cpu_d_awvalid_i(cpu_d_awvalid_i),
        .cpu_d_awaddr_i(cpu_d_awaddr_i),
        .cpu_d_awid_i(cpu_d_awid_i),
        .cpu_d_awlen_i(cpu_d_awlen_i),
        .cpu_d_awburst_i(cpu_d_awburst_i),
        .cpu_d_wvalid_i(cpu_d_wvalid_i),
        .cpu_d_wdata_i(cpu_d_wdata_i),
        .cpu_d_wstrb_i(cpu_d_wstrb_i),
        .cpu_d_wlast_i(cpu_d_wlast_i),
        .cpu_d_bready_i(cpu_d_bready_i),
        .cpu_d_arvalid_i(cpu_d_arvalid_i),
        .cpu_d_araddr_i(cpu_d_araddr_i),
        .cpu_d_arid_i(cpu_d_arid_i),
        .cpu_d_arlen_i(cpu_d_arlen_i),
        .cpu_d_arburst_i(cpu_d_arburst_i),
        .cpu_d_rready_i(cpu_d_rready_i),
        .spi_miso_i(spi_miso_i),
        .uart_txd_i(uart_txd_i),
        .gpio_input_i(gpio_input_i),

        // Outputs
        .intr_o(intr_o),
        .inport_awready_o(inport_awready_o),
        .inport_wready_o(inport_wready_o),
        .inport_bvalid_o(inport_bvalid_o),
        .inport_bresp_o(inport_bresp_o),
        .inport_bid_o(inport_bid_o),
        .inport_arready_o(inport_arready_o),
        .inport_rvalid_o(inport_rvalid_o),
        .inport_rdata_o(inport_rdata_o),
        .inport_rresp_o(inport_rresp_o),
        .inport_rid_o(inport_rid_o),
        .inport_rlast_o(inport_rlast_o),
        .mem_awvalid_o(mem_awvalid_o),
        .mem_awaddr_o(mem_awaddr_o),
        .mem_awid_o(mem_awid_o),
        .mem_awlen_o(mem_awlen_o),
        .mem_awburst_o(mem_awburst_o),
        .mem_wvalid_o(mem_wvalid_o),
        .mem_wdata_o(mem_wdata_o),
        .mem_wstrb_o(mem_wstrb_o),
        .mem_wlast_o(mem_wlast_o),
        .mem_bready_o(mem_bready_o),
        .mem_arvalid_o(mem_arvalid_o),
        .mem_araddr_o(mem_araddr_o),
        .mem_arid_o(mem_arid_o),
        .mem_arlen_o(mem_arlen_o),
        .mem_arburst_o(mem_arburst_o),
        .mem_rready_o(mem_rready_o),
        .cpu_i_awready_o(cpu_i_awready_o),
        .cpu_i_wready_o(cpu_i_wready_o),
        .cpu_i_bvalid_o(cpu_i_bvalid_o),
        .cpu_i_bresp_o(cpu_i_bresp_o),
        .cpu_i_bid_o(cpu_i_bid_o),
        .cpu_i_arready_o(cpu_i_arready_o),
        .cpu_i_rvalid_o(cpu_i_rvalid_o),
        .cpu_i_rdata_o(cpu_i_rdata_o),
        .cpu_i_rresp_o(cpu_i_rresp_o),
        .cpu_i_rid_o(cpu_i_rid_o),
        .cpu_i_rlast_o(cpu_i_rlast_o),
        .cpu_d_awready_o(cpu_d_awready_o),
        .cpu_d_wready_o(cpu_d_wready_o),
        .cpu_d_bvalid_o(cpu_d_bvalid_o),
        .cpu_d_bresp_o(cpu_d_bresp_o),
        .cpu_d_bid_o(cpu_d_bid_o),
        .cpu_d_arready_o(cpu_d_arready_o),
        .cpu_d_rvalid_o(cpu_d_rvalid_o),
        .cpu_d_rdata_o(cpu_d_rdata_o),
        .cpu_d_rresp_o(cpu_d_rresp_o),
        .cpu_d_rid_o(cpu_d_rid_o),
        .cpu_d_rlast_o(cpu_d_rlast_o),
        .spi_clk_o(spi_clk_o),
        .spi_mosi_o(spi_mosi_o),
        .spi_cs_o(spi_cs_o),
        .uart_rxd_o(uart_rxd_o),
        .gpio_output_o(gpio_output_o),
        .gpio_output_enable_o(gpio_output_enable_o)
    );
    //for master1
         task write1;
        input [31:0] addr;
        input [31:0] data;
        begin

   @(posedge clk_i);
        inport_awaddr_i = addr; 
        inport_awvalid_i = 1;
        inport_wdata_i = data; 
        inport_wstrb_i = 4'b1111;   
        inport_awlen_i=8'b00;
        inport_wvalid_i = 1;
        inport_awid_i=4'b0000;
        inport_wlast_i=1'b1;
        inport_awburst_i=2'b00;
        @(posedge clk_i);
        // Wait for handshake signals
        wait(inport_awready_o && inport_wready_o);
        @(posedge clk_i);
        inport_awvalid_i = 0;
        inport_wvalid_i = 0;
        //inport_awaddr_i = 32'b0;
        //inport_wdata_i = 32'b0; 
       
        inport_wlast_i=1'b0;
        //cpu_i_awid_i=4'b0000;

        // Wait for write response
        inport_bready_i = 1;
        wait(inport_bvalid_o);
        repeat(2)@(posedge clk_i);
        inport_bready_i = 0;
        
        end
    endtask
    
     task read1;
        input [31:0] addr;
        output [31:0] data;
        begin
           // Address Phase
            @(posedge clk_i);
            inport_arvalid_i = 1;
            inport_araddr_i = addr;
            inport_arid_i=4'b0000;
            inport_arburst_i=2'b01;
            inport_arlen_i=8'h00;
            @(posedge clk_i);
            wait(inport_arready_o);
            @(posedge clk_i);
            inport_arvalid_i = 0;
            
            // Data Phase
            inport_rready_i = 1;
            wait(inport_rvalid_o);
            @(posedge clk_i);
            data = inport_rdata_o;
            @(posedge clk_i);
      
            inport_rready_i = 0;
            
            // Add spacing between transactions
            repeat(2) @(posedge clk_i);
        end
    endtask
   //for master2
      task write3;
        input [31:0] addr;
        input [31:0] data;
        begin
            @(posedge clk_i);
            cpu_i_awvalid_i = 1;
            cpu_i_awaddr_i = addr;
            cpu_i_awid_i=4'b1000;
            cpu_i_awlen_i=8'h00;
            cpu_i_awburst_i=2'b01;
             // Data Phase
            cpu_i_wvalid_i = 1;
            cpu_i_wdata_i = data;
            cpu_i_wstrb_i=4'b1111;
            cpu_i_wlast_i=1'b1;
            @(posedge clk_i);
            wait(cpu_i_wready_o&cpu_i_awready_o);
            @(posedge clk_i);
            cpu_i_wvalid_i = 0;
            cpu_i_awvalid_i = 0;
            cpu_i_wlast_i=0;
            // Response Phase
            cpu_i_bready_i = 1;
            wait(cpu_i_bvalid_o);
            @(posedge clk_i);
            cpu_i_bready_i = 0;
            // Add spacing between transactions
            repeat(2) @(posedge clk_i);
        end
    endtask
    
     task read3;
        input [31:0] addr;
        output [31:0] data;
        begin
           // Address Phase
            @(posedge clk_i);
            cpu_i_arvalid_i = 1;
            cpu_i_araddr_i = addr;
            cpu_i_arid_i=4'b1000;
            cpu_i_arburst_i=2'b01;
            cpu_i_arlen_i=8'h00;
            @(posedge clk_i);
            wait(cpu_i_arready_o);
            @(posedge clk_i);
            cpu_i_arvalid_i = 0;
            
            // Data Phase
            cpu_i_rready_i = 1;
            wait(cpu_i_rvalid_o);
            @(posedge clk_i);
            data = cpu_i_rdata_o;
            @(posedge clk_i);
      
            cpu_i_rready_i = 0;
            
            // Add spacing between transactions
            repeat(2) @(posedge clk_i);
        end
    endtask
//for master3
  task write2;
        input [31:0] addr;
        input [31:0] data;
        begin
            @(posedge clk_i);
            cpu_d_awvalid_i = 1;
            cpu_d_awaddr_i = addr;
            cpu_d_awid_i=4'b0100;
            cpu_d_awlen_i=8'h00;
            cpu_d_awburst_i=2'b01;
             // Data Phase
            cpu_d_wvalid_i = 1;
            cpu_d_wdata_i = data;
            cpu_d_wstrb_i=4'b1111;
            cpu_d_wlast_i=1'b1;
             @(posedge clk_i);
            wait(cpu_d_wready_o&cpu_d_awready_o);
            @(posedge clk_i);
            cpu_d_wvalid_i = 0;
            cpu_d_awvalid_i = 0;
            cpu_i_wlast_i=0;
            // Response Phase
            cpu_d_bready_i = 1;
            wait(cpu_d_bvalid_o);
            @(posedge clk_i);
            cpu_d_bready_i = 0;
            // Add spacing between transactions
            repeat(2) @(posedge clk_i);
        end
    endtask
    
     task read2;
        input [31:0] addr;
        output [31:0] data;
        begin
           // Address Phase
            @(posedge clk_i);
            cpu_d_arvalid_i = 1;
            cpu_d_araddr_i = addr;
            cpu_d_arid_i=4'b0100;
            cpu_d_arburst_i=2'b01;
            cpu_d_arlen_i=8'h00;
            @(posedge clk_i);
            wait(cpu_d_arready_o);
            @(posedge clk_i);
            cpu_d_arvalid_i = 0;
            
            // Data Phase
            cpu_d_rready_i = 1;
            wait(cpu_d_rvalid_o);
            @(posedge clk_i);
            data = cpu_d_rdata_o;
            @(posedge clk_i);
      
            cpu_d_rready_i = 0;
            
            // Add spacing between transactions
            repeat(2) @(posedge clk_i);
        end
    endtask
	
    // Clock generation
    initial begin
        clk_i = 0;
        forever #5 clk_i = ~clk_i; // 50MHz clock
    end

    // Reset generation
    initial begin
        rst_i = 0;
        #100;
        rst_i = 1;
    end

    // Test sequence
    initial begin
        // Initialize all inputs
        inport_awvalid_i = 0;
        inport_awaddr_i = 0;
        inport_awid_i = 0;
        inport_awlen_i = 0;
        inport_awburst_i = 0;
        inport_wvalid_i = 0;
        inport_wdata_i = 0;
        inport_wstrb_i = 0;
        inport_wlast_i = 0;
        inport_bready_i = 0;
        inport_arvalid_i = 0;
        inport_araddr_i = 0;
        inport_arid_i = 0;
        inport_arlen_i = 0;
        inport_arburst_i = 0;
        inport_rready_i = 0;
        mem_awready_i = 0;
        mem_wready_i = 0;
        mem_bvalid_i = 0;
        mem_bresp_i = 0;
        mem_bid_i = 0;
        mem_arready_i = 0;
        mem_rvalid_i = 0;
        mem_rdata_i = 0;
        mem_rresp_i = 0;
        mem_rid_i = 0;
        mem_rlast_i = 0;
        cpu_i_awvalid_i = 0;
        cpu_i_awaddr_i = 0;
        cpu_i_awid_i = 0;
        cpu_i_awlen_i = 0;
        cpu_i_awburst_i = 0;
        cpu_i_wvalid_i = 0;
        cpu_i_wdata_i = 0;
        cpu_i_wstrb_i = 0;
        cpu_i_wlast_i = 0;
        cpu_i_bready_i = 0;
        cpu_i_arvalid_i = 0;
        cpu_i_araddr_i = 0;
        cpu_i_arid_i = 0;
        cpu_i_arlen_i = 0;
        cpu_i_arburst_i = 0;
        cpu_i_rready_i = 0;
        cpu_d_awvalid_i = 0;
        cpu_d_awaddr_i = 0;
        cpu_d_awid_i = 0;
        cpu_d_awlen_i = 0;
        cpu_d_awburst_i = 0;
        cpu_d_wvalid_i = 0;
        cpu_d_wdata_i = 0;
        cpu_d_wstrb_i = 0;
        cpu_d_wlast_i = 0;
        cpu_d_bready_i = 0;
        cpu_d_arvalid_i = 0;
        cpu_d_araddr_i = 0;
        cpu_d_arid_i = 0;
        cpu_d_arlen_i = 0;
        cpu_d_arburst_i = 0;
        cpu_d_rready_i = 0;
        spi_miso_i = 0;
        uart_txd_i = 1;
        gpio_input_i = 0;

        // Wait for reset to complete
        @(posedge rst_i);
  
        #20;
 /////Testing IRQ controller//
 /////////////////////////////
         write1({32'h90000008},32'd15);
         read1(32'h90000000,read_data);
  /////////////////////////////////////
    /////Testing GPIO////////////////////
    /////////////////////////////////////
    write1({24'h940000, `GPIO_DIRECTION}, 32'h0000FFFF);
    write1({24'h940000, `GPIO_OUTPUT}, 32'h0000A5A5); 
    write2({24'h940000, `GPIO_OUTPUT_SET}, 32'h0000FF00);
    write3({24'h940000, `GPIO_OUTPUT_CLR}, 32'h000000A5);
    #20;
    gpio_input_i = 32'hA5A50000;
    #20;
    read1({24'h940000, `GPIO_INPUT}, read_data);
 //////////////////////////////////////
 //////////Testing UART////////////////
 //////////////////////////////////////////
        // Simulate UART RX input
        #8000 uart_txd_i = 0; // start bit
        #8000 uart_txd_i = 1;
        #8000 uart_txd_i = 1;
        #8000 uart_txd_i = 1;
        #8000 uart_txd_i = 0;
        #8000 uart_txd_i = 1;
        #8000 uart_txd_i = 0;
        #8000 uart_txd_i = 0;
        #8000 uart_txd_i = 1;
        #8000 uart_txd_i = 1; // stop bit
  // Write TX Register (0x04) with data 0x55 ('U' ASCII)
        //@(posedge clk_i)
        
        write1(32'h92000004,32'd55);
  // Write TX Register (0x0C) with data 0x10 ( enable interrupt)    
        @(posedge clk_i)
        write2(32'h9200000C,32'd16);
        #200;
 // Read Status Register
        read2(32'h92000008,read_data);
        //Reading ISR for IRQ_CTRL
        read1(32'h90000000,read_data);
        
 // Read RX Buffer
        wait(read_data[1]);
        //making read request from same master
        read1(32'h92000000,read_data);
        //reading ISR form IRQ_ctrl
        write1({32'h9000000C},32'd2);
        read1(32'h90000000,read_data);
        
    
    #20;
  ///////////////////////////////////////      
  ///Testing Timer///////////////////////
  ///////////////////////////////////////
  //Write Operations
  write1({32'h9100000C}, 32'h3A5A5000);
  write1({32'h91000008}, 32'h00000000);
  write2({32'h91000018}, 32'h000A5000);
  write3({32'h91000018}, 32'h005A5000);
  write3({32'h91000014}, 32'h00000004);
  //Read Operations
  read3({32'h91000008}, read_data);
  read1({32'h9100000C}, read_data);
  read3({32'h91000018}, read_data);
  read2({32'h91000014}, read_data);
  
  
  
  ///////////////////////////////////
  //Testing SPI /////////////////////
  ///////////////////////////////////
  //enable global interrupt
 write1({32'h9300001C}, 32'h8000000);
 //enable tx interrupt
 write2({32'h93000028}, 32'h0000004);
 //enabling spi&master mode
 write3({32'h93000060}, 32'h00000C6);
 //writing data to dtr register
 write2({32'h93000068}, 32'h00000A5);
 write2({32'h93000068}, 32'h0000000);
 #400;
 spi_miso_i=1'b1;
 #1000;
 spi_miso_i=1'b0;
 #400
 //Reading from drr register
 read1({32'h9300006C}, read_data);
 ///////////////////////


   
    end
endmodule