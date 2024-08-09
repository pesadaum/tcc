module pulse_generator #(
  parameter BUS_WIDTH      = 10,
  parameter MAX_PULSES = 32,
  parameter PULSE_DUR  = 2
) (
  input      enable,
  output reg pulses
);

  reg [BUS_WIDTH-1:0] pulses_ctr = 0;

  always @* begin
    if (enable) begin
      #PULSE_DUR pulses <= 1'b0;
      #PULSE_DUR pulses <= 1'b1;
    end
    else pulses <= 0;
  end

endmodule