#!/bin/sh
export OPENRAM_TECH="/mnt/c/Users/madha/OpenRAM/technology:/mnt/c/Users/madha/OpenRAM/compiler/../technology"
echo "$(date): Starting LVS using Netgen /mnt/c/Users/madha/OpenRAM/miniconda/bin/netgen"
/mnt/c/Users/madha/OpenRAM/miniconda/bin/netgen -noconsole << EOF
lvs {sky130_sram_1kbytes_1rw1r_20x256_20.spice sky130_sram_1kbytes_1rw1r_20x256_20} {sky130_sram_1kbytes_1rw1r_20x256_20.lvs.sp sky130_sram_1kbytes_1rw1r_20x256_20} setup.tcl sky130_sram_1kbytes_1rw1r_20x256_20.lvs.report -full -json
quit
EOF
magic_retcode=$?
echo "$(date): Finished ($magic_retcode) LVS using Netgen /mnt/c/Users/madha/OpenRAM/miniconda/bin/netgen"
exit $magic_retcode
