`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2025 02:24:18
// Design Name: 
// Module Name: wrapper_2_tb
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

`include "irq_ctrl_defs.v"
`include "spi_lite_defs.v"
`include "timer_defs.v" 
// GPIO Direction Control
`define GPIO_DIRECTION                  8'h00  // Address for GPIO direction control
// GPIO Input Register
`define GPIO_INPUT                      8'h04  // Address for GPIO Input Register
`define GPIO_OUTPUT                     8'h08  // Address for GPIO Output Register
// GPIO Output Set
`define GPIO_OUTPUT_SET                 8'h0C  // Address for GPIO Output Set
// GPIO Output Clear
`define GPIO_OUTPUT_CLR                 8'h10  // Address for GPIO Output Clear
// GPIO Interrupt Mask
`define GPIO_INT_MASK                   8'h14  // Address for GPIO Interrupt Mask
// GPIO Interrupt Set
`define GPIO_INT_SET                    8'h18  // Address for GPIO Interrupt Set
// GPIO Interrupt Clear
`define GPIO_INT_CLR                   8'h1C  // Address for GPIO Interrupt Clear
// GPIO Interrupt Status
`define GPIO_INT_STATUS                8'h20  // Address for GPIO Interrupt Status
// GPIO Interrupt level
`define GPIO_INT_LEVEL                 8'h24  // Address for GPIO Interrupt level
// GPIO Interrupt Mode
`define GPIO_INT_MODE                 8'h28  // Address for GPIO Interrupt Mode

`define PERIPH0_ADDR         32'h90000000
`define PERIPH1_ADDR         32'h91000000
`define PERIPH2_ADDR         32'h92000000
`define PERIPH3_ADDR         32'h93000000
`define PERIPH4_ADDR         32'h94000000

`define IRQ_ISR    8'h0
`define IRQ_IPR    8'h4
`define IRQ_IER    8'h8
`define IRQ_IAR    8'hc
`define IRQ_SIE    8'h10
`define IRQ_CIE    8'h14
`define IRQ_IVR    8'h18
`define IRQ_MER    8'h1c

`define ULITE_RX    8'h0
`define ULITE_TX    8'h4
`define ULITE_STATUS    8'h8
`define ULITE_CONTROL    8'hc

