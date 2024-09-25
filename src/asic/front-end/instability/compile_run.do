quit -sim

vlib work
vmap work work

vlog -work work *.v *.sv

vsim work.instability_detect_tb
add wave *
config wave -signalnamewidth 1

radix -unsigned
run -all
