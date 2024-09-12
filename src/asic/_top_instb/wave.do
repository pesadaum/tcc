onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/q_serialized
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/start
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/ready
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/q_measured
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/clk
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/rst
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/ready
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/enable
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/q_measured
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/i_ref_setup
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/found
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/setup_completed
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/curr_q
add wave -noupdate -expand -group Q_INSTB_DETECT /top_tb/top_inst/instb_detect_inst/last_q
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group RESONANT_SYS /top_tb/resonant_sys_inst/i_ref
add wave -noupdate -expand -group RESONANT_SYS /top_tb/resonant_sys_inst/start
add wave -noupdate -expand -group RESONANT_SYS /top_tb/resonant_sys_inst/q_serialized
add wave -noupdate -expand -group RESONANT_SYS /top_tb/resonant_sys_inst/q_parallel
add wave -noupdate -expand -group RESONANT_SYS /top_tb/resonant_sys_inst/n_of_pulses
add wave -noupdate -expand -group RESONANT_SYS /top_tb/resonant_sys_inst/pulses_ended
add wave -noupdate -expand -group SETUP_COMPLETED /top_tb/top_inst/setup_completed_inst/i_ref
add wave -noupdate -expand -group SETUP_COMPLETED /top_tb/top_inst/setup_completed_inst/i_ref_setup
add wave -noupdate -expand -group SETUP_COMPLETED /top_tb/top_inst/setup_completed_inst/completed
add wave -noupdate -expand -group SETUP_COMPLETED /top_tb/top_inst/setup_completed_inst/i_ref_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 1} {{Cursor 2} {295 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {541 ps}
