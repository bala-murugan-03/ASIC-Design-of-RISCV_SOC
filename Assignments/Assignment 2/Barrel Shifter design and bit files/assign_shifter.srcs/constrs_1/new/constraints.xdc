#system clk H16 - 125MHz
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports clk_in1_0]

#Inputs en and reset from slider switches
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports reset_0]
#set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports en]

#LEDS for count and clk_count
#LEDS
#set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {count[0]}]
#set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {count[1]}]
#set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {count[2]}]
#set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {count[3]}]
#RGBLEDS
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports clk_count]; 


