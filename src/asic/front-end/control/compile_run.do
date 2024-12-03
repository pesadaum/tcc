quit -sim

vlib work
vmap work work

vlog -work work *.v *.sv

# vsim work.control_tb
vsim work.control_tb_new
add wave *
config wave -signalnamewidth 1

radix -unsigned
run -all
