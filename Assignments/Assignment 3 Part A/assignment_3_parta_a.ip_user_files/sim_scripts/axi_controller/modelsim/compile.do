vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_bram_ctrl_v4_1_4
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4

vmap xpm modelsim_lib/msim/xpm
vmap axi_bram_ctrl_v4_1_4 modelsim_lib/msim/axi_bram_ctrl_v4_1_4
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4

vlog -work xpm  -incr -sv "+incdir+../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/d0f7" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_bram_ctrl_v4_1_4  -93 \
"../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/c9f0/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/axi_controller/ip/axi_controller_axi_bram_ctrl_0_0/sim/axi_controller_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  -incr "+incdir+../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/d0f7" \
"../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/d0f7" \
"../../../bd/axi_controller/ip/axi_controller_blk_mem_gen_0_0/sim/axi_controller_blk_mem_gen_0_0.v" \
"../../../bd/axi_controller/sim/axi_controller.v" \
"../../../bd/axi_controller/ip/axi_controller_clk_wiz_0_0/axi_controller_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/axi_controller/ip/axi_controller_clk_wiz_0_0/axi_controller_clk_wiz_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

