vlib work
vmap work work

restart -f

vlog -work work *.v *.sv

vsim work.q_measurement_tb
add wave *
config wave -signalnamewidth 1

radix -decimal
run -all
