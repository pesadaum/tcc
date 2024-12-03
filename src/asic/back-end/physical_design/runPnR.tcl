set_db init_netlist_files ../synthesis/outputs/top_netlist.v
set_db init_lef_files {../lef/gsclib045_tech.lef ../lef/gsclib045_macro.lef}
set_db init_power_nets VDD
set_db init_ground_nets VSS
set_db init_mmmc_files  MMMC.view

set_db design_flow_effort extreme

set_db design_top_routing_layer Metal11
set_db design_bottom_routing_layer Metal3

# uncomment this if NOT using an IO definition file
set_db place_global_place_io_pins TRUE
set_db place_detail_io_pin_blockage true
# uncomment this if NOT using an IO definition file

### tryout
set_db place_detail_preserve_routing FALSE
set_db place_detail_use_check_drc TRUE
set_db place_detail_check_route TRUE
set_db route_design_route_clock_nets_first FALSE
### tryout

read_mmmc MMMC.view
read_physical -lef {../lef/gsclib045_tech.lef ../lef/gsclib045_macro.lef}
read_netlist ../synthesis/outputs/top_netlist.v -top top
init_design 


connect_global_net VDD -type pg_pin -pin_base_name VDD -inst_base_name *
connect_global_net VSS -type pg_pin -pin_base_name VSS -inst_base_name *

#Create Floorplan
create_floorplan -core_margins_by die -site CoreSite -core_density_size 1 0.75 2.5 2.5 2.5 2.5

#Pin Assignment
# read_io_file top.newpinloc.io

#Power Planning
set_db add_rings_skip_shared_inner_ring none ; set_db add_rings_avoid_short 1 ; set_db add_rings_ignore_rows 0 ; set_db add_rings_extend_over_row 0

#Add Rings
add_rings -type core_rings -jog_distance 0.6 -threshold 0.6 -nets {VDD VSS} -follow core -layer {bottom Metal11 top Metal11 right Metal10 left Metal10} -width 0.7 -spacing .4 -offset 0.6

#Add Stripes
add_stripes -block_ring_top_layer_limit Metal11 -max_same_layer_jog_length 0.44 -pad_core_ring_bottom_layer_limit Metal9 -set_to_set_distance 5 -pad_core_ring_top_layer_limit Metal11 -spacing 0.4 -merge_stripes_value 0.6 -layer Metal10 -block_ring_bottom_layer_limit Metal9 -width 0.3 -nets {VDD VSS} 

# Create Power Rails with Special Route
route_special -connect core_pin -layer_change_range { Metal3(3) Metal11(11) } -block_pin_target nearest_target -core_pin_target first_after_row_end -allow_jogging 1 -crossover_via_layer_range { Metal1(1) Metal11(11) } -nets { VDD VSS } -allow_layer_change 1 -target_via_layer_range { Metal1(1) Metal11(11) }
# Read the Scan DEF
set_db reorder_scan_comp_logic true
# Run Placement Optimization
place_opt_design
# Save the Database
write_db placeOpt 
# Create a Clock Tree Spec and run CTS
create_clock_tree_spec
ccopt_design 
# Save the database
write_db postCTSopt
# Run Detail Routing
set_db route_design_with_timing_driven 1
set_db route_design_with_si_driven 1

set_db route_design_detail_end_iteration 0
set_db route_design_with_timing_driven true
set_db route_design_with_si_driven true
route_design -global_detail
reset_parasitics
extract_rc
