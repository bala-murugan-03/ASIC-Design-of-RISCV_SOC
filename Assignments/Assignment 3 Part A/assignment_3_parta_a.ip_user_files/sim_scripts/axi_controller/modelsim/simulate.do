onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xpm -L axi_bram_ctrl_v4_1_4 -L xil_defaultlib -L blk_mem_gen_v8_4_4 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.axi_controller xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {axi_controller.udo}

run -all

quit -force
