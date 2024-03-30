module instability_detect #(
  parameter WIDTH      = 10 , // Bus Width
  parameter DELTA      = 100, // $\Delta Q $
  parameter IREF_DELTA = 50   // $\Delta I_{REF} $
) (
  input                  clk        , // Clock
  input                  rst        , // Async reset
  input                  ready      , // Flag for measurement done
  input      [WIDTH-1:0] q_measured , // from Q measurement block
  output reg [WIDTH-1:0] i_ref_setup  // upper bound for Q control module
);

  // flag for finding the instability point
  reg found = 1'b0;

  // registers to store Q values
  reg [WIDTH-1:0] curr_q, last_q;

  // asynchronous setup/reset
  always @ (posedge rst) begin: async_setup
    if (rst) i_ref_setup = 2**WIDTH-1; // set all bits
    else i_ref_setup = 0;             // clear all bits
  end


  //nonblocking assignments for $Q$ measurement scheduled updates
  always @(posedge clk) begin: q_updates
    if (ready) begin
      if (!found) begin
        last_q <= curr_q;
        curr_q <= q_measured;
      end
    end

  end

  // blocking assignments for $\Delta Q$ calculations
  always @(negedge clk) begin : delta_q_calc
    if ((curr_q - last_q) > DELTA) begin
      found = 1'b1;
    end
    else found = 1'b0;

    // update current value on falling edge
    if (!found)  i_ref_setup = i_ref_setup - IREF_DELTA;
    // retain $I_{REF}|_{Setup}$ value for Q control block upper bound
    else i_ref_setup = i_ref_setup;

    // end
  end

  //TODO: Implement some optimization strategy to obtain the maximum Q


endmodule