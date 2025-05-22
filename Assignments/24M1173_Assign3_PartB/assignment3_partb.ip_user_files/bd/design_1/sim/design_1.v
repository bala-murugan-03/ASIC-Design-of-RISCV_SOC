//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Thu Feb  6 17:55:18 2025
//Host        : BALA running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (a_0,
    b_0,
    clk_0,
    dataout_0,
    reset_0);
  output [15:0]a_0;
  output [15:0]b_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET reset_0, CLK_DOMAIN design_1_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_0;
  output [31:0]dataout_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_0;

  wire [14:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire axi_bram_ctrl_0_s_axi_arready;
  wire axi_bram_ctrl_0_s_axi_awready;
  wire axi_bram_ctrl_0_s_axi_bvalid;
  wire [31:0]axi_bram_ctrl_0_s_axi_rdata;
  wire axi_bram_ctrl_0_s_axi_rvalid;
  wire axi_bram_ctrl_0_s_axi_wready;
  wire clk_0_1;
  wire [15:0]controller_0_a;
  wire [14:0]controller_0_araddr;
  wire [2:0]controller_0_arprot;
  wire controller_0_arvalid;
  wire [14:0]controller_0_awaddr;
  wire [2:0]controller_0_awprot;
  wire controller_0_awvalid;
  wire [15:0]controller_0_b;
  wire controller_0_bready;
  wire [31:0]controller_0_dataout;
  wire controller_0_rready;
  wire controller_0_rstn;
  wire [31:0]controller_0_wdata;
  wire [3:0]controller_0_wstrb;
  wire controller_0_wvalid;
  wire [31:0]dadda_mult_0_result;
  wire reset_0_1;

  assign a_0[15:0] = controller_0_a;
  assign b_0[15:0] = controller_0_b;
  assign clk_0_1 = clk_0;
  assign dataout_0[31:0] = controller_0_dataout;
  assign reset_0_1 = reset_0;
  design_1_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(clk_0_1),
        .s_axi_araddr(controller_0_araddr),
        .s_axi_aresetn(controller_0_rstn),
        .s_axi_arprot(controller_0_arprot),
        .s_axi_arready(axi_bram_ctrl_0_s_axi_arready),
        .s_axi_arvalid(controller_0_arvalid),
        .s_axi_awaddr(controller_0_awaddr),
        .s_axi_awprot(controller_0_awprot),
        .s_axi_awready(axi_bram_ctrl_0_s_axi_awready),
        .s_axi_awvalid(controller_0_awvalid),
        .s_axi_bready(controller_0_bready),
        .s_axi_bvalid(axi_bram_ctrl_0_s_axi_bvalid),
        .s_axi_rdata(axi_bram_ctrl_0_s_axi_rdata),
        .s_axi_rready(controller_0_rready),
        .s_axi_rvalid(axi_bram_ctrl_0_s_axi_rvalid),
        .s_axi_wdata(controller_0_wdata),
        .s_axi_wready(axi_bram_ctrl_0_s_axi_wready),
        .s_axi_wstrb(controller_0_wstrb),
        .s_axi_wvalid(controller_0_wvalid));
  design_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE[0]));
  design_1_controller_0_0 controller_0
       (.a(controller_0_a),
        .araddr(controller_0_araddr),
        .arprot(controller_0_arprot),
        .arready(axi_bram_ctrl_0_s_axi_arready),
        .arvalid(controller_0_arvalid),
        .awaddr(controller_0_awaddr),
        .awprot(controller_0_awprot),
        .awready(axi_bram_ctrl_0_s_axi_awready),
        .awvalid(controller_0_awvalid),
        .b(controller_0_b),
        .bready(controller_0_bready),
        .bvalid(axi_bram_ctrl_0_s_axi_bvalid),
        .clk(clk_0_1),
        .dataout(controller_0_dataout),
        .rdata(axi_bram_ctrl_0_s_axi_rdata),
        .reset(reset_0_1),
        .result(dadda_mult_0_result),
        .rready(controller_0_rready),
        .rstn(controller_0_rstn),
        .rvalid(axi_bram_ctrl_0_s_axi_rvalid),
        .wdata(controller_0_wdata),
        .wready(axi_bram_ctrl_0_s_axi_wready),
        .wstrb(controller_0_wstrb),
        .wvalid(controller_0_wvalid));
  design_1_dadda_mult_0_0 dadda_mult_0
       (.a(controller_0_a),
        .b(controller_0_b),
        .result(dadda_mult_0_result));
endmodule
