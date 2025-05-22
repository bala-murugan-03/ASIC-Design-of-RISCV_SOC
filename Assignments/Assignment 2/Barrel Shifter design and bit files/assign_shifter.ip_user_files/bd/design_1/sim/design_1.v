//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Wed Jan 22 15:53:12 2025
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

  wire [7:0]barrel_shifter_0_z;
  wire [10:0]blk_mem_gen_0_douta;
  wire clk_in1_0_1;
  wire clk_wiz_clk_out1;
  wire [2:0]controller_0_addra;
  wire controller_0_ena;
  wire controller_0_right;
  wire [2:0]controller_0_shiftamt;
  wire controller_0_wea;
  wire [7:0]controller_0_x;
  wire reset_0_1;
  wire [0:0]vio_0_probe_out0;
  wire [0:0]vio_0_probe_out1;

  assign clk_in1_0_1 = clk_in1_0;
  assign reset_0_1 = reset_0;
  design_1_barrel_shifter_0_0 barrel_shifter_0
       (.right(controller_0_right),
        .shiftamt(controller_0_shiftamt),
        .x(controller_0_x),
        .z(barrel_shifter_0_z));
  design_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(controller_0_addra),
        .clka(clk_wiz_clk_out1),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(blk_mem_gen_0_douta),
        .ena(controller_0_ena),
        .wea(controller_0_wea));
  design_1_clk_wiz_0 clk_wiz
       (.clk_in1(clk_in1_0_1),
        .clk_out1(clk_wiz_clk_out1),
        .reset(reset_0_1));
  design_1_controller_0_0 controller_0
       (.addra(controller_0_addra),
        .clka(clk_wiz_clk_out1),
        .dir(vio_0_probe_out1),
        .douta(blk_mem_gen_0_douta),
        .ena(controller_0_ena),
        .right(controller_0_right),
        .shiftamt(controller_0_shiftamt),
        .start_stop(vio_0_probe_out0),
        .wea(controller_0_wea),
        .x(controller_0_x));
  design_1_ila_0_0 ila_0
       (.clk(clk_wiz_clk_out1),
        .probe0(controller_0_x),
        .probe1(controller_0_shiftamt),
        .probe2(vio_0_probe_out1),
        .probe3(barrel_shifter_0_z));
  design_1_vio_0_0 vio_0
       (.clk(clk_wiz_clk_out1),
        .probe_in0(barrel_shifter_0_z),
        .probe_out0(vio_0_probe_out0),
        .probe_out1(vio_0_probe_out1));
endmodule
