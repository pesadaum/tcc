module instability_detect #(
  parameter WIDTH      = 10 ,
  parameter DELTA      = 300,
  parameter IREF_DELTA = 50
) (
  input                  clk        ,
  input                  rst        ,
  input                  ready      , // Flag for measurement done
  input                  enable     ,
  input      [WIDTH-1:0] q_measured ,
  output reg [WIDTH-1:0] i_ref_setup  // upper bound for Q control module
);


  // flag for finding the instability point
  reg found = 1'b0;

  // registers to store Q values
  reg [WIDTH-1:0] curr_q, last_q;

  // asynchronous setup
  always @ (posedge rst) begin: async_setup
    if (rst) begin
      i_ref_setup = 2**WIDTH-1; // set all bits
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

      if ((curr_q - last_q) > DELTA) begin
        found = 1'b1;
      end
      else found = 1'b0;

      if (!found)  i_ref_setup = i_ref_setup - IREF_DELTA;
    end
    // end
  end

  //TODO: Remember to implement some optimization strategy to obtain the maximum Q


endmodule