module wrapper_2_tb(

    );
  parameter CLK_PERIOD = 10; // Clock period in ns
  parameter CLK_FREQ = 100000000; // Frequency
  parameter BAUD_RATE   = 921600; // Bit rate
  parameter BIT_PERIOD = (CLK_FREQ*CLK_PERIOD)/BAUD_RATE; // Bit period in ns
  parameter NUM_BITS = 10;  //Start bit + 8 data bits + stop bit
 
  reg clk_i_0;
  reg [31:0] gpio_input_i_0;
  wire [31:0] gpio_output_enable_o_0;
  wire [31:0] gpio_output_o_0;
  reg [31:0] inport_araddr_i_0;
  wire inport_arready_o_0;
  reg inport_arvalid_i_0;
  reg [31:0] inport_awaddr_i_0;
  wire inport_awready_o_0;
  reg inport_awvalid_i_0;
  reg inport_bready_i_0;
  wire [1:0] inport_bresp_o_0;
  wire inport_bvalid_o_0;
  wire [31:0] inport_rdata_o_0;
  reg inport_rready_i_0;
  wire [1:0] inport_rresp_o_0;
  wire inport_rvalid_o_0;
  reg [31:0] inport_wdata_i_0;
  wire inport_wready_o_0;
  reg [3:0] inport_wstrb_i_0;
  reg inport_wvalid_i_0;
  reg rst_0;
  wire spi_clk_o_0;
  wire spi_cs_o_0;
  reg spi_miso_i_0;
  wire spi_mosi_o_0;
  wire uart_rxd_o_0;
  reg uart_txd_i_0;
  
  
  reg rst_cpu_i_0;

  design_2_wrapper uut (
    .clk_0(clk_i_0),
    .gpio_input_i_0(gpio_input_i_0),
    .gpio_output_enable_o_0(gpio_output_enable_o_0),
    .gpio_output_o_0(gpio_output_o_0),
    .inport_araddr_i_0(inport_araddr_i_0),
    .inport_arready_o_0(inport_arready_o_0),
    .inport_arvalid_i_0(inport_arvalid_i_0),
    .inport_awaddr_i_0(inport_awaddr_i_0),
    .inport_awready_o_0(inport_awready_o_0),
    .inport_awvalid_i_0(inport_awvalid_i_0),
    .inport_bready_i_0(inport_bready_i_0),
    .inport_bresp_o_0(inport_bresp_o_0),
    .inport_bvalid_o_0(inport_bvalid_o_0),
    .inport_rdata_o_0(inport_rdata_o_0),
    .inport_rready_i_0(inport_rready_i_0),
    .inport_rresp_o_0(inport_rresp_o_0),
    .inport_rvalid_o_0(inport_rvalid_o_0),
    .inport_wdata_i_0(inport_wdata_i_0),
    .inport_wready_o_0(inport_wready_o_0),
    .inport_wstrb_i_0(inport_wstrb_i_0),
    .inport_wvalid_i_0(inport_wvalid_i_0),
    .rst_0(rst_0),
    .spi_clk_o_0(spi_clk_o_0),
    .spi_cs_o_0(spi_cs_o_0),
    .spi_miso_i_0(spi_miso_i_0),
    .spi_mosi_o_0(spi_mosi_o_0),
    .uart_rxd_o_0(uart_rxd_o_0),
    .uart_txd_i_0(uart_txd_i_0)
  );
  
  
task write (input [31:0] address, input [31:0] data);
    begin
    @(posedge clk_i_0);
    inport_awvalid_i_0 = 1'b1;
    inport_awaddr_i_0 = address;
    inport_wvalid_i_0 = 1'b1;
    inport_wdata_i_0 = data;
    inport_bready_i_0 = 1'b1;
    wait(inport_awready_o_0 & inport_wready_o_0);
    @(posedge clk_i_0);
    inport_awvalid_i_0 = 1'b0;
    inport_wvalid_i_0 = 1'b0;
    wait(inport_bvalid_o_0);
    repeat(2)@(posedge clk_i_0);
    inport_bready_i_0 = 1'b0;
    end
    endtask
    
    task read (input [31:0] address);
    begin
    @(posedge clk_i_0);
    inport_arvalid_i_0 = 1'b1;
    inport_araddr_i_0 = address;
    inport_rready_i_0 = 1'b1;
    wait(inport_arready_o_0);
    @(posedge clk_i_0);
    inport_arvalid_i_0 = 1'b0;
    repeat(2)@(posedge clk_i_0);
    inport_rready_i_0 = 1'b0;
    end
    endtask
  
  
