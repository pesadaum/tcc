onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/top_inst/q_control_inst/ready
add wave -noupdate /top_tb/top_inst/q_control_inst/clk
add wave -noupdate /top_tb/top_inst/q_control_inst/rst
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/ready
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/clk
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/rst
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/enable
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/q_desired
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/q_measured
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/i_ref
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/went_unstable
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/state
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/a
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/b
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/c
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/a_f
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/b_f
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/c_f
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/f_a
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/f_b
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/f_c
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/slope
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/converged
add wave -noupdate -expand -group Q_CONTROL /top_tb/top_inst/q_control_inst/error
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/q_serialized
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/start
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/ready
add wave -noupdate -expand -group Q_MEASUREMENT /top_tb/top_inst/q_measurement_inst/q_measured
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/i_ref
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/clk
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/rst
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/enable
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/ready
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/went_unstable
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/i_ref_max
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/i_ref_smp_1
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/i_ref_smp_2
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/i_ref_smp_3
add wave -noupdate -expand -group I_REF_SAMPLING /top_tb/top_inst/i_ref_sampling_inst/i_ref_smp_4
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group I_REF_MUX /top_tb/top_inst/i_ref_mux_inst/went_unstable
add wave -noupdate -expand -group I_REF_MUX /top_tb/top_inst/i_ref_mux_inst/i_ref
add wave -noupdate -expand -group I_REF_MUX /top_tb/top_inst/i_ref_mux_inst/i_ref_max
add wave -noupdate -expand -group I_REF_MUX /top_tb/top_inst/i_ref_mux_inst/i_ref_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {22300 ps} 0}
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
WaveRestoreZoom {0 ps} {119175 ps}
