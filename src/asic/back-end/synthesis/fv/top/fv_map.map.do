
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
add mapped point q_control_inst/error[0]/q q_control_inst_error_reg[0]/Q -type DLAT DLAT
add mapped point q_control_inst/error[1]/q q_control_inst_error_reg[1]/Q -type DLAT DLAT
add mapped point q_control_inst/error[2]/q q_control_inst_error_reg[2]/Q -type DLAT DLAT
add mapped point q_control_inst/error[3]/q q_control_inst_error_reg[3]/Q -type DLAT DLAT
add mapped point q_control_inst/error[4]/q q_control_inst_error_reg[4]/Q -type DLAT DLAT
add mapped point q_control_inst/error[5]/q q_control_inst_error_reg[5]/Q -type DLAT DLAT
add mapped point q_control_inst/error[6]/q q_control_inst_error_reg[6]/Q -type DLAT DLAT
add mapped point q_control_inst/error[7]/q q_control_inst_error_reg[7]/Q -type DLAT DLAT
add mapped point q_control_inst/error[8]/q q_control_inst_error_reg[8]/Q -type DLAT DLAT
add mapped point q_control_inst/error[9]/q q_control_inst_error_reg[9]/Q -type DLAT DLAT
add mapped point q_measurement_inst/q_measured[0]/q q_measurement_inst_q_measured_reg[0]/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[0]/q q_measurement_inst_q_measured_reg[0]109/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[1]/q q_measurement_inst_q_measured_reg[1]110/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[2]/q q_measurement_inst_q_measured_reg[2]111/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[3]/q q_measurement_inst_q_measured_reg[3]112/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[4]/q q_measurement_inst_q_measured_reg[4]113/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[5]/q q_measurement_inst_q_measured_reg[5]114/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[6]/q q_measurement_inst_q_measured_reg[6]115/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[7]/q q_measurement_inst_q_measured_reg[7]116/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[8]/q q_measurement_inst_q_measured_reg[8]117/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured_tri_enable_reg[9]/q q_measurement_inst_q_measured_reg[9]118/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[0]/q i_ref_sampling_inst_i_ref_max_reg[0]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[1]/q i_ref_sampling_inst_i_ref_max_reg[1]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[2]/q i_ref_sampling_inst_i_ref_max_reg[2]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[3]/q i_ref_sampling_inst_i_ref_max_reg[3]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[4]/q i_ref_sampling_inst_i_ref_max_reg[4]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[5]/q i_ref_sampling_inst_i_ref_max_reg[5]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[6]/q i_ref_sampling_inst_i_ref_max_reg[6]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[7]/q i_ref_sampling_inst_i_ref_max_reg[7]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[8]/q i_ref_sampling_inst_i_ref_max_reg[8]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_max[9]/q i_ref_sampling_inst_i_ref_max_reg[9]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[0]/q i_ref_sampling_inst_i_ref_smp_1_reg[0]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[1]/q i_ref_sampling_inst_i_ref_smp_1_reg[1]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[2]/q i_ref_sampling_inst_i_ref_smp_1_reg[2]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[3]/q i_ref_sampling_inst_i_ref_smp_1_reg[3]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[4]/q i_ref_sampling_inst_i_ref_smp_1_reg[4]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[5]/q i_ref_sampling_inst_i_ref_smp_1_reg[5]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[6]/q i_ref_sampling_inst_i_ref_smp_1_reg[6]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[7]/q i_ref_sampling_inst_i_ref_smp_1_reg[7]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[8]/q i_ref_sampling_inst_i_ref_smp_1_reg[8]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_1[9]/q i_ref_sampling_inst_i_ref_smp_1_reg[9]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[0]/q i_ref_sampling_inst_i_ref_smp_2_reg[0]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[1]/q i_ref_sampling_inst_i_ref_smp_2_reg[1]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[2]/q i_ref_sampling_inst_i_ref_smp_2_reg[2]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[3]/q i_ref_sampling_inst_i_ref_smp_2_reg[3]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[4]/q i_ref_sampling_inst_i_ref_smp_2_reg[4]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[5]/q i_ref_sampling_inst_i_ref_smp_2_reg[5]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[6]/q i_ref_sampling_inst_i_ref_smp_2_reg[6]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[7]/q i_ref_sampling_inst_i_ref_smp_2_reg[7]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[8]/q i_ref_sampling_inst_i_ref_smp_2_reg[8]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_2[9]/q i_ref_sampling_inst_i_ref_smp_2_reg[9]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[0]/q i_ref_sampling_inst_i_ref_smp_3_reg[0]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[1]/q i_ref_sampling_inst_i_ref_smp_3_reg[1]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[2]/q i_ref_sampling_inst_i_ref_smp_3_reg[2]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[3]/q i_ref_sampling_inst_i_ref_smp_3_reg[3]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[4]/q i_ref_sampling_inst_i_ref_smp_3_reg[4]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[5]/q i_ref_sampling_inst_i_ref_smp_3_reg[5]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[6]/q i_ref_sampling_inst_i_ref_smp_3_reg[6]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[7]/q i_ref_sampling_inst_i_ref_smp_3_reg[7]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[8]/q i_ref_sampling_inst_i_ref_smp_3_reg[8]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_3[9]/q i_ref_sampling_inst_i_ref_smp_3_reg[9]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[0]/q i_ref_sampling_inst_i_ref_smp_4_reg[0]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[1]/q i_ref_sampling_inst_i_ref_smp_4_reg[1]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[2]/q i_ref_sampling_inst_i_ref_smp_4_reg[2]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[3]/q i_ref_sampling_inst_i_ref_smp_4_reg[3]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[4]/q i_ref_sampling_inst_i_ref_smp_4_reg[4]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[5]/q i_ref_sampling_inst_i_ref_smp_4_reg[5]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[6]/q i_ref_sampling_inst_i_ref_smp_4_reg[6]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[7]/q i_ref_sampling_inst_i_ref_smp_4_reg[7]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[8]/q i_ref_sampling_inst_i_ref_smp_4_reg[8]/Q -type DFF DFF
add mapped point i_ref_sampling_inst/i_ref_smp_4[9]/q i_ref_sampling_inst_i_ref_smp_4_reg[9]/Q -type DFF DFF
add mapped point q_control_inst/a[0]/q q_control_inst_a_reg[0]/Q -type DFF DFF
add mapped point q_control_inst/a[1]/q q_control_inst_a_reg[1]/Q -type DFF DFF
add mapped point q_control_inst/a[2]/q q_control_inst_a_reg[2]/Q -type DFF DFF
add mapped point q_control_inst/a[3]/q q_control_inst_a_reg[3]/Q -type DFF DFF
add mapped point q_control_inst/a[4]/q q_control_inst_a_reg[4]/Q -type DFF DFF
add mapped point q_control_inst/a[5]/q q_control_inst_a_reg[5]/Q -type DFF DFF
add mapped point q_control_inst/a[6]/q q_control_inst_a_reg[6]/Q -type DFF DFF
add mapped point q_control_inst/a[7]/q q_control_inst_a_reg[7]/Q -type DFF DFF
add mapped point q_control_inst/a[8]/q q_control_inst_a_reg[8]/Q -type DFF DFF
add mapped point q_control_inst/a[9]/q q_control_inst_a_reg[9]/Q -type DFF DFF
add mapped point q_control_inst/b[0]/q q_control_inst_b_reg[0]/Q -type DFF DFF
add mapped point q_control_inst/b[1]/q q_control_inst_b_reg[1]/Q -type DFF DFF
add mapped point q_control_inst/b[2]/q q_control_inst_b_reg[2]/Q -type DFF DFF
add mapped point q_control_inst/b[3]/q q_control_inst_b_reg[3]/Q -type DFF DFF
add mapped point q_control_inst/b[4]/q q_control_inst_b_reg[4]/Q -type DFF DFF
add mapped point q_control_inst/b[5]/q q_control_inst_b_reg[5]/Q -type DFF DFF
add mapped point q_control_inst/b[6]/q q_control_inst_b_reg[6]/Q -type DFF DFF
add mapped point q_control_inst/b[7]/q q_control_inst_b_reg[7]/Q -type DFF DFF
add mapped point q_control_inst/b[8]/q q_control_inst_b_reg[8]/Q -type DFF DFF
add mapped point q_control_inst/b[9]/q q_control_inst_b_reg[9]/Q -type DFF DFF
add mapped point q_control_inst/c[0]/q q_control_inst_c_reg[0]/Q -type DFF DFF
add mapped point q_control_inst/c[1]/q q_control_inst_c_reg[1]/Q -type DFF DFF
add mapped point q_control_inst/c[2]/q q_control_inst_c_reg[2]/Q -type DFF DFF
add mapped point q_control_inst/c[3]/q q_control_inst_c_reg[3]/Q -type DFF DFF
add mapped point q_control_inst/c[4]/q q_control_inst_c_reg[4]/Q -type DFF DFF
add mapped point q_control_inst/c[5]/q q_control_inst_c_reg[5]/Q -type DFF DFF
add mapped point q_control_inst/c[6]/q q_control_inst_c_reg[6]/Q -type DFF DFF
add mapped point q_control_inst/c[7]/q q_control_inst_c_reg[7]/Q -type DFF DFF
add mapped point q_control_inst/c[8]/q q_control_inst_c_reg[8]/Q -type DFF DFF
add mapped point q_control_inst/c[9]/q q_control_inst_c_reg[9]/Q -type DFF DFF
add mapped point q_control_inst/converged/q q_control_inst_converged_reg/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured[1]/q q_measurement_inst_q_measured_reg[1]/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured[2]/q q_measurement_inst_q_measured_reg[2]/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured[3]/q q_measurement_inst_q_measured_reg[3]/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured[4]/q q_measurement_inst_q_measured_reg[4]/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured[5]/q q_measurement_inst_q_measured_reg[5]/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured[6]/q q_measurement_inst_q_measured_reg[6]/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured[7]/q q_measurement_inst_q_measured_reg[7]/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured[8]/q q_measurement_inst_q_measured_reg[8]/Q -type DFF DFF
add mapped point q_measurement_inst/q_measured[9]/q q_measurement_inst_q_measured_reg[9]/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[0]/q q_measurement_inst_q_pulses_count_reg[0]90/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[1]/q q_measurement_inst_q_pulses_count_reg[1]91/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[2]/q q_measurement_inst_q_pulses_count_reg[2]92/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[3]/q q_measurement_inst_q_pulses_count_reg[3]93/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[4]/q q_measurement_inst_q_pulses_count_reg[4]94/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[5]/q q_measurement_inst_q_pulses_count_reg[5]95/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[6]/q q_measurement_inst_q_pulses_count_reg[6]96/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[7]/q q_measurement_inst_q_pulses_count_reg[7]97/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[8]/q q_measurement_inst_q_pulses_count_reg[8]98/Q -type DFF DFF
add mapped point q_measurement_inst/ready/q q_measurement_inst_ready_reg/Q -type DFF DFF
add mapped point q_measurement_inst/wtd[0]/q q_measurement_inst_wtd_reg[0]/Q -type DFF DFF
add mapped point q_measurement_inst/wtd[1]/q q_measurement_inst_wtd_reg[1]/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[3]/q q_measurement_inst_q_pulses_count_reg[3]/Q -type DFF DFF
add mapped point q_measurement_inst/wtd_lock/q q_measurement_inst_wtd_lock_reg101/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[1]/q q_measurement_inst_q_pulses_count_reg[1]/Q -type DFF DFF
add mapped point q_measurement_inst/wtd_lock/q q_measurement_inst_wtd_lock_reg/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[0]/q q_measurement_inst_q_pulses_count_reg[0]/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[8]/q q_measurement_inst_q_pulses_count_reg[8]/Q -type DFF DFF
add mapped point q_measurement_inst/ready/q q_measurement_inst_ready_reg104/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[6]/q q_measurement_inst_q_pulses_count_reg[6]/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[5]/q q_measurement_inst_q_pulses_count_reg[5]/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[2]/q q_measurement_inst_q_pulses_count_reg[2]/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[7]/q q_measurement_inst_q_pulses_count_reg[7]/Q -type DFF DFF
add mapped point q_measurement_inst/q_pulses_count[4]/q q_measurement_inst_q_pulses_count_reg[4]/Q -type DFF DFF
add mapped point q_measurement_inst/wtd[1]/q q_measurement_inst_wtd_reg[1]85/Q -type DFF DFF
add mapped point q_measurement_inst/wtd[0]/q q_measurement_inst_wtd_reg[0]84/Q -type DFF DFF
add mapped point q_control_inst/went_unstable/q q_control_inst_went_unstable_reg111/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
