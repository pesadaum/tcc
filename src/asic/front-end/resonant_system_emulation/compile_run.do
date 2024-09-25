vlib work
vmap work work

vlog -work work *.sv

vsim work.resonant_sys_tb
add wave *
config wave -signalnamewidth 1

radix -unsigned
run -all
