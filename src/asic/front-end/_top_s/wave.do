onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/ready
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/q_desired
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/q_measured
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/i_ref
add wave -noupdate -expand -group Q_CONTROL -height 40 /top_tb/top_inst/q_control_inst/slope
add wave -noupdate -expand -group Q_CONTROL -format Analog-Step -height 150 -max 180.0 /top_tb/top_inst/q_control_inst/error
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/error
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/converged
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/went_unstable
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/q_serialized
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/ready
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/q_measured
add wave -noupdate -expand -group Q_MEASUREMENT -format Analog-Step -height 150 -max 310.0 -min 21.0 /top_tb/top_inst/q_measurement_inst/q_measured
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {1702100 ps} 0}
quietly wave cursor active 1
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
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {1120352 ps} {2555040 ps}
