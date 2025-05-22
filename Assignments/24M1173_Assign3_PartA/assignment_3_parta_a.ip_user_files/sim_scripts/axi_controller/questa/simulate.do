onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axi_controller_opt

do {wave.do}

view wave
view structure
view signals

do {axi_controller.udo}

run -all

quit -force
