//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Wed Jan 22 16:42:44 2025
//Host        : BALA running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk_in1_0,
    reset_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN design_1_clk_in1_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_in1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_0;

  wire [31:0]blk_mem_gen_0_douta;
  wire clk_in1_0_1;
  wire clk_wiz_1_clk_out1;
  wire [15:0]controller_0_a;
  wire [2:0]controller_0_addra;
  wire [15:0]controller_0_b;
  wire controller_0_ena;
  wire controller_0_wea;
  wire [31:0]dadda_mult_0_result;
  wire reset_0_1;
  wire [0:0]vio_0_probe_out0;

  assign clk_in1_0_1 = clk_in1_0;
  assign reset_0_1 = reset_0;
  design_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(controller_0_addra),
        .clka(clk_wiz_1_clk_out1),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(blk_mem_gen_0_douta),
        .ena(controller_0_ena),
        .wea(controller_0_wea));
  design_1_clk_wiz_1_0 clk_wiz_1
       (.clk_in1(clk_in1_0_1),
        .clk_out1(clk_wiz_1_clk_out1),
        .reset(reset_0_1));
  design_1_controller_0_0 controller_0
       (.a(controller_0_a),
        .addra(controller_0_addra),
        .b(controller_0_b),
        .clka(clk_wiz_1_clk_out1),
        .douta(blk_mem_gen_0_douta),
        .ena(controller_0_ena),
        .start_stop(vio_0_probe_out0),
        .wea(controller_0_wea));
  design_1_dadda_mult_0_0 dadda_mult_0
       (.a(controller_0_a),
        .b(controller_0_b),
        .result(dadda_mult_0_result));
  design_1_ila_0_0 ila_0
       (.clk(clk_wiz_1_clk_out1),
        .probe0(controller_0_a),
        .probe1(controller_0_b),
        .probe2(dadda_mult_0_result));
  design_1_vio_0_0 vio_0
       (.clk(clk_wiz_1_clk_out1),
        .probe_in0(dadda_mult_0_result),
        .probe_out0(vio_0_probe_out0));
endmodule
