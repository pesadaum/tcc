
vlib work
vmap work work

vlog -work work *.v *.sv

vsim work.top_tb
# add wave *
add wave -position insertpoint sim:/top_tb/top_inst/q_control_inst/*
add wave -position insertpoint sim:/top_tb/top_inst/q_measurement_inst/*
config wave -signalnamewidth 1

radix -unsigned
run 500
