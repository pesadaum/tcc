set_db init_lib_search_path ../lib/
set_db init_hdl_search_path ../rtl/
read_libs slow_vdd1v0_basicCells.lib

read_hdl {top.v i_ref_sampling.v bisection.v i_ref_mux.v q_measurement.v}

elaborate top
read_sdc ../constraints/constraints_top.sdc

set_db syn_generic_effort high
set_db syn_map_effort high
set_db syn_opt_effort high

set_db optimize_constant_0_flops false
set_db optimize_constant_1_flops false
set_db hdl_preserve_unused_registers false

syn_generic
syn_map
syn_opt

#reports
report_timing > reports/report_timing.rpt
report_power  > reports/report_power.rpt
report_area   > reports/report_area.rpt
report_qor    > reports/report_qor.rpt


#Outputs
write_hdl > outputs/top_netlist.v
write_sdc > outputs/top_sdc.sdc
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge  -setuphold split > outputs/delays.sdf
