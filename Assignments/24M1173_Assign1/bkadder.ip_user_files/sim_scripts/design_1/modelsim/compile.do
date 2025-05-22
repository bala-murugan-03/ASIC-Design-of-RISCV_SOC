vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/blk_mem_gen_v8_4_4
vlib modelsim_lib/msim/xil_defaultlib

vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work blk_mem_gen_v8_4_4  -incr "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/46fd/hdl" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" \
"../../../../bkadder.gen/sources_1/bd/design_1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/46fd/hdl" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../bkadder.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_1/sim/design_1_blk_mem_gen_0_1.v" \
"../../../bd/design_1/ip/design_1_bkadder_0_0/sim/design_1_bkadder_0_0.v" \
"../../../bd/design_1/ip/design_1_controller_0_0/sim/design_1_controller_0_0.v" \
"../../../bd/design_1/ip/design_1_vio_0_0/sim/design_1_vio_0_0.v" \
"../../../bd/design_1/ip/design_1_ila_0_0/sim/design_1_ila_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

