#system clk H16 - 125MHz
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports sys_clock]

#Input reset from slider switch
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports reset_rtl]