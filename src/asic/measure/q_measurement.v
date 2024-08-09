module q_measurement #(
  parameter BUS_WIDTH       = 10, // bus BUS_WIDTH
  parameter WTD_BUS_WIDTH   = 2 , // watchdog register BUS_WIDTH
  parameter Q_PER_PULSE = 30  // value of Q for each pulse
) (
  input                  q_serialized,
  input                  clk         ,
  input                  start       ,
  output reg             ready       ,
  output reg [BUS_WIDTH-1:0] q_measured
);

  reg [WTD_BUS_WIDTH:0] q_pulses_count; // stores the quantity of digital pulses
  reg [WTD_BUS_WIDTH-1:0] wtd           ; // watchdog for when the system stops receiving pulses


  always @(posedge clk) begin
    if (!start) begin
      ready          <= 0; // system is not ready to forward measurement
      q_pulses_count <= 0; // no pulses acquired
      wtd            <= 2**WTD_BUS_WIDTH-1; // watchdog counter is set to maximum value
    end

    else begin
      if(q_serialized) wtd <= 2**WTD_BUS_WIDTH-1; // prevents watchdog from being decremented when measuring
      if(!wtd) begin
        ready <= 1'b1; // if watchdog is zero then system stopped emitting pulses
      end
      else
        wtd <= wtd -1; // if watchdog is not zero then system is still emitting pulses

      if(ready) q_measured <= q_pulses_count * Q_PER_PULSE; // q_pulse / 2 because it is sampled @ both pos and neg edges
    end

  end

  always @(posedge q_serialized) begin
    wtd            <= 2**WTD_BUS_WIDTH-1; // watchdog counter is set to maximum value
    q_pulses_count <= q_pulses_count +1; // number of pulses is incremented
  end



endmodule