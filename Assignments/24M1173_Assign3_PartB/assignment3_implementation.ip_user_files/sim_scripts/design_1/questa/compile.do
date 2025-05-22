vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/axi_bram_ctrl_v4_1_4
vlib questa_lib/msim/blk_mem_gen_v8_4_4

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap axi_bram_ctrl_v4_1_4 questa_lib/msim/axi_bram_ctrl_v4_1_4
vmap blk_mem_gen_v8_4_4 questa_lib/msim/blk_mem_gen_v8_4_4

vlog -work xil_defaultlib  "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" \
"../../../bd/design_1/ip/design_1_controller_0_0/sim/design_1_controller_0_0.v" \

vcom -work axi_bram_ctrl_v4_1_4  -93 \
"../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/c9f0/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design_1/ip/design_1_axi_bram_ctrl_0_0/sim/design_1_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" \
"../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../assignment3_implementation.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
"../../../bd/design_1/ip/design_1_dadda_mult_0_0/sim/design_1_dadda_mult_0_0.v" \
"../../../bd/design_1/ip/design_1_ila_0_0/sim/design_1_ila_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

