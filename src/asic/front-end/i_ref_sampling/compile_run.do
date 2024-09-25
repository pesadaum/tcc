
vlib work
vmap work work

vlog -work work *.v *.sv

vsim work.i_ref_sampling_tb
config wave -signalnamewidth 1

do wave.do
radix -unsigned
run -all
