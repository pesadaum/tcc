module instability_detect #(
  parameter BUS_WIDTH         = 10 ,
  parameter DELTA_Q_INSTB     = 300,
  parameter I_REF_DELTA_INSTB = 50
) (
  input                      clk        ,
  input                      rst        ,
  input                      ready      , // Flag for measurement done
  input                      enable     ,
  input      [BUS_WIDTH-1:0] q_measured ,
  output reg [BUS_WIDTH-1:0] i_ref_setup  // upper bound for Q control module
);


  // flag for finding the instability point
  reg found = 1'b0;

  // registers to store Q values
  reg [BUS_WIDTH-1:0] curr_q, last_q;

  // asynchronous setup
  always @ (posedge rst) begin: async_setup
    if (rst) begin
      i_ref_setup = 2**BUS_WIDTH-1; // set all bits
      found       = 1'b0;
      curr_q      = 0;
      last_q      = 0;
    end
  end

  always @(posedge clk) begin: main
    if (ready && enable) begin
      if (!found) begin
        last_q <= curr_q;
        curr_q <= q_measured;
      end
    end

  end

  always @(negedge clk) begin
    if (ready && enable) begin

      if ((curr_q - last_q) > DELTA_Q_INSTB) begin
        found = 1'b1;
      end
      else found = 1'b0;

      if (!found)  i_ref_setup = i_ref_setup - I_REF_DELTA_INSTB;
    end
    // end
  end

  //TODO: Remember to implement some optimization strategy to obtain the maximum Q


endmodule