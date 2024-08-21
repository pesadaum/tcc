
vlib work
vmap work work

vlog -work work *.v *.sv

vsim work.top_tb
add wave *
config wave -signalnamewidth 1

radix -unsigned
run 500
