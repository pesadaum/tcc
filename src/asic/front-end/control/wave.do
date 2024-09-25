onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_tb_new/clk
add wave -noupdate /control_tb_new/ready
add wave -noupdate /control_tb_new/rst
add wave -noupdate /control_tb_new/desired_q
add wave -noupdate /control_tb_new/measured_q
add wave -noupdate /control_tb_new/i_ref_setup
add wave -noupdate /control_tb_new/i_ref
add wave -noupdate /control_tb_new/a
add wave -noupdate /control_tb_new/b
add wave -noupdate /control_tb_new/c
add wave -noupdate /control_tb_new/error
add wave -noupdate /control_tb_new/converged
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {93 ps} 0} {{Cursor 2} {11 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {126 ps}
