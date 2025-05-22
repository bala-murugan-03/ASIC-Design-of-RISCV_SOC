//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Thu Jan 16 19:47:46 2025
//Host        : BALA running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_board_cnt=4,da_clkrst_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (reset_rtl,
    sys_clock);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_rtl;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input sys_clock;

  wire Net;
  wire bkadder_0_cout;
  wire [31:0]bkadder_0_sum;
  wire [63:0]blk_mem_gen_0_douta;
  wire controller_0_Cin;
  wire [31:0]controller_0_a;
  wire [3:0]controller_0_addra;
  wire [31:0]controller_0_b;
  wire controller_0_ena;
  wire reset_rtl_1;
  wire sys_clock_1;
  wire [0:0]vio_0_probe_out0;
  wire [0:0]vio_0_probe_out1;

  assign reset_rtl_1 = reset_rtl;
  assign sys_clock_1 = sys_clock;
  design_1_bkadder_0_0 bkadder_0
       (.Cin(controller_0_Cin),
        .a(controller_0_a),
        .b(controller_0_b),
        .cout(bkadder_0_cout),
        .sum(bkadder_0_sum));
  design_1_blk_mem_gen_0_1 blk_mem_gen_0
       (.addra(controller_0_addra),
        .clka(Net),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(blk_mem_gen_0_douta),
        .ena(controller_0_ena),
        .wea(1'b0));
  design_1_clk_wiz_0 clk_wiz
       (.clk_in1(sys_clock_1),
        .clk_out1(Net),
        .reset(reset_rtl_1));
  design_1_controller_0_0 controller_0
       (.Cin(controller_0_Cin),
        .a(controller_0_a),
        .add_sub(vio_0_probe_out1),
        .addra(controller_0_addra),
        .b(controller_0_b),
        .clka(Net),
        .douta(blk_mem_gen_0_douta),
        .ena(controller_0_ena),
        .start_stop(vio_0_probe_out0));
  design_1_ila_0_0 ila_0
       (.clk(Net),
        .probe0(controller_0_a),
        .probe1(controller_0_b),
        .probe2(bkadder_0_sum),
        .probe3(controller_0_Cin),
        .probe4(bkadder_0_cout));
  design_1_vio_0_0 vio_0
       (.clk(Net),
        .probe_in0(bkadder_0_sum),
        .probe_in1(bkadder_0_cout),
        .probe_out0(vio_0_probe_out0),
        .probe_out1(vio_0_probe_out1));
endmodule
