quit -sim

vlib work
vmap work work

vlog -work work *.v *.sv

# vsim work.control_tb
vsim work.control_tb_new
# add wave *
do wave.do
config wave -signalnamewidth 1

radix -unsigned
run -all
