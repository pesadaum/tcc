module instability_detect #(
  parameter WIDTH      = 10 ,
  parameter DELTA      = 300,
  parameter IREF_DELTA = 50
) (
  input                  clk        ,
  input                  rst        ,
  input                  ready      ,
  input      [WIDTH-1:0] q_measured ,
  output reg [WIDTH-1:0] i_ref_setup
);

  /*REMEMBER TO DELETE, TESTBENCH CONSTRUCT*/
  initial begin
    i_ref_setup = 2**WIDTH-1;
    // found = 1'b0;
  end

  // flag for finding the instability point
  reg found = 1'b0;

  // registers to store Q values
  reg [WIDTH-1:0] curr_q, last_q;

  // asynchronous setup
  always @ (posedge rst) begin: async_setup
    if (rst) i_ref_setup = 2**WIDTH-1; // set all bits
    else i_ref_setup = 0;             // clear all bits
  end



  always @(posedge clk) begin: main
    // if (ready) begin

    if (!found) begin
      last_q <= curr_q;
      curr_q <= q_measured;
    end

    // $write("[IN-MODULE] At time %3d: last_q=%4d, curr_q=%4d,  difference=%4d", $time+1, last_q, curr_q, curr_q - last_q);
  end

  always @(negedge clk) begin
    if ((curr_q - last_q) > DELTA) begin
      found = 1'b1;
      // $write("[IN-MODULE] FOUND!");
    end
    else found = 1'b0;

    if (!found)  i_ref_setup = i_ref_setup - IREF_DELTA;
    else i_ref_setup = i_ref_setup;

    // end
  end

  //TODO: Remember to implement some optimization strategy to obtain the maximum Q


endmodule