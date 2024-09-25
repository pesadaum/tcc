quit -sim

vlib work
vmap work work

vlog -work work *.v *.sv

vsim work.setup_completed_tb
add wave *
config wave -signalnamewidth 1

radix -unsigned
run -all
