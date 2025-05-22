vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/axi_bram_ctrl_v4_1_4
vlib activehdl/xil_defaultlib
vlib activehdl/blk_mem_gen_v8_4_4

vmap xpm activehdl/xpm
vmap axi_bram_ctrl_v4_1_4 activehdl/axi_bram_ctrl_v4_1_4
vmap xil_defaultlib activehdl/xil_defaultlib
vmap blk_mem_gen_v8_4_4 activehdl/blk_mem_gen_v8_4_4

vlog -work xpm  -sv2k12 "+incdir+../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/d0f7" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_bram_ctrl_v4_1_4 -93 \
"../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/c9f0/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/axi_controller/ip/axi_controller_axi_bram_ctrl_0_0/sim/axi_controller_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/d0f7" \
"../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/d0f7" \
"../../../bd/axi_controller/ip/axi_controller_blk_mem_gen_0_0/sim/axi_controller_blk_mem_gen_0_0.v" \
"../../../bd/axi_controller/sim/axi_controller.v" \
"../../../bd/axi_controller/ip/axi_controller_clk_wiz_0_0/axi_controller_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/axi_controller/ip/axi_controller_clk_wiz_0_0/axi_controller_clk_wiz_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

