onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_tb_new/DUT/BUS_WIDTH
add wave -noupdate /control_tb_new/DUT/TOL
add wave -noupdate /control_tb_new/DUT/ready
add wave -noupdate /control_tb_new/DUT/clk
add wave -noupdate /control_tb_new/DUT/rst
add wave -noupdate /control_tb_new/DUT/q_desired
add wave -noupdate /control_tb_new/DUT/q_measured
add wave -noupdate /control_tb_new/DUT/i_ref_setup
add wave -noupdate /control_tb_new/DUT/went_unstable
add wave -noupdate /control_tb_new/DUT/i_ref
add wave -noupdate /control_tb_new/DUT/state
add wave -noupdate /control_tb_new/DUT/a
add wave -noupdate /control_tb_new/DUT/b
add wave -noupdate /control_tb_new/DUT/c
add wave -noupdate /control_tb_new/DUT/f_a
add wave -noupdate /control_tb_new/DUT/f_b
add wave -noupdate /control_tb_new/DUT/f_c
add wave -noupdate /control_tb_new/DUT/slope
add wave -noupdate /control_tb_new/DUT/converged
add wave -noupdate /control_tb_new/DUT/error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17 ps} 0}
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
WaveRestoreZoom {0 ps} {126 ps}
