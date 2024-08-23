onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/ready
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/clk
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/rst
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/enable
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/q_desired
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/q_measured
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/i_ref_setup
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/i_ref
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/a
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/b
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/c
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/converged
add wave -noupdate -expand -group control_inst /top_tb/top_inst/q_control_inst/error
add wave -noupdate /top_tb/top_inst/q_measurement_inst/q_serialized
add wave -noupdate /top_tb/top_inst/q_measurement_inst/clk
add wave -noupdate /top_tb/top_inst/q_measurement_inst/rst
add wave -noupdate /top_tb/top_inst/q_measurement_inst/start
add wave -noupdate /top_tb/top_inst/q_measurement_inst/ready
add wave -noupdate /top_tb/top_inst/q_measurement_inst/q_measured
add wave -noupdate /top_tb/top_inst/q_measurement_inst/wtd
add wave -noupdate /top_tb/top_inst/q_measurement_inst/q_pulses_count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {170 ps} 0}
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
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {315 ps}
