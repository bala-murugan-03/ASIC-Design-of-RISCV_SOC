-makelib ies_lib/xpm -sv \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_bram_ctrl_v4_1_4 \
  "../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/c9f0/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/axi_controller/ip/axi_controller_axi_bram_ctrl_0_0/sim/axi_controller_axi_bram_ctrl_0_0.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_4 \
  "../../../../assignment_3_parta_a.gen/sources_1/bd/axi_controller/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/axi_controller/ip/axi_controller_blk_mem_gen_0_0/sim/axi_controller_blk_mem_gen_0_0.v" \
  "../../../bd/axi_controller/sim/axi_controller.v" \
  "../../../bd/axi_controller/ip/axi_controller_clk_wiz_0_0/axi_controller_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/axi_controller/ip/axi_controller_clk_wiz_0_0/axi_controller_clk_wiz_0_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

