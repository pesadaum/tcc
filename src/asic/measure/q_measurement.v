module q_measurement #(
  parameter WIDTH       = 10, // bus width
  parameter WTD_WIDTH   = 2 , // watchdog register width
  parameter Q_PER_PULSE = 30  // value of Q for each pulse
) (
  input                  q_serialized,
  input                  clk         ,
  input                  start       ,
  output reg             ready       ,
  output reg [WIDTH-1:0] measured_q
);

  reg [WTD_WIDTH:0] q_pulses_count; // stores the quantity of digital pulses
  reg [WTD_WIDTH-1:0] wtd           ; // watchdog for when the system stops receiving pulses


  always @(posedge clk) begin
    if (!start) begin
      ready          <= 0; // system is not ready to forward measurement
      q_pulses_count <= 0; // no pulses acquired
      wtd            <= 2**WTD_WIDTH-1; // watchdog counter is set to maximum value
    end

    else begin
      if(q_serialized) wtd <= 2**WTD_WIDTH-1; // prevents watchdog from being decremented when measuring
      if(!wtd) begin
        ready <= 1'b1; // if watchdog is zero then system stopped emitting pulses
      end
      else
        wtd <= wtd -1; // if watchdog is not zero then system is still emitting pulses

      if(ready) measured_q <= q_pulses_count * Q_PER_PULSE; // q_pulse / 2 because it is sampled @ both pos and neg edges
    end

  end

  always @(posedge q_serialized) begin
    wtd            <= 2**WTD_WIDTH-1; // watchdog counter is set to maximum value
    q_pulses_count <= q_pulses_count +1; // number of pulses is incremented
  end



endmodule
