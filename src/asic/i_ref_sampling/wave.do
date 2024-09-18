onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/i_ref
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/clk
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/rst
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/enable
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/ready
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/went_unstable
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/i_ref_max
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/i_ref_smp_1
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/i_ref_smp_2
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/i_ref_smp_3
add wave -noupdate -expand -group DUT /i_ref_sampling_tb/i_ref_sampling_inst/i_ref_smp_4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {27 ps} 0}
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
WaveRestoreZoom {0 ps} {94 ps}