always #(CLK_PERIOD / 2) clk_i_0 = ~clk_i_0;
   
  // Test sequence
    initial begin
        // Initialize signals
        clk_i_0 = 1;
        rst_0 = 1;
        
        inport_araddr_i_0 = 0;
        inport_arvalid_i_0 = 0;
        inport_awaddr_i_0 = 0;
        inport_awvalid_i_0 = 0;
        inport_wdata_i_0 = 0;
        inport_wvalid_i_0 = 0;
        inport_wstrb_i_0 = 4'b1111;
        inport_bready_i_0 = 0;
        inport_rready_i_0 = 1;
        gpio_input_i_0 = 0;
        spi_miso_i_0 = 0;
        uart_txd_i_0 = 1;
        
        // Reset sequence
    #60 rst_0 = 1'b0;
    #20;  
    
    //Irq registers
    write(`PERIPH0_ADDR + `IRQ_MER,32'h1);
    #40;
    write(`PERIPH0_ADDR + `IRQ_IER,32'hF); 
    #40;

   // Write operation - timer0 count
    write(`PERIPH1_ADDR + 32'hC , 32'hFFFFFFF0);   
    #40;
    // Timer0 enable
    write(`PERIPH1_ADDR + 32'h8,32'h00000004);
         
    #40;
    // Timer1 count
    write(`PERIPH1_ADDR + 32'h18 , 32'hFFFFFFFD);
    
    #40;   
    // Timer1 enable
    write(`PERIPH1_ADDR + 32'h14,32'h00000004);

    #40;
    
    // TIMER Read operation
    read(`PERIPH1_ADDR + 32'h1C);
    
    #40;
     
   // Write to the Control Register (Enable Interrupt)
    write(`PERIPH2_ADDR + `ULITE_CONTROL,32'h10);
    
    #40;
    
    // Write data to the TX register
    write(`PERIPH2_ADDR + `ULITE_TX, 32'hA5);
    
    #40;
    
    // Read the Status Register to check TXEMPTY
    read(`PERIPH2_ADDR + `ULITE_STATUS);
    
    #40;
    
    // Enable global interrupt
    write(`PERIPH3_ADDR + `SPI_DGIER,32'h80000000);
    
    #40;
    
    // Enable Tx interrupt
    write(`PERIPH3_ADDR + `SPI_IPIER,32'h00000004);
    
    #40;
     
    // Write to SPI_CR to enable SPI and Master Mode
    write(`PERIPH3_ADDR + `SPI_CR, 32'hC6);
    #40;
    
    //Write to DTR to start SPI MOSI
    write(`PERIPH3_ADDR + `SPI_DTR,32'h54);
    
    #40;
    
     // GPIO Direction 16 input,16 output
    write(`PERIPH4_ADDR + `GPIO_DIRECTION,32'h0000FFFF);
    
    #40;
    
    // Test 2: Write pattern to output pins (lower 16 bits only)
    write(`PERIPH4_ADDR + `GPIO_OUTPUT, 32'h0000A5A5);
    
    #40;
    
    // Test 3: Test SET operation on output pins
    write(`PERIPH4_ADDR + `GPIO_OUTPUT_SET, 32'h0000FF00);
    
    #40;
    
    // Test 4: Test CLEAR operation on output pins

    write(`PERIPH4_ADDR + `GPIO_OUTPUT_CLR,32'h000000A5);
    
    #40;
    
    gpio_input_i_0 = 32'hA5A50000;
    
    #500;
   
    read(`PERIPH4_ADDR + `GPIO_INPUT);
    #40;

    //Spi read
    read(`PERIPH3_ADDR + `SPI_DRR);
    
    #40;
    
    
    #1000;
    
    
    #40;
    
    read(`PERIPH0_ADDR + `IRQ_IVR);
    
    #40;
    // Read the Status Register 
    read(`PERIPH2_ADDR + `ULITE_STATUS);
    
    #40;
    
    write(`PERIPH2_ADDR + `ULITE_CONTROL,32'h0);
    
    #40;
    
    write(`PERIPH0_ADDR + `IRQ_IAR,32'h2);
    
    #40;
    
    read(`PERIPH0_ADDR + `IRQ_IVR);
    
    #40;
    
    write(`PERIPH2_ADDR + `ULITE_CONTROL,32'h10);
    
    #40;

    //Read RX register
    read(`PERIPH2_ADDR + `ULITE_RX);
    
    #40;
    
    write(`PERIPH2_ADDR + `ULITE_CONTROL,32'h0);
    
    #40;
    
    write(`PERIPH0_ADDR + `IRQ_IAR,32'h2);
    
    #40;
    
    read(`PERIPH0_ADDR + `IRQ_IVR);
    
    #40;
    
    // Read the Status Register 
    read(`PERIPH2_ADDR + `ULITE_STATUS);
    
    #40;    
         
    #8000;
    $finish;
 end

        
        
        

endmodule
