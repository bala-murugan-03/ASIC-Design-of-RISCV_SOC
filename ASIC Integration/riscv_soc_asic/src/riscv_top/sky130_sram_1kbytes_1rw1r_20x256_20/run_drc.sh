#!/bin/sh
export OPENRAM_TECH="/mnt/c/Users/madha/OpenRAM/technology:/mnt/c/Users/madha/OpenRAM/compiler/../technology"
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__openram_dp_cell.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__openram_dp_cell_dummy.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__openram_dp_cell_replica.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_cell_opt1a.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__openram_sp_cell_opt1a_dummy.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_cell_opt1_ce.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_cell_opt1.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__openram_sp_cell_opt1_replica.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__openram_sp_cell_opt1a_replica.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_colend.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_colend_cent.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_colend_p_cent.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_colenda.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_colenda_cent.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_colenda_p_cent.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_rowend.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_rowenda.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__openram_sp_rowend_replica.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__openram_sp_rowenda_replica.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_corner.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_cornera.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_cornerb.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_wlstrapa.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_wlstrap_ce.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_wlstrap.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_wlstrap_p_ce.mag .
cp /mnt/c/Users/madha/OpenRAM/technology/sky130/maglef_lib/sky130_fd_bd_sram__sram_sp_wlstrap_p.mag .
echo "$(date): Starting DRC using Magic /mnt/c/Users/madha/OpenRAM/miniconda/bin/magic"

/mnt/c/Users/madha/OpenRAM/miniconda/bin/magic -dnull -noconsole << EOF
load sky130_sram_1kbytes_1rw1r_20x256_20 -dereference
puts "Finished loading cell sky130_sram_1kbytes_1rw1r_20x256_20"
cellname delete \(UNNAMED\)
select top cell
expand
puts "Finished expanding"
drc euclidean on
drc check
puts "Finished drc check"
drc catchup
puts "Finished drc catchup"
drc count total
quit -noprompt
EOF
magic_retcode=$?
echo "$(date): Finished ($magic_retcode) DRC using Magic /mnt/c/Users/madha/OpenRAM/miniconda/bin/magic"
exit $magic_retcode
