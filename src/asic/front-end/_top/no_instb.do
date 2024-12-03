onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/top_inst/q_control_inst/clk
add wave -noupdate /top_tb/top_inst/q_control_inst/rst
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/q_desired
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/q_measured
add wave -noupdate -expand -group Q_CONTROL -format Analog-Step -height 100 -max 479.43799999999999 /top_tb/top_inst/q_control_inst/i_ref
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/error
add wave -noupdate -expand -group Q_CONTROL -format Analog-Step -height 74 -max 168.76712328767121 /top_tb/top_inst/q_control_inst/error
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/went_unstable
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/converged
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/enable
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/q_desired
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/q_measured
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/i_ref
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/error
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/went_unstable
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/converged
add wave -noupdate -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/start
add wave -noupdate -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/ready
add wave -noupdate -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/q_serialized
add wave -noupdate -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/start
add wave -noupdate -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/ready
add wave -noupdate -group Q_MEASUREMENT -height 50 /top_tb/top_inst/q_measurement_inst/q_measured
add wave -noupdate -group Q_MEASUREMENT -format Analog-Step -height 74 -max 222.86301369863017 -min 33.0 /top_tb/top_inst/q_measurement_inst/q_measured
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {15000 ps} 1} {{Cursor 2} {571000 ps} 1} {{Cursor 3} {1275000 ps} 1} {{Cursor 4} {3641000 ps} 1} {{Cursor 5} {9887000 ps} 0} {{Cursor 6} {1760734 ps} 0}
quietly wave cursor active 6
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
WaveRestoreZoom {0 ps} {5118118 ps}
