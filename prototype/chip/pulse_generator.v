`timescale 1ns/1ps

module pulse_generator #(
  parameter N_PULSES  = 10,
  parameter PULSE_DUR = 10
) (
  input      enab  ,
  output reg pulses
);

  reg start_pulse = 0;

  initial begin
    pulses <= 0;
    start_pulse  <= 0;
  end

  // Delays pulse startup the same amount of pulse duration (`PULSE_DUR`)
  always @(posedge enab) begin
    if (enab) begin
      #PULSE_DUR start_pulse = 1;
    end
    else begin
      #PULSE_DUR start_pulse = 0;
    end
  end

  always @(posedge start_pulse) begin
    if(start_pulse) pulses = 1;
    
    while (start_pulse) begin
      # (PULSE_DUR/2) pulses = 0;
      # (PULSE_DUR)   pulses = 1;
    end

    pulses = 0;
  end






endmodule