onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/q_desired
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/i_ref
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/error
add wave -noupdate -expand -group Q_CONTROL -format Analog-Step -height 150 -max 171.0 /top_tb/top_inst/q_control_inst/error
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/went_unstable
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/converged
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/q_serialized
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/ready
add wave -noupdate -expand -group Q_MEASUREMENT -height 35 /top_tb/top_inst/q_measurement_inst/q_measured
add wave -noupdate -expand -group Q_MEASUREMENT -format Analog-Step -height 150 -max 100.0 -min 16.0 /top_tb/top_inst/q_measurement_inst/q_measured
add wave -noupdate -expand -group MUX_OUT -height 30 /top_tb/top_inst/i_ref_mux_inst/went_unstable
add wave -noupdate -expand -group MUX_OUT /top_tb/top_inst/i_ref_mux_inst/i_ref
add wave -noupdate -expand -group MUX_OUT /top_tb/top_inst/i_ref_mux_inst/i_ref_max
add wave -noupdate -expand -group MUX_OUT /top_tb/top_inst/i_ref_mux_inst/i_ref_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {41436000 ps} 1} {{Cursor 2} {159149608 ps} 0} {{Cursor 3} {155961829 ps} 1}
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
configure wave -timeline 1
configure wave -timelineunits ns
update
WaveRestoreZoom {157990680 ps} {164215122 ps}
