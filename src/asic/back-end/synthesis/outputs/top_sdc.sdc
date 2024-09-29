# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.16-s062_1 on Sun Sep 29 14:31:48 -03 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design top

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports rst]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[9]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[8]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[7]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[6]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[5]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[4]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {i_ref_out[0]}]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
