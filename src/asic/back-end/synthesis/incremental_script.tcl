set_db init_lib_search_path ../lib/
set_db init_hdl_search_path ../rtl/
read_libs slow_vdd1v0_basicCells.lib

read_hdl {top.v bisection.v i_ref_sampling.v i_ref_mux.v q_measurement.v}

elaborate top

check_design
# 
read_sdc ../constraints/constraints_top.sdc
# 
set_db syn_generic_effort high
set_db syn_map_effort high
set_db syn_opt_effort high
# 
set_db optimize_constant_0_flops false
set_db optimize_constant_1_flops false
set_db hdl_preserve_unused_registers false

# 
report_hierarchy
# 
syn_generic
syn_map
syn_opt

gui_show
write_hdl > outputs/incr_top_netlist.v