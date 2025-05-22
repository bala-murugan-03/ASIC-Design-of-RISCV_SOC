vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4

vlog -work xpm  -incr -sv "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/46fd/hdl" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/46fd/hdl" \
"../../../bd/design_1/ip/design_1_controller_0_0/sim/design_1_controller_0_0.v" \

vlog -work blk_mem_gen_v8_4_4  -incr "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/46fd/hdl" \
"../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/d0f7" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/1b7e/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/122e/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/b205/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/c968/hdl/verilog" "+incdir+../../../../assign_dadda_mult.gen/sources_1/bd/design_1/ipshared/46fd/hdl" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
"../../../bd/design_1/ip/design_1_ila_0_0/sim/design_1_ila_0_0.v" \
"../../../bd/design_1/ip/design_1_dadda_mult_0_0/sim/design_1_dadda_mult_0_0.v" \
"../../../bd/design_1/ip/design_1_vio_0_0/sim/design_1_vio_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_1_0/design_1_clk_wiz_1_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

