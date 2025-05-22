// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Feb 18 14:04:13 2025
// Host        : desktop1 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               N:/VLSI_Design_Lab/UART/UART.sim/sim_1/impl/timing/xsim/uart_lite_tb_time_impl.v
// Design      : uart_lite
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module baud_rate_gen
   (out_clk,
    clk_i_IBUF_BUFG);
  output out_clk;
  input clk_i_IBUF_BUFG;

  wire clk_i_IBUF_BUFG;
  wire \counter[0]_i_10_n_0 ;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[0]_i_3_n_0 ;
  wire \counter[0]_i_4_n_0 ;
  wire \counter[0]_i_5_n_0 ;
  wire \counter[0]_i_6_n_0 ;
  wire \counter[0]_i_7_n_0 ;
  wire \counter[0]_i_8_n_0 ;
  wire \counter[0]_i_9_n_0 ;
  wire [31:0]counter_reg;
  wire \counter_reg[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_2_n_4 ;
  wire \counter_reg[0]_i_2_n_5 ;
  wire \counter_reg[0]_i_2_n_6 ;
  wire \counter_reg[0]_i_2_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_0 ;
  wire \counter_reg[24]_i_1_n_4 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[28]_i_1_n_4 ;
  wire \counter_reg[28]_i_1_n_5 ;
  wire \counter_reg[28]_i_1_n_6 ;
  wire \counter_reg[28]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire flag;
  wire flag_i_1_n_0;
  wire out_clk;
  wire out_clk_i_1_n_0;
  wire [2:0]\NLW_counter_reg[0]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[20]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[28]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[8]_i_1_CO_UNCONNECTED ;

  LUT3 #(
    .INIT(8'hFE)) 
    \counter[0]_i_1 
       (.I0(\counter[0]_i_3_n_0 ),
        .I1(\counter[0]_i_4_n_0 ),
        .I2(\counter[0]_i_5_n_0 ),
        .O(\counter[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[0]_i_10 
       (.I0(counter_reg[29]),
        .I1(counter_reg[30]),
        .I2(counter_reg[24]),
        .I3(counter_reg[27]),
        .O(\counter[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAA8AAAAAAAA)) 
    \counter[0]_i_3 
       (.I0(counter_reg[9]),
        .I1(counter_reg[7]),
        .I2(counter_reg[8]),
        .I3(counter_reg[5]),
        .I4(counter_reg[6]),
        .I5(\counter[0]_i_7_n_0 ),
        .O(\counter[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \counter[0]_i_4 
       (.I0(\counter[0]_i_8_n_0 ),
        .I1(\counter[0]_i_9_n_0 ),
        .I2(counter_reg[21]),
        .I3(counter_reg[22]),
        .I4(counter_reg[16]),
        .I5(counter_reg[19]),
        .O(\counter[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \counter[0]_i_5 
       (.I0(counter_reg[23]),
        .I1(counter_reg[20]),
        .I2(counter_reg[18]),
        .I3(counter_reg[17]),
        .I4(\counter[0]_i_10_n_0 ),
        .O(\counter[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_6 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h1FFFFFFF)) 
    \counter[0]_i_7 
       (.I0(counter_reg[1]),
        .I1(counter_reg[0]),
        .I2(counter_reg[3]),
        .I3(counter_reg[2]),
        .I4(counter_reg[4]),
        .O(\counter[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \counter[0]_i_8 
       (.I0(counter_reg[13]),
        .I1(counter_reg[14]),
        .I2(counter_reg[15]),
        .I3(counter_reg[10]),
        .I4(counter_reg[12]),
        .I5(counter_reg[11]),
        .O(\counter[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \counter[0]_i_9 
       (.I0(counter_reg[25]),
        .I1(counter_reg[26]),
        .I2(counter_reg[28]),
        .I3(counter_reg[31]),
        .O(\counter[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(counter_reg[0]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_2_n_0 ,\NLW_counter_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_2_n_4 ,\counter_reg[0]_i_2_n_5 ,\counter_reg[0]_i_2_n_6 ,\counter_reg[0]_i_2_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\NLW_counter_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[15] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[16] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\NLW_counter_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[17] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[18] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[19] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[20] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\NLW_counter_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[21] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[22] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[23] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[24] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(counter_reg[24]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\counter_reg[24]_i_1_n_0 ,\NLW_counter_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[24]_i_1_n_4 ,\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S(counter_reg[27:24]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[25] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[26] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[27] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[24]_i_1_n_4 ),
        .Q(counter_reg[27]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[28] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_7 ),
        .Q(counter_reg[28]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \counter_reg[28]_i_1 
       (.CI(\counter_reg[24]_i_1_n_0 ),
        .CO(\NLW_counter_reg[28]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[28]_i_1_n_4 ,\counter_reg[28]_i_1_n_5 ,\counter_reg[28]_i_1_n_6 ,\counter_reg[28]_i_1_n_7 }),
        .S(counter_reg[31:28]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[29] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_6 ),
        .Q(counter_reg[29]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[30] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_5 ),
        .Q(counter_reg[30]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[31] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[28]_i_1_n_4 ),
        .Q(counter_reg[31]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_2_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\NLW_counter_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(\counter[0]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\NLW_counter_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(\counter[0]_i_1_n_0 ));
  (* \PinAttr:I3:HOLD_DETOUR  = "190" *) 
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFF01)) 
    flag_i_1
       (.I0(\counter[0]_i_3_n_0 ),
        .I1(\counter[0]_i_4_n_0 ),
        .I2(\counter[0]_i_5_n_0 ),
        .I3(flag),
        .O(flag_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    flag_reg
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(flag_i_1_n_0),
        .Q(flag),
        .R(1'b0));
  (* \PinAttr:I4:HOLD_DETOUR  = "190" *) 
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h55565557)) 
    out_clk_i_1
       (.I0(out_clk),
        .I1(\counter[0]_i_3_n_0 ),
        .I2(\counter[0]_i_4_n_0 ),
        .I3(\counter[0]_i_5_n_0 ),
        .I4(flag),
        .O(out_clk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    out_clk_reg
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(out_clk_i_1_n_0),
        .Q(out_clk),
        .R(1'b0));
endmodule

(* ECO_CHECKSUM = "c0bec2bb" *) 
(* NotValidForBitStream *)
module uart_lite
   (clk_i,
    rst_i,
    cfg_awvalid_i,
    cfg_awaddr_i,
    cfg_wvalid_i,
    cfg_wdata_i,
    cfg_wstrb_i,
    cfg_bready_i,
    cfg_arvalid_i,
    cfg_araddr_i,
    cfg_rready_i,
    rx_i,
    cfg_awready_o,
    cfg_wready_o,
    cfg_bvalid_o,
    cfg_bresp_o,
    cfg_arready_o,
    cfg_rvalid_o,
    cfg_rdata_o,
    cfg_rresp_o,
    tx_o,
    intr_o);
  input clk_i;
  input rst_i;
  input cfg_awvalid_i;
  input [31:0]cfg_awaddr_i;
  input cfg_wvalid_i;
  input [31:0]cfg_wdata_i;
  input [3:0]cfg_wstrb_i;
  input cfg_bready_i;
  input cfg_arvalid_i;
  input [31:0]cfg_araddr_i;
  input cfg_rready_i;
  input rx_i;
  output cfg_awready_o;
  output cfg_wready_o;
  output cfg_bvalid_o;
  output [1:0]cfg_bresp_o;
  output cfg_arready_o;
  output cfg_rvalid_o;
  output [31:0]cfg_rdata_o;
  output [1:0]cfg_rresp_o;
  output tx_o;
  output intr_o;

  wire [31:0]cfg_araddr_i;
  wire [7:0]cfg_araddr_i_IBUF;
  wire cfg_arready_o;
  wire cfg_arready_o_OBUF;
  wire cfg_arready_o_i_1_n_0;
  wire cfg_arvalid_i;
  wire cfg_arvalid_i_IBUF;
  wire [31:0]cfg_awaddr_i;
  wire [7:0]cfg_awaddr_i_IBUF;
  wire cfg_awready_o;
  wire cfg_awready_o_i_1_n_0;
  wire cfg_awready_o_i_3_n_0;
  wire cfg_awready_o_reg_lopt_replica_1;
  wire cfg_awvalid_i;
  wire cfg_awvalid_i_IBUF;
  wire cfg_bready_i;
  wire cfg_bready_i_IBUF;
  wire [1:0]cfg_bresp_o;
  wire cfg_bvalid_o;
  wire cfg_bvalid_o_OBUF;
  wire cfg_bvalid_o_i_1_n_0;
  wire cfg_bvalid_o_i_2_n_0;
  wire [31:0]cfg_rdata_o;
  wire \cfg_rdata_o[0]_i_1_n_0 ;
  wire \cfg_rdata_o[1]_i_1_n_0 ;
  wire \cfg_rdata_o[2]_i_1_n_0 ;
  wire \cfg_rdata_o[3]_i_1_n_0 ;
  wire \cfg_rdata_o[4]_i_1_n_0 ;
  wire \cfg_rdata_o[5]_i_1_n_0 ;
  wire \cfg_rdata_o[6]_i_1_n_0 ;
  wire \cfg_rdata_o[7]_i_1_n_0 ;
  wire \cfg_rdata_o[7]_i_2_n_0 ;
  wire [7:0]cfg_rdata_o_OBUF;
  wire cfg_rready_i;
  wire cfg_rready_i_IBUF;
  wire [1:0]cfg_rresp_o;
  wire cfg_rvalid_o;
  wire cfg_rvalid_o1_out;
  wire cfg_rvalid_o_OBUF;
  wire cfg_rvalid_o_i_1_n_0;
  wire cfg_rvalid_o_i_3_n_0;
  wire cfg_rvalid_o_i_4_n_0;
  wire [31:0]cfg_wdata_i;
  wire [7:0]cfg_wdata_i_IBUF;
  wire cfg_wready_o;
  wire cfg_wready_o_OBUF;
  wire cfg_wvalid_i;
  wire cfg_wvalid_i_IBUF;
  wire clk_i;
  wire clk_i_IBUF;
  wire clk_i_IBUF_BUFG;
  wire intr_o;
  wire intr_o_OBUF;
  wire intr_o_i_1_n_0;
  wire intr_o_i_2_n_0;
  wire out_clk;
  wire p_0_in9_in;
  wire p_1_in;
  wire rcount_i_1_n_0;
  wire rcount_reg_n_0;
  wire \rindex[0]_i_1_n_0 ;
  wire \rindex[1]_i_1_n_0 ;
  wire \rindex[2]_i_1_n_0 ;
  wire \rindex_reg_n_0_[0] ;
  wire \rindex_reg_n_0_[1] ;
  wire \rindex_reg_n_0_[2] ;
  wire rst_i;
  wire rst_i_IBUF;
  wire rx_i;
  wire rx_i_IBUF;
  wire rxdone_i_1_n_0;
  wire rxdone_reg_n_0;
  wire tcount;
  wire tcount_i_1_n_0;
  wire [2:0]tindex;
  wire \tindex[0]_i_1_n_0 ;
  wire \tindex[1]_i_1_n_0 ;
  wire \tindex[2]_i_1_n_0 ;
  wire tx_o;
  wire tx_o_OBUF;
  wire tx_o_i_1_n_0;
  wire tx_o_i_2_n_0;
  wire tx_o_i_3_n_0;
  wire txdone_i_1_n_0;
  wire txdone_reg_n_0;
  wire [4:0]ulite_control_reg;
  wire \ulite_control_reg[4]_i_1_n_0 ;
  wire [7:0]ulite_rx_reg;
  wire ulite_rx_reg2;
  wire \ulite_rx_reg[0]_i_1_n_0 ;
  wire \ulite_rx_reg[1]_i_1_n_0 ;
  wire \ulite_rx_reg[1]_i_2_n_0 ;
  wire \ulite_rx_reg[2]_i_1_n_0 ;
  wire \ulite_rx_reg[2]_i_2_n_0 ;
  wire \ulite_rx_reg[3]_i_1_n_0 ;
  wire \ulite_rx_reg[3]_i_2_n_0 ;
  wire \ulite_rx_reg[4]_i_1_n_0 ;
  wire \ulite_rx_reg[4]_i_2_n_0 ;
  wire \ulite_rx_reg[5]_i_1_n_0 ;
  wire \ulite_rx_reg[5]_i_2_n_0 ;
  wire \ulite_rx_reg[6]_i_1_n_0 ;
  wire \ulite_rx_reg[6]_i_2_n_0 ;
  wire \ulite_rx_reg[7]_i_1_n_0 ;
  wire \ulite_rx_reg[7]_i_2_n_0 ;
  wire \ulite_rx_reg[7]_i_3_n_0 ;
  wire \ulite_status_reg[1]_i_1_n_0 ;
  wire \ulite_status_reg[1]_i_2_n_0 ;
  wire \ulite_status_reg[2]_i_1_n_0 ;
  wire \ulite_status_reg[3]_i_1_n_0 ;
  wire \ulite_status_reg[3]_i_2_n_0 ;
  wire \ulite_status_reg[3]_i_3_n_0 ;
  wire \ulite_status_reg[4]_i_1_n_0 ;
  wire \ulite_status_reg[4]_i_2_n_0 ;
  wire \ulite_status_reg[4]_i_3_n_0 ;
  wire \ulite_status_reg_reg_n_0_[3] ;
  wire \ulite_status_reg_reg_n_0_[4] ;
  wire ulite_tx_reg;
  wire ulite_tx_reg1;
  wire \ulite_tx_reg[0]_i_1_n_0 ;
  wire \ulite_tx_reg[1]_i_1_n_0 ;
  wire \ulite_tx_reg[2]_i_1_n_0 ;
  wire \ulite_tx_reg[3]_i_1_n_0 ;
  wire \ulite_tx_reg[4]_i_1_n_0 ;
  wire \ulite_tx_reg[5]_i_1_n_0 ;
  wire \ulite_tx_reg[6]_i_1_n_0 ;
  wire \ulite_tx_reg[7]_i_2_n_0 ;
  wire \ulite_tx_reg_reg_n_0_[0] ;
  wire \ulite_tx_reg_reg_n_0_[1] ;
  wire \ulite_tx_reg_reg_n_0_[2] ;
  wire \ulite_tx_reg_reg_n_0_[3] ;
  wire \ulite_tx_reg_reg_n_0_[4] ;
  wire \ulite_tx_reg_reg_n_0_[5] ;
  wire \ulite_tx_reg_reg_n_0_[6] ;
  wire \ulite_tx_reg_reg_n_0_[7] ;

initial begin
 $sdf_annotate("uart_lite_tb_time_impl.sdf",,,,"tool_control");
end
  IBUF \cfg_araddr_i_IBUF[0]_inst 
       (.I(cfg_araddr_i[0]),
        .O(cfg_araddr_i_IBUF[0]));
  IBUF \cfg_araddr_i_IBUF[1]_inst 
       (.I(cfg_araddr_i[1]),
        .O(cfg_araddr_i_IBUF[1]));
  IBUF \cfg_araddr_i_IBUF[2]_inst 
       (.I(cfg_araddr_i[2]),
        .O(cfg_araddr_i_IBUF[2]));
  IBUF \cfg_araddr_i_IBUF[3]_inst 
       (.I(cfg_araddr_i[3]),
        .O(cfg_araddr_i_IBUF[3]));
  IBUF \cfg_araddr_i_IBUF[4]_inst 
       (.I(cfg_araddr_i[4]),
        .O(cfg_araddr_i_IBUF[4]));
  IBUF \cfg_araddr_i_IBUF[5]_inst 
       (.I(cfg_araddr_i[5]),
        .O(cfg_araddr_i_IBUF[5]));
  IBUF \cfg_araddr_i_IBUF[6]_inst 
       (.I(cfg_araddr_i[6]),
        .O(cfg_araddr_i_IBUF[6]));
  IBUF \cfg_araddr_i_IBUF[7]_inst 
       (.I(cfg_araddr_i[7]),
        .O(cfg_araddr_i_IBUF[7]));
  OBUF cfg_arready_o_OBUF_inst
       (.I(cfg_arready_o_OBUF),
        .O(cfg_arready_o));
  LUT2 #(
    .INIT(4'hB)) 
    cfg_arready_o_i_1
       (.I0(cfg_arvalid_i_IBUF),
        .I1(rxdone_reg_n_0),
        .O(cfg_arready_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cfg_arready_o_reg
       (.C(clk_i_IBUF_BUFG),
        .CE(cfg_arready_o_i_1_n_0),
        .D(cfg_arvalid_i_IBUF),
        .Q(cfg_arready_o_OBUF),
        .R(rst_i_IBUF));
  IBUF cfg_arvalid_i_IBUF_inst
       (.I(cfg_arvalid_i),
        .O(cfg_arvalid_i_IBUF));
  IBUF \cfg_awaddr_i_IBUF[0]_inst 
       (.I(cfg_awaddr_i[0]),
        .O(cfg_awaddr_i_IBUF[0]));
  IBUF \cfg_awaddr_i_IBUF[1]_inst 
       (.I(cfg_awaddr_i[1]),
        .O(cfg_awaddr_i_IBUF[1]));
  IBUF \cfg_awaddr_i_IBUF[2]_inst 
       (.I(cfg_awaddr_i[2]),
        .O(cfg_awaddr_i_IBUF[2]));
  IBUF \cfg_awaddr_i_IBUF[3]_inst 
       (.I(cfg_awaddr_i[3]),
        .O(cfg_awaddr_i_IBUF[3]));
  IBUF \cfg_awaddr_i_IBUF[4]_inst 
       (.I(cfg_awaddr_i[4]),
        .O(cfg_awaddr_i_IBUF[4]));
  IBUF \cfg_awaddr_i_IBUF[5]_inst 
       (.I(cfg_awaddr_i[5]),
        .O(cfg_awaddr_i_IBUF[5]));
  IBUF \cfg_awaddr_i_IBUF[6]_inst 
       (.I(cfg_awaddr_i[6]),
        .O(cfg_awaddr_i_IBUF[6]));
  IBUF \cfg_awaddr_i_IBUF[7]_inst 
       (.I(cfg_awaddr_i[7]),
        .O(cfg_awaddr_i_IBUF[7]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF cfg_awready_o_OBUF_inst
       (.I(cfg_awready_o_reg_lopt_replica_1),
        .O(cfg_awready_o));
  LUT4 #(
    .INIT(16'hFF15)) 
    cfg_awready_o_i_1
       (.I0(txdone_reg_n_0),
        .I1(cfg_awvalid_i_IBUF),
        .I2(cfg_wvalid_i_IBUF),
        .I3(rst_i_IBUF),
        .O(cfg_awready_o_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    cfg_awready_o_i_2
       (.I0(cfg_awvalid_i_IBUF),
        .I1(cfg_wvalid_i_IBUF),
        .O(ulite_tx_reg1));
  LUT6 #(
    .INIT(64'h0100010001000000)) 
    cfg_awready_o_i_3
       (.I0(cfg_awaddr_i_IBUF[0]),
        .I1(cfg_awaddr_i_IBUF[1]),
        .I2(\ulite_status_reg[4]_i_2_n_0 ),
        .I3(cfg_awaddr_i_IBUF[2]),
        .I4(cfg_awaddr_i_IBUF[3]),
        .I5(p_1_in),
        .O(cfg_awready_o_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cfg_awready_o_reg
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg1),
        .D(cfg_awready_o_i_3_n_0),
        .Q(cfg_wready_o_OBUF),
        .R(cfg_awready_o_i_1_n_0));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDRE #(
    .INIT(1'b0)) 
    cfg_awready_o_reg_lopt_replica
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg1),
        .D(cfg_awready_o_i_3_n_0),
        .Q(cfg_awready_o_reg_lopt_replica_1),
        .R(cfg_awready_o_i_1_n_0));
  IBUF cfg_awvalid_i_IBUF_inst
       (.I(cfg_awvalid_i),
        .O(cfg_awvalid_i_IBUF));
  IBUF cfg_bready_i_IBUF_inst
       (.I(cfg_bready_i),
        .O(cfg_bready_i_IBUF));
  OBUF \cfg_bresp_o_OBUF[0]_inst 
       (.I(1'b0),
        .O(cfg_bresp_o[0]));
  OBUF \cfg_bresp_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(cfg_bresp_o[1]));
  OBUF cfg_bvalid_o_OBUF_inst
       (.I(cfg_bvalid_o_OBUF),
        .O(cfg_bvalid_o));
  LUT3 #(
    .INIT(8'h8F)) 
    cfg_bvalid_o_i_1
       (.I0(cfg_wvalid_i_IBUF),
        .I1(cfg_awvalid_i_IBUF),
        .I2(txdone_reg_n_0),
        .O(cfg_bvalid_o_i_1_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    cfg_bvalid_o_i_2
       (.I0(cfg_wvalid_i_IBUF),
        .I1(cfg_awvalid_i_IBUF),
        .I2(cfg_bready_i_IBUF),
        .O(cfg_bvalid_o_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cfg_bvalid_o_reg
       (.C(clk_i_IBUF_BUFG),
        .CE(cfg_bvalid_o_i_1_n_0),
        .D(cfg_bvalid_o_i_2_n_0),
        .Q(cfg_bvalid_o_OBUF),
        .R(rst_i_IBUF));
  LUT6 #(
    .INIT(64'h00000000B391A280)) 
    \cfg_rdata_o[0]_i_1 
       (.I0(cfg_araddr_i_IBUF[3]),
        .I1(cfg_araddr_i_IBUF[2]),
        .I2(ulite_control_reg[0]),
        .I3(p_0_in9_in),
        .I4(ulite_rx_reg[0]),
        .I5(cfg_rvalid_o_i_4_n_0),
        .O(\cfg_rdata_o[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B391A280)) 
    \cfg_rdata_o[1]_i_1 
       (.I0(cfg_araddr_i_IBUF[3]),
        .I1(cfg_araddr_i_IBUF[2]),
        .I2(ulite_control_reg[1]),
        .I3(p_0_in9_in),
        .I4(ulite_rx_reg[1]),
        .I5(cfg_rvalid_o_i_4_n_0),
        .O(\cfg_rdata_o[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000000AC)) 
    \cfg_rdata_o[2]_i_1 
       (.I0(p_1_in),
        .I1(ulite_rx_reg[2]),
        .I2(cfg_araddr_i_IBUF[3]),
        .I3(cfg_araddr_i_IBUF[2]),
        .I4(cfg_rvalid_o_i_4_n_0),
        .O(\cfg_rdata_o[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000000AC)) 
    \cfg_rdata_o[3]_i_1 
       (.I0(\ulite_status_reg_reg_n_0_[3] ),
        .I1(ulite_rx_reg[3]),
        .I2(cfg_araddr_i_IBUF[3]),
        .I3(cfg_araddr_i_IBUF[2]),
        .I4(cfg_rvalid_o_i_4_n_0),
        .O(\cfg_rdata_o[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B391A280)) 
    \cfg_rdata_o[4]_i_1 
       (.I0(cfg_araddr_i_IBUF[3]),
        .I1(cfg_araddr_i_IBUF[2]),
        .I2(ulite_control_reg[4]),
        .I3(\ulite_status_reg_reg_n_0_[4] ),
        .I4(ulite_rx_reg[4]),
        .I5(cfg_rvalid_o_i_4_n_0),
        .O(\cfg_rdata_o[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \cfg_rdata_o[5]_i_1 
       (.I0(cfg_rvalid_o_i_4_n_0),
        .I1(cfg_araddr_i_IBUF[2]),
        .I2(cfg_araddr_i_IBUF[3]),
        .I3(ulite_rx_reg[5]),
        .O(\cfg_rdata_o[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \cfg_rdata_o[6]_i_1 
       (.I0(cfg_rvalid_o_i_4_n_0),
        .I1(cfg_araddr_i_IBUF[2]),
        .I2(cfg_araddr_i_IBUF[3]),
        .I3(ulite_rx_reg[6]),
        .O(\cfg_rdata_o[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA8888AA80)) 
    \cfg_rdata_o[7]_i_1 
       (.I0(cfg_arvalid_i_IBUF),
        .I1(cfg_rready_i_IBUF),
        .I2(p_0_in9_in),
        .I3(cfg_araddr_i_IBUF[2]),
        .I4(cfg_araddr_i_IBUF[3]),
        .I5(cfg_rvalid_o_i_4_n_0),
        .O(\cfg_rdata_o[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \cfg_rdata_o[7]_i_2 
       (.I0(cfg_rvalid_o_i_4_n_0),
        .I1(cfg_araddr_i_IBUF[2]),
        .I2(cfg_araddr_i_IBUF[3]),
        .I3(ulite_rx_reg[7]),
        .O(\cfg_rdata_o[7]_i_2_n_0 ));
  OBUF \cfg_rdata_o_OBUF[0]_inst 
       (.I(cfg_rdata_o_OBUF[0]),
        .O(cfg_rdata_o[0]));
  OBUF \cfg_rdata_o_OBUF[10]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[10]));
  OBUF \cfg_rdata_o_OBUF[11]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[11]));
  OBUF \cfg_rdata_o_OBUF[12]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[12]));
  OBUF \cfg_rdata_o_OBUF[13]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[13]));
  OBUF \cfg_rdata_o_OBUF[14]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[14]));
  OBUF \cfg_rdata_o_OBUF[15]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[15]));
  OBUF \cfg_rdata_o_OBUF[16]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[16]));
  OBUF \cfg_rdata_o_OBUF[17]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[17]));
  OBUF \cfg_rdata_o_OBUF[18]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[18]));
  OBUF \cfg_rdata_o_OBUF[19]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[19]));
  OBUF \cfg_rdata_o_OBUF[1]_inst 
       (.I(cfg_rdata_o_OBUF[1]),
        .O(cfg_rdata_o[1]));
  OBUF \cfg_rdata_o_OBUF[20]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[20]));
  OBUF \cfg_rdata_o_OBUF[21]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[21]));
  OBUF \cfg_rdata_o_OBUF[22]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[22]));
  OBUF \cfg_rdata_o_OBUF[23]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[23]));
  OBUF \cfg_rdata_o_OBUF[24]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[24]));
  OBUF \cfg_rdata_o_OBUF[25]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[25]));
  OBUF \cfg_rdata_o_OBUF[26]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[26]));
  OBUF \cfg_rdata_o_OBUF[27]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[27]));
  OBUF \cfg_rdata_o_OBUF[28]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[28]));
  OBUF \cfg_rdata_o_OBUF[29]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[29]));
  OBUF \cfg_rdata_o_OBUF[2]_inst 
       (.I(cfg_rdata_o_OBUF[2]),
        .O(cfg_rdata_o[2]));
  OBUF \cfg_rdata_o_OBUF[30]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[30]));
  OBUF \cfg_rdata_o_OBUF[31]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[31]));
  OBUF \cfg_rdata_o_OBUF[3]_inst 
       (.I(cfg_rdata_o_OBUF[3]),
        .O(cfg_rdata_o[3]));
  OBUF \cfg_rdata_o_OBUF[4]_inst 
       (.I(cfg_rdata_o_OBUF[4]),
        .O(cfg_rdata_o[4]));
  OBUF \cfg_rdata_o_OBUF[5]_inst 
       (.I(cfg_rdata_o_OBUF[5]),
        .O(cfg_rdata_o[5]));
  OBUF \cfg_rdata_o_OBUF[6]_inst 
       (.I(cfg_rdata_o_OBUF[6]),
        .O(cfg_rdata_o[6]));
  OBUF \cfg_rdata_o_OBUF[7]_inst 
       (.I(cfg_rdata_o_OBUF[7]),
        .O(cfg_rdata_o[7]));
  OBUF \cfg_rdata_o_OBUF[8]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[8]));
  OBUF \cfg_rdata_o_OBUF[9]_inst 
       (.I(1'b0),
        .O(cfg_rdata_o[9]));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_rdata_o_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\cfg_rdata_o[7]_i_1_n_0 ),
        .D(\cfg_rdata_o[0]_i_1_n_0 ),
        .Q(cfg_rdata_o_OBUF[0]),
        .R(cfg_rvalid_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_rdata_o_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\cfg_rdata_o[7]_i_1_n_0 ),
        .D(\cfg_rdata_o[1]_i_1_n_0 ),
        .Q(cfg_rdata_o_OBUF[1]),
        .R(cfg_rvalid_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_rdata_o_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\cfg_rdata_o[7]_i_1_n_0 ),
        .D(\cfg_rdata_o[2]_i_1_n_0 ),
        .Q(cfg_rdata_o_OBUF[2]),
        .R(cfg_rvalid_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_rdata_o_reg[3] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\cfg_rdata_o[7]_i_1_n_0 ),
        .D(\cfg_rdata_o[3]_i_1_n_0 ),
        .Q(cfg_rdata_o_OBUF[3]),
        .R(cfg_rvalid_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_rdata_o_reg[4] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\cfg_rdata_o[7]_i_1_n_0 ),
        .D(\cfg_rdata_o[4]_i_1_n_0 ),
        .Q(cfg_rdata_o_OBUF[4]),
        .R(cfg_rvalid_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_rdata_o_reg[5] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\cfg_rdata_o[7]_i_1_n_0 ),
        .D(\cfg_rdata_o[5]_i_1_n_0 ),
        .Q(cfg_rdata_o_OBUF[5]),
        .R(cfg_rvalid_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_rdata_o_reg[6] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\cfg_rdata_o[7]_i_1_n_0 ),
        .D(\cfg_rdata_o[6]_i_1_n_0 ),
        .Q(cfg_rdata_o_OBUF[6]),
        .R(cfg_rvalid_o_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cfg_rdata_o_reg[7] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\cfg_rdata_o[7]_i_1_n_0 ),
        .D(\cfg_rdata_o[7]_i_2_n_0 ),
        .Q(cfg_rdata_o_OBUF[7]),
        .R(cfg_rvalid_o_i_1_n_0));
  IBUF cfg_rready_i_IBUF_inst
       (.I(cfg_rready_i),
        .O(cfg_rready_i_IBUF));
  OBUF \cfg_rresp_o_OBUF[0]_inst 
       (.I(1'b0),
        .O(cfg_rresp_o[0]));
  OBUF \cfg_rresp_o_OBUF[1]_inst 
       (.I(1'b0),
        .O(cfg_rresp_o[1]));
  OBUF cfg_rvalid_o_OBUF_inst
       (.I(cfg_rvalid_o_OBUF),
        .O(cfg_rvalid_o));
  LUT3 #(
    .INIT(8'hF1)) 
    cfg_rvalid_o_i_1
       (.I0(cfg_arvalid_i_IBUF),
        .I1(rxdone_reg_n_0),
        .I2(rst_i_IBUF),
        .O(cfg_rvalid_o_i_1_n_0));
  LUT4 #(
    .INIT(16'h008A)) 
    cfg_rvalid_o_i_2
       (.I0(cfg_arvalid_i_IBUF),
        .I1(cfg_araddr_i_IBUF[3]),
        .I2(cfg_araddr_i_IBUF[2]),
        .I3(cfg_rvalid_o_i_4_n_0),
        .O(cfg_rvalid_o1_out));
  LUT3 #(
    .INIT(8'hC8)) 
    cfg_rvalid_o_i_3
       (.I0(cfg_araddr_i_IBUF[3]),
        .I1(cfg_rready_i_IBUF),
        .I2(p_0_in9_in),
        .O(cfg_rvalid_o_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    cfg_rvalid_o_i_4
       (.I0(cfg_araddr_i_IBUF[0]),
        .I1(cfg_araddr_i_IBUF[1]),
        .I2(cfg_araddr_i_IBUF[7]),
        .I3(cfg_araddr_i_IBUF[6]),
        .I4(cfg_araddr_i_IBUF[5]),
        .I5(cfg_araddr_i_IBUF[4]),
        .O(cfg_rvalid_o_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    cfg_rvalid_o_reg
       (.C(clk_i_IBUF_BUFG),
        .CE(cfg_rvalid_o1_out),
        .D(cfg_rvalid_o_i_3_n_0),
        .Q(cfg_rvalid_o_OBUF),
        .R(cfg_rvalid_o_i_1_n_0));
  IBUF \cfg_wdata_i_IBUF[0]_inst 
       (.I(cfg_wdata_i[0]),
        .O(cfg_wdata_i_IBUF[0]));
  IBUF \cfg_wdata_i_IBUF[1]_inst 
       (.I(cfg_wdata_i[1]),
        .O(cfg_wdata_i_IBUF[1]));
  IBUF \cfg_wdata_i_IBUF[2]_inst 
       (.I(cfg_wdata_i[2]),
        .O(cfg_wdata_i_IBUF[2]));
  IBUF \cfg_wdata_i_IBUF[3]_inst 
       (.I(cfg_wdata_i[3]),
        .O(cfg_wdata_i_IBUF[3]));
  IBUF \cfg_wdata_i_IBUF[4]_inst 
       (.I(cfg_wdata_i[4]),
        .O(cfg_wdata_i_IBUF[4]));
  IBUF \cfg_wdata_i_IBUF[5]_inst 
       (.I(cfg_wdata_i[5]),
        .O(cfg_wdata_i_IBUF[5]));
  IBUF \cfg_wdata_i_IBUF[6]_inst 
       (.I(cfg_wdata_i[6]),
        .O(cfg_wdata_i_IBUF[6]));
  IBUF \cfg_wdata_i_IBUF[7]_inst 
       (.I(cfg_wdata_i[7]),
        .O(cfg_wdata_i_IBUF[7]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF cfg_wready_o_OBUF_inst
       (.I(cfg_wready_o_OBUF),
        .O(cfg_wready_o));
  IBUF cfg_wvalid_i_IBUF_inst
       (.I(cfg_wvalid_i),
        .O(cfg_wvalid_i_IBUF));
  BUFG clk_i_IBUF_BUFG_inst
       (.I(clk_i_IBUF),
        .O(clk_i_IBUF_BUFG));
  IBUF clk_i_IBUF_inst
       (.I(clk_i),
        .O(clk_i_IBUF));
  OBUF intr_o_OBUF_inst
       (.I(intr_o_OBUF),
        .O(intr_o));
  LUT6 #(
    .INIT(64'h00000008FFFFFFFF)) 
    intr_o_i_1
       (.I0(cfg_rready_i_IBUF),
        .I1(p_0_in9_in),
        .I2(cfg_araddr_i_IBUF[3]),
        .I3(cfg_araddr_i_IBUF[2]),
        .I4(cfg_rvalid_o_i_4_n_0),
        .I5(cfg_arvalid_i_IBUF),
        .O(intr_o_i_1_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    intr_o_i_2
       (.I0(p_0_in9_in),
        .I1(\ulite_status_reg_reg_n_0_[4] ),
        .I2(cfg_arvalid_i_IBUF),
        .O(intr_o_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    intr_o_reg
       (.C(clk_i_IBUF_BUFG),
        .CE(intr_o_i_1_n_0),
        .D(intr_o_i_2_n_0),
        .Q(intr_o_OBUF),
        .R(cfg_rvalid_o_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFC5555)) 
    rcount_i_1
       (.I0(rx_i_IBUF),
        .I1(\rindex_reg_n_0_[0] ),
        .I2(\rindex_reg_n_0_[1] ),
        .I3(\rindex_reg_n_0_[2] ),
        .I4(rcount_reg_n_0),
        .O(rcount_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rcount_reg
       (.C(out_clk),
        .CE(1'b1),
        .D(rcount_i_1_n_0),
        .Q(rcount_reg_n_0),
        .R(rst_i_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hBFBE)) 
    \rindex[0]_i_1 
       (.I0(rst_i_IBUF),
        .I1(\rindex_reg_n_0_[0] ),
        .I2(rcount_reg_n_0),
        .I3(rx_i_IBUF),
        .O(\rindex[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hEBFFEBFA)) 
    \rindex[1]_i_1 
       (.I0(rst_i_IBUF),
        .I1(\rindex_reg_n_0_[0] ),
        .I2(\rindex_reg_n_0_[1] ),
        .I3(rcount_reg_n_0),
        .I4(rx_i_IBUF),
        .O(\rindex[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEABFFFFFEABFFAA)) 
    \rindex[2]_i_1 
       (.I0(rst_i_IBUF),
        .I1(\rindex_reg_n_0_[0] ),
        .I2(\rindex_reg_n_0_[1] ),
        .I3(\rindex_reg_n_0_[2] ),
        .I4(rcount_reg_n_0),
        .I5(rx_i_IBUF),
        .O(\rindex[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rindex_reg[0] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\rindex[0]_i_1_n_0 ),
        .Q(\rindex_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rindex_reg[1] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\rindex[1]_i_1_n_0 ),
        .Q(\rindex_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rindex_reg[2] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\rindex[2]_i_1_n_0 ),
        .Q(\rindex_reg_n_0_[2] ),
        .R(1'b0));
  IBUF rst_i_IBUF_inst
       (.I(rst_i),
        .O(rst_i_IBUF));
  IBUF rx_i_IBUF_inst
       (.I(rx_i),
        .O(rx_i_IBUF));
  LUT6 #(
    .INIT(64'hFF01FFFF01010100)) 
    rxdone_i_1
       (.I0(\rindex_reg_n_0_[0] ),
        .I1(\rindex_reg_n_0_[1] ),
        .I2(\rindex_reg_n_0_[2] ),
        .I3(rcount_reg_n_0),
        .I4(rx_i_IBUF),
        .I5(rxdone_reg_n_0),
        .O(rxdone_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rxdone_reg
       (.C(out_clk),
        .CE(1'b1),
        .D(rxdone_i_1_n_0),
        .Q(rxdone_reg_n_0),
        .R(rst_i_IBUF));
  LUT6 #(
    .INIT(64'h000000000000FFFD)) 
    tcount_i_1
       (.I0(tcount),
        .I1(tindex[2]),
        .I2(tindex[1]),
        .I3(tindex[0]),
        .I4(rst_i_IBUF),
        .I5(p_1_in),
        .O(tcount_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tcount_reg
       (.C(out_clk),
        .CE(1'b1),
        .D(tcount_i_1_n_0),
        .Q(tcount),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFF6)) 
    \tindex[0]_i_1 
       (.I0(tindex[0]),
        .I1(tcount),
        .I2(rst_i_IBUF),
        .I3(p_1_in),
        .O(\tindex[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFFA6)) 
    \tindex[1]_i_1 
       (.I0(tindex[1]),
        .I1(tcount),
        .I2(tindex[0]),
        .I3(rst_i_IBUF),
        .I4(p_1_in),
        .O(\tindex[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAAA6)) 
    \tindex[2]_i_1 
       (.I0(tindex[2]),
        .I1(tcount),
        .I2(tindex[0]),
        .I3(tindex[1]),
        .I4(rst_i_IBUF),
        .I5(p_1_in),
        .O(\tindex[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tindex_reg[0] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\tindex[0]_i_1_n_0 ),
        .Q(tindex[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tindex_reg[1] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\tindex[1]_i_1_n_0 ),
        .Q(tindex[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tindex_reg[2] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\tindex[2]_i_1_n_0 ),
        .Q(tindex[2]),
        .R(1'b0));
  OBUF tx_o_OBUF_inst
       (.I(tx_o_OBUF),
        .O(tx_o));
  LUT6 #(
    .INIT(64'hFFEEFEFEEEEEEEEE)) 
    tx_o_i_1
       (.I0(p_1_in),
        .I1(rst_i_IBUF),
        .I2(tx_o_i_2_n_0),
        .I3(tx_o_i_3_n_0),
        .I4(tindex[2]),
        .I5(tcount),
        .O(tx_o_i_1_n_0));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    tx_o_i_2
       (.I0(\ulite_tx_reg_reg_n_0_[1] ),
        .I1(\ulite_tx_reg_reg_n_0_[3] ),
        .I2(\ulite_tx_reg_reg_n_0_[0] ),
        .I3(tindex[0]),
        .I4(tindex[1]),
        .I5(\ulite_tx_reg_reg_n_0_[2] ),
        .O(tx_o_i_2_n_0));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    tx_o_i_3
       (.I0(\ulite_tx_reg_reg_n_0_[5] ),
        .I1(\ulite_tx_reg_reg_n_0_[7] ),
        .I2(\ulite_tx_reg_reg_n_0_[4] ),
        .I3(tindex[0]),
        .I4(tindex[1]),
        .I5(\ulite_tx_reg_reg_n_0_[6] ),
        .O(tx_o_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tx_o_reg
       (.C(out_clk),
        .CE(1'b1),
        .D(tx_o_i_1_n_0),
        .Q(tx_o_OBUF),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000FFFF00000100)) 
    txdone_i_1
       (.I0(tindex[0]),
        .I1(tindex[1]),
        .I2(tindex[2]),
        .I3(tcount),
        .I4(p_1_in),
        .I5(txdone_reg_n_0),
        .O(txdone_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    txdone_reg
       (.C(out_clk),
        .CE(1'b1),
        .D(txdone_i_1_n_0),
        .Q(txdone_reg_n_0),
        .R(rst_i_IBUF));
  baud_rate_gen u_baud
       (.clk_i_IBUF_BUFG(clk_i_IBUF_BUFG),
        .out_clk(out_clk));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \ulite_control_reg[4]_i_1 
       (.I0(ulite_tx_reg1),
        .I1(\ulite_status_reg[4]_i_2_n_0 ),
        .I2(cfg_awaddr_i_IBUF[0]),
        .I3(cfg_awaddr_i_IBUF[1]),
        .I4(cfg_awaddr_i_IBUF[2]),
        .I5(cfg_awaddr_i_IBUF[3]),
        .O(\ulite_control_reg[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_control_reg_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\ulite_control_reg[4]_i_1_n_0 ),
        .D(cfg_wdata_i_IBUF[0]),
        .Q(ulite_control_reg[0]),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_control_reg_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\ulite_control_reg[4]_i_1_n_0 ),
        .D(cfg_wdata_i_IBUF[1]),
        .Q(ulite_control_reg[1]),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_control_reg_reg[4] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\ulite_control_reg[4]_i_1_n_0 ),
        .D(cfg_wdata_i_IBUF[4]),
        .Q(ulite_control_reg[4]),
        .R(rst_i_IBUF));
  LUT5 #(
    .INIT(32'h0FAB00AA)) 
    \ulite_rx_reg[0]_i_1 
       (.I0(rx_i_IBUF),
        .I1(rcount_reg_n_0),
        .I2(cfg_wdata_i_IBUF[1]),
        .I3(ulite_rx_reg2),
        .I4(ulite_rx_reg[0]),
        .O(\ulite_rx_reg[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \ulite_rx_reg[0]_i_2 
       (.I0(\rindex_reg_n_0_[0] ),
        .I1(\rindex_reg_n_0_[1] ),
        .I2(\rindex_reg_n_0_[2] ),
        .O(ulite_rx_reg2));
  LUT5 #(
    .INIT(32'h20EF2020)) 
    \ulite_rx_reg[1]_i_1 
       (.I0(rx_i_IBUF),
        .I1(\ulite_rx_reg[7]_i_2_n_0 ),
        .I2(\ulite_rx_reg[1]_i_2_n_0 ),
        .I3(cfg_wdata_i_IBUF[1]),
        .I4(ulite_rx_reg[1]),
        .O(\ulite_rx_reg[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \ulite_rx_reg[1]_i_2 
       (.I0(\rindex_reg_n_0_[2] ),
        .I1(\rindex_reg_n_0_[1] ),
        .I2(\rindex_reg_n_0_[0] ),
        .O(\ulite_rx_reg[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20EF2020)) 
    \ulite_rx_reg[2]_i_1 
       (.I0(rx_i_IBUF),
        .I1(\ulite_rx_reg[7]_i_2_n_0 ),
        .I2(\ulite_rx_reg[2]_i_2_n_0 ),
        .I3(cfg_wdata_i_IBUF[1]),
        .I4(ulite_rx_reg[2]),
        .O(\ulite_rx_reg[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \ulite_rx_reg[2]_i_2 
       (.I0(\rindex_reg_n_0_[2] ),
        .I1(\rindex_reg_n_0_[1] ),
        .I2(\rindex_reg_n_0_[0] ),
        .O(\ulite_rx_reg[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20EF2020)) 
    \ulite_rx_reg[3]_i_1 
       (.I0(rx_i_IBUF),
        .I1(\ulite_rx_reg[7]_i_2_n_0 ),
        .I2(\ulite_rx_reg[3]_i_2_n_0 ),
        .I3(cfg_wdata_i_IBUF[1]),
        .I4(ulite_rx_reg[3]),
        .O(\ulite_rx_reg[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \ulite_rx_reg[3]_i_2 
       (.I0(\rindex_reg_n_0_[2] ),
        .I1(\rindex_reg_n_0_[1] ),
        .I2(\rindex_reg_n_0_[0] ),
        .O(\ulite_rx_reg[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2000EFFF20002000)) 
    \ulite_rx_reg[4]_i_1 
       (.I0(rx_i_IBUF),
        .I1(\ulite_rx_reg[4]_i_2_n_0 ),
        .I2(\rindex_reg_n_0_[2] ),
        .I3(rcount_reg_n_0),
        .I4(cfg_wdata_i_IBUF[1]),
        .I5(ulite_rx_reg[4]),
        .O(\ulite_rx_reg[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \ulite_rx_reg[4]_i_2 
       (.I0(\rindex_reg_n_0_[1] ),
        .I1(\rindex_reg_n_0_[0] ),
        .O(\ulite_rx_reg[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20EF2020)) 
    \ulite_rx_reg[5]_i_1 
       (.I0(rx_i_IBUF),
        .I1(\ulite_rx_reg[7]_i_2_n_0 ),
        .I2(\ulite_rx_reg[5]_i_2_n_0 ),
        .I3(cfg_wdata_i_IBUF[1]),
        .I4(ulite_rx_reg[5]),
        .O(\ulite_rx_reg[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \ulite_rx_reg[5]_i_2 
       (.I0(\rindex_reg_n_0_[1] ),
        .I1(\rindex_reg_n_0_[2] ),
        .I2(\rindex_reg_n_0_[0] ),
        .O(\ulite_rx_reg[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20EF2020)) 
    \ulite_rx_reg[6]_i_1 
       (.I0(rx_i_IBUF),
        .I1(\ulite_rx_reg[7]_i_2_n_0 ),
        .I2(\ulite_rx_reg[6]_i_2_n_0 ),
        .I3(cfg_wdata_i_IBUF[1]),
        .I4(ulite_rx_reg[6]),
        .O(\ulite_rx_reg[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \ulite_rx_reg[6]_i_2 
       (.I0(\rindex_reg_n_0_[2] ),
        .I1(\rindex_reg_n_0_[1] ),
        .I2(\rindex_reg_n_0_[0] ),
        .O(\ulite_rx_reg[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20EF2020)) 
    \ulite_rx_reg[7]_i_1 
       (.I0(rx_i_IBUF),
        .I1(\ulite_rx_reg[7]_i_2_n_0 ),
        .I2(\ulite_rx_reg[7]_i_3_n_0 ),
        .I3(cfg_wdata_i_IBUF[1]),
        .I4(ulite_rx_reg[7]),
        .O(\ulite_rx_reg[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h01FF)) 
    \ulite_rx_reg[7]_i_2 
       (.I0(\rindex_reg_n_0_[0] ),
        .I1(\rindex_reg_n_0_[1] ),
        .I2(\rindex_reg_n_0_[2] ),
        .I3(rcount_reg_n_0),
        .O(\ulite_rx_reg[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \ulite_rx_reg[7]_i_3 
       (.I0(\rindex_reg_n_0_[2] ),
        .I1(\rindex_reg_n_0_[1] ),
        .I2(\rindex_reg_n_0_[0] ),
        .O(\ulite_rx_reg[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_rx_reg_reg[0] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\ulite_rx_reg[0]_i_1_n_0 ),
        .Q(ulite_rx_reg[0]),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_rx_reg_reg[1] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\ulite_rx_reg[1]_i_1_n_0 ),
        .Q(ulite_rx_reg[1]),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_rx_reg_reg[2] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\ulite_rx_reg[2]_i_1_n_0 ),
        .Q(ulite_rx_reg[2]),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_rx_reg_reg[3] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\ulite_rx_reg[3]_i_1_n_0 ),
        .Q(ulite_rx_reg[3]),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_rx_reg_reg[4] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\ulite_rx_reg[4]_i_1_n_0 ),
        .Q(ulite_rx_reg[4]),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_rx_reg_reg[5] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\ulite_rx_reg[5]_i_1_n_0 ),
        .Q(ulite_rx_reg[5]),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_rx_reg_reg[6] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\ulite_rx_reg[6]_i_1_n_0 ),
        .Q(ulite_rx_reg[6]),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_rx_reg_reg[7] 
       (.C(out_clk),
        .CE(1'b1),
        .D(\ulite_rx_reg[7]_i_1_n_0 ),
        .Q(ulite_rx_reg[7]),
        .R(rst_i_IBUF));
  LUT6 #(
    .INIT(64'h0333020233330202)) 
    \ulite_status_reg[1]_i_1 
       (.I0(rxdone_reg_n_0),
        .I1(rst_i_IBUF),
        .I2(cfg_arvalid_i_IBUF),
        .I3(\ulite_status_reg[1]_i_2_n_0 ),
        .I4(p_0_in9_in),
        .I5(cfg_rready_i_IBUF),
        .O(\ulite_status_reg[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \ulite_status_reg[1]_i_2 
       (.I0(cfg_araddr_i_IBUF[3]),
        .I1(cfg_araddr_i_IBUF[2]),
        .I2(cfg_rvalid_o_i_4_n_0),
        .O(\ulite_status_reg[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFAFFFFFFFAFCF0FC)) 
    \ulite_status_reg[2]_i_1 
       (.I0(cfg_awaddr_i_IBUF[3]),
        .I1(txdone_reg_n_0),
        .I2(rst_i_IBUF),
        .I3(ulite_tx_reg1),
        .I4(\ulite_status_reg[3]_i_2_n_0 ),
        .I5(p_1_in),
        .O(\ulite_status_reg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h05030F0305000000)) 
    \ulite_status_reg[3]_i_1 
       (.I0(cfg_awaddr_i_IBUF[3]),
        .I1(txdone_reg_n_0),
        .I2(rst_i_IBUF),
        .I3(ulite_tx_reg1),
        .I4(\ulite_status_reg[3]_i_2_n_0 ),
        .I5(\ulite_status_reg_reg_n_0_[3] ),
        .O(\ulite_status_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000B800)) 
    \ulite_status_reg[3]_i_2 
       (.I0(cfg_wdata_i_IBUF[0]),
        .I1(cfg_awaddr_i_IBUF[3]),
        .I2(p_1_in),
        .I3(cfg_awaddr_i_IBUF[2]),
        .I4(\ulite_status_reg[3]_i_3_n_0 ),
        .I5(\ulite_status_reg[4]_i_2_n_0 ),
        .O(\ulite_status_reg[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \ulite_status_reg[3]_i_3 
       (.I0(cfg_awaddr_i_IBUF[0]),
        .I1(cfg_awaddr_i_IBUF[1]),
        .O(\ulite_status_reg[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00EF0020)) 
    \ulite_status_reg[4]_i_1 
       (.I0(cfg_wdata_i_IBUF[4]),
        .I1(\ulite_status_reg[4]_i_2_n_0 ),
        .I2(\ulite_status_reg[4]_i_3_n_0 ),
        .I3(rst_i_IBUF),
        .I4(\ulite_status_reg_reg_n_0_[4] ),
        .O(\ulite_status_reg[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \ulite_status_reg[4]_i_2 
       (.I0(cfg_awaddr_i_IBUF[4]),
        .I1(cfg_awaddr_i_IBUF[5]),
        .I2(cfg_awaddr_i_IBUF[6]),
        .I3(cfg_awaddr_i_IBUF[7]),
        .O(\ulite_status_reg[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \ulite_status_reg[4]_i_3 
       (.I0(cfg_awvalid_i_IBUF),
        .I1(cfg_wvalid_i_IBUF),
        .I2(cfg_awaddr_i_IBUF[2]),
        .I3(cfg_awaddr_i_IBUF[3]),
        .I4(cfg_awaddr_i_IBUF[1]),
        .I5(cfg_awaddr_i_IBUF[0]),
        .O(\ulite_status_reg[4]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_status_reg_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\ulite_status_reg[1]_i_1_n_0 ),
        .Q(p_0_in9_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_status_reg_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\ulite_status_reg[2]_i_1_n_0 ),
        .Q(p_1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_status_reg_reg[3] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\ulite_status_reg[3]_i_1_n_0 ),
        .Q(\ulite_status_reg_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_status_reg_reg[4] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\ulite_status_reg[4]_i_1_n_0 ),
        .Q(\ulite_status_reg_reg_n_0_[4] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ulite_tx_reg[0]_i_1 
       (.I0(cfg_wdata_i_IBUF[0]),
        .I1(cfg_awaddr_i_IBUF[3]),
        .O(\ulite_tx_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ulite_tx_reg[1]_i_1 
       (.I0(cfg_wdata_i_IBUF[1]),
        .I1(cfg_awaddr_i_IBUF[3]),
        .O(\ulite_tx_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ulite_tx_reg[2]_i_1 
       (.I0(cfg_wdata_i_IBUF[2]),
        .I1(cfg_awaddr_i_IBUF[3]),
        .O(\ulite_tx_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ulite_tx_reg[3]_i_1 
       (.I0(cfg_wdata_i_IBUF[3]),
        .I1(cfg_awaddr_i_IBUF[3]),
        .O(\ulite_tx_reg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ulite_tx_reg[4]_i_1 
       (.I0(cfg_wdata_i_IBUF[4]),
        .I1(cfg_awaddr_i_IBUF[3]),
        .O(\ulite_tx_reg[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ulite_tx_reg[5]_i_1 
       (.I0(cfg_wdata_i_IBUF[5]),
        .I1(cfg_awaddr_i_IBUF[3]),
        .O(\ulite_tx_reg[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ulite_tx_reg[6]_i_1 
       (.I0(cfg_wdata_i_IBUF[6]),
        .I1(cfg_awaddr_i_IBUF[3]),
        .O(\ulite_tx_reg[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \ulite_tx_reg[7]_i_1 
       (.I0(cfg_wvalid_i_IBUF),
        .I1(cfg_awvalid_i_IBUF),
        .I2(\ulite_status_reg[3]_i_2_n_0 ),
        .O(ulite_tx_reg));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \ulite_tx_reg[7]_i_2 
       (.I0(cfg_wdata_i_IBUF[7]),
        .I1(cfg_awaddr_i_IBUF[3]),
        .O(\ulite_tx_reg[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_tx_reg_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg),
        .D(\ulite_tx_reg[0]_i_1_n_0 ),
        .Q(\ulite_tx_reg_reg_n_0_[0] ),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_tx_reg_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg),
        .D(\ulite_tx_reg[1]_i_1_n_0 ),
        .Q(\ulite_tx_reg_reg_n_0_[1] ),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_tx_reg_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg),
        .D(\ulite_tx_reg[2]_i_1_n_0 ),
        .Q(\ulite_tx_reg_reg_n_0_[2] ),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_tx_reg_reg[3] 
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg),
        .D(\ulite_tx_reg[3]_i_1_n_0 ),
        .Q(\ulite_tx_reg_reg_n_0_[3] ),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_tx_reg_reg[4] 
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg),
        .D(\ulite_tx_reg[4]_i_1_n_0 ),
        .Q(\ulite_tx_reg_reg_n_0_[4] ),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_tx_reg_reg[5] 
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg),
        .D(\ulite_tx_reg[5]_i_1_n_0 ),
        .Q(\ulite_tx_reg_reg_n_0_[5] ),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_tx_reg_reg[6] 
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg),
        .D(\ulite_tx_reg[6]_i_1_n_0 ),
        .Q(\ulite_tx_reg_reg_n_0_[6] ),
        .R(rst_i_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \ulite_tx_reg_reg[7] 
       (.C(clk_i_IBUF_BUFG),
        .CE(ulite_tx_reg),
        .D(\ulite_tx_reg[7]_i_2_n_0 ),
        .Q(\ulite_tx_reg_reg_n_0_[7] ),
        .R(rst_i_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
