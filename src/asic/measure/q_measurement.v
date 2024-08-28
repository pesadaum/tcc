module q_measurement #(
  parameter BUS_WIDTH     = 10, // bus BUS_WIDTH
  parameter WTD_BUS_WIDTH = 2 , // watchdog register BUS_WIDTH
  parameter Q_PER_PULSE   = 30  // value of Q for each pulse
) (
  input                      q_serialized,
  input                      clk         ,
  input                      rst         ,
  input                      start       ,
  output reg                 ready       ,
  output reg [BUS_WIDTH-1:0] q_measured
);

  reg [WTD_BUS_WIDTH-1:0] wtd           ; // watchdog for when the system stops receiving pulses
  reg [      BUS_WIDTH:0] q_pulses_count; // stores the quantity of digital pulses
  reg                     wtd_lock          ;

  always @ (posedge rst) begin: async_setup
    if (rst) begin
      ready          = 0; // system is not ready to forward measurement
      q_pulses_count = 0; // no pulses acquired
      wtd            = 2**WTD_BUS_WIDTH-1; // watchdog counter is set to maximum value
      wtd_lock = 0;
    end
  end


  always @(posedge clk) begin
    if (!start) begin // syncronous reset with "start" flag
      ready          <= 0; // system is not ready to forward measurement
      q_pulses_count <= 0; // no pulses acquired
      wtd            <= 2**WTD_BUS_WIDTH-1; // watchdog counter is set to maximum value
      wtd_lock <= 0;
    end

    else begin
      if(q_serialized) wtd <= 2**WTD_BUS_WIDTH-1; // prevents watchdog from being decremented when measuring
      if(wtd == 0) begin
        ready      <= 1; // if watchdog is zero then system stopped emitting pulses
        wtd        <= 2**WTD_BUS_WIDTH-1;
        q_measured <= q_pulses_count * Q_PER_PULSE; // q_pulse / 2 because it is sampled @ both pos and neg edges
      end
      else begin
        ready <= 0;
        if (!wtd_lock) begin
          wtd   <= wtd -1; // if watchdog is not zero then system is still emitting pulses
        end
      end
      // if(ready) begin
      // q_pulses_count <= 0;
      // end
    end

  end

  always @(posedge q_serialized) begin
    wtd            <= 2**WTD_BUS_WIDTH-1; // watchdog counter is set to maximum value
    q_pulses_count <= q_pulses_count +1; // number of pulses is incremented
    // ready          <= 0 ;
    wtd_lock <= 0;
  end

  always @(negedge q_serialized) begin
    ready <= 0;
  end

  always @(posedge ready) begin
    q_pulses_count <= 0;
    wtd_lock <= 1;
  end

  // always @(q_measured) begin
  //   ready = 0;
  // end

endmodule
