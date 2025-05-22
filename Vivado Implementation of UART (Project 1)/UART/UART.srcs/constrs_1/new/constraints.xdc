set_property PACKAGE_PIN H16 [get_ports clk_i]
set_property IOSTANDARD LVCMOS33 [get_ports clk_i]
create_clock -name clk_i -period 8.0 [get_ports clk_i]
