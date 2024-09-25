
//input ports
add mapped point q_serialized q_serialized -type PI PI
add mapped point start start -type PI PI
add mapped point clk clk -type PI PI
add mapped point rst rst -type PI PI
add mapped point enable enable -type PI PI
add mapped point q_desired[9] q_desired[9] -type PI PI
add mapped point q_desired[8] q_desired[8] -type PI PI
add mapped point q_desired[7] q_desired[7] -type PI PI
add mapped point q_desired[6] q_desired[6] -type PI PI
add mapped point q_desired[5] q_desired[5] -type PI PI
add mapped point q_desired[4] q_desired[4] -type PI PI
add mapped point q_desired[3] q_desired[3] -type PI PI
add mapped point q_desired[2] q_desired[2] -type PI PI
add mapped point q_desired[1] q_desired[1] -type PI PI
add mapped point q_desired[0] q_desired[0] -type PI PI

//output ports
add mapped point i_ref_out[9] i_ref_out[9] -type PO PO
add mapped point i_ref_out[8] i_ref_out[8] -type PO PO
add mapped point i_ref_out[7] i_ref_out[7] -type PO PO
add mapped point i_ref_out[6] i_ref_out[6] -type PO PO
add mapped point i_ref_out[5] i_ref_out[5] -type PO PO
add mapped point i_ref_out[4] i_ref_out[4] -type PO PO
add mapped point i_ref_out[3] i_ref_out[3] -type PO PO
add mapped point i_ref_out[2] i_ref_out[2] -type PO PO
add mapped point i_ref_out[1] i_ref_out[1] -type PO PO
add mapped point i_ref_out[0] i_ref_out[0] -type PO PO

//inout ports




//Sequential Pins



//Black Boxes
add mapped point i_ref_mux_inst i_ref_mux_inst -type BBOX BBOX
add mapped point i_ref_sampling_inst i_ref_sampling_inst -type BBOX BBOX
add mapped point q_control_inst q_control_inst -type BBOX BBOX
add mapped point q_measurement_inst q_measurement_inst -type BBOX BBOX



//Empty Modules as Blackboxes
