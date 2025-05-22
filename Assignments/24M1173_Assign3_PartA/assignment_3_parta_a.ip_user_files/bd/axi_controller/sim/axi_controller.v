//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Tue Feb  4 15:29:30 2025
//Host        : BALA running 64-bit major release  (build 9200)
//Command     : generate_target axi_controller.bd
//Design      : axi_controller
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "axi_controller,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=axi_controller,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=2,da_bram_cntlr_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "axi_controller.hwdef" *) 
module axi_controller
   (clk_in1_0,
    reset_0,
    s_axi_araddr_0,
    s_axi_aresetn_0,
    s_axi_arprot_0,
    s_axi_arready_0,
    s_axi_arvalid_0,
    s_axi_awaddr_0,
    s_axi_awprot_0,
    s_axi_awvalid_0,
    s_axi_bready_0,
    s_axi_bvalid_0,
    s_axi_rdata_0,
    s_axi_rready_0,
    s_axi_rvalid_0,
    s_axi_wdata_0,
    s_axi_wstrb_0,
    s_axi_wvalid_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN axi_controller_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_in1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_0;
  input [14:0]s_axi_araddr_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXI_ARESETN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXI_ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input s_axi_aresetn_0;
  input [2:0]s_axi_arprot_0;
  output s_axi_arready_0;
  input s_axi_arvalid_0;
  input [14:0]s_axi_awaddr_0;
  input [2:0]s_axi_awprot_0;
  input s_axi_awvalid_0;
  input s_axi_bready_0;
  output s_axi_bvalid_0;
  output [31:0]s_axi_rdata_0;
  input s_axi_rready_0;
  output s_axi_rvalid_0;
  input [31:0]s_axi_wdata_0;
  input [3:0]s_axi_wstrb_0;
  input s_axi_wvalid_0;

  wire [14:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire axi_bram_ctrl_0_s_axi_arready;
  wire axi_bram_ctrl_0_s_axi_bvalid;
  wire [31:0]axi_bram_ctrl_0_s_axi_rdata;
  wire axi_bram_ctrl_0_s_axi_rvalid;
  wire clk_in1_0_1;
  wire clk_wiz_0_clk_out1;
  wire reset_0_1;
  wire [14:0]s_axi_araddr_0_1;
  wire s_axi_aresetn_0_1;
  wire [2:0]s_axi_arprot_0_1;
  wire s_axi_arvalid_0_1;
  wire [14:0]s_axi_awaddr_0_1;
  wire [2:0]s_axi_awprot_0_1;
  wire s_axi_awvalid_0_1;
  wire s_axi_bready_0_1;
  wire s_axi_rready_0_1;
  wire [31:0]s_axi_wdata_0_1;
  wire [3:0]s_axi_wstrb_0_1;
  wire s_axi_wvalid_0_1;

  assign clk_in1_0_1 = clk_in1_0;
  assign reset_0_1 = reset_0;
  assign s_axi_araddr_0_1 = s_axi_araddr_0[14:0];
  assign s_axi_aresetn_0_1 = s_axi_aresetn_0;
  assign s_axi_arprot_0_1 = s_axi_arprot_0[2:0];
  assign s_axi_arready_0 = axi_bram_ctrl_0_s_axi_arready;
  assign s_axi_arvalid_0_1 = s_axi_arvalid_0;
  assign s_axi_awaddr_0_1 = s_axi_awaddr_0[14:0];
  assign s_axi_awprot_0_1 = s_axi_awprot_0[2:0];
  assign s_axi_awvalid_0_1 = s_axi_awvalid_0;
  assign s_axi_bready_0_1 = s_axi_bready_0;
  assign s_axi_bvalid_0 = axi_bram_ctrl_0_s_axi_bvalid;
  assign s_axi_rdata_0[31:0] = axi_bram_ctrl_0_s_axi_rdata;
  assign s_axi_rready_0_1 = s_axi_rready_0;
  assign s_axi_rvalid_0 = axi_bram_ctrl_0_s_axi_rvalid;
  assign s_axi_wdata_0_1 = s_axi_wdata_0[31:0];
  assign s_axi_wstrb_0_1 = s_axi_wstrb_0[3:0];
  assign s_axi_wvalid_0_1 = s_axi_wvalid_0;
  axi_controller_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(clk_wiz_0_clk_out1),
        .s_axi_araddr(s_axi_araddr_0_1),
        .s_axi_aresetn(s_axi_aresetn_0_1),
        .s_axi_arprot(s_axi_arprot_0_1),
        .s_axi_arready(axi_bram_ctrl_0_s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid_0_1),
        .s_axi_awaddr(s_axi_awaddr_0_1),
        .s_axi_awprot(s_axi_awprot_0_1),
        .s_axi_awvalid(s_axi_awvalid_0_1),
        .s_axi_bready(s_axi_bready_0_1),
        .s_axi_bvalid(axi_bram_ctrl_0_s_axi_bvalid),
        .s_axi_rdata(axi_bram_ctrl_0_s_axi_rdata),
        .s_axi_rready(s_axi_rready_0_1),
        .s_axi_rvalid(axi_bram_ctrl_0_s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata_0_1),
        .s_axi_wstrb(s_axi_wstrb_0_1),
        .s_axi_wvalid(s_axi_wvalid_0_1));
  axi_controller_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE));
  axi_controller_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_in1_0_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .reset(reset_0_1));
endmodule
