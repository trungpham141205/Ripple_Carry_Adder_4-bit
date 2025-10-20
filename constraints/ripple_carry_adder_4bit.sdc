#------------------------------------------------------------
# Full Adder 1-bit Timing Constraints
#------------------------------------------------------------

create_clock -name "virtual_clk" -period 20

set_input_delay 0.5 -clock "virtual_clk" [get_ports {a b cin}]

set_output_delay 0.5 -clock "virtual_clk" [get_ports {sum carry}]
