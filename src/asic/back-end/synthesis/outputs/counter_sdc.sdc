# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.16-s062_1 on Tue Sep 24 21:40:14 -03 2024

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design top

set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
