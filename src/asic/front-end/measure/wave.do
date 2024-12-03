onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /q_measurement_tb/DUT/q_serialized
add wave -noupdate /q_measurement_tb/DUT/clk
add wave -noupdate /q_measurement_tb/DUT/rst
add wave -noupdate /q_measurement_tb/DUT/start
add wave -noupdate /q_measurement_tb/DUT/ready
add wave -noupdate /q_measurement_tb/DUT/q_measured
add wave -noupdate /q_measurement_tb/DUT/wtd
add wave -noupdate /q_measurement_tb/DUT/q_pulses_count
add wave -noupdate /q_measurement_tb/DUT/wtd_lock
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {177 ps}
