set_db init_lib_search_path {/home/cadence/cadence/pdks/gpdk45/gpdk045_v_6_0}
set_db init_hdl_search_path {/home/aosantos/tcc/control/}

# Reading techlib
read_libs cds.lib

# Reading source code
read_hdl bisection.v

# setting flags for efort
set_db syn_generic_effort low
set_db syn_map_effort low
set_db syn_opt_effort low

# synthesizing
syn_generic
syn_map
syn_opt


# Reports
report_timing > timing.rpt
report_power  > power.rpt
report_area   > area.rpt
report_qor    > qor.rpt

# output files
write_hdl > out.v
write_sdc > out.sdc
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge -setuphold split > delays.sdf