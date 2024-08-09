module bisection #(
  parameter BUS_WIDTH = 10, // bus BUS_WIDTH
  parameter TOL   = 30  // minimum acceptable value of difference between measured Q and desired Q
) (
  input  wire             ready      , // flag for
  input  wire             clk        ,
  input  wire             rst        ,
  input  wire [BUS_WIDTH-1:0] q_desired  ,
  input  wire [BUS_WIDTH-1:0] q_measured ,
  input  wire [BUS_WIDTH-1:0] i_ref_setup, // upper bound
  output reg  [BUS_WIDTH-1:0] i_ref
);

  // Initial lower and upper bounds and midpoint respectively;
  reg [BUS_WIDTH-1:0] a, b, c;

  // flag for achieving convergence
  reg converged;

  /* REMEMBER:
  some initializations are unnecessary for synthesis, no need to specify the splicit initialization path, but some are necessary
  */

  initial begin
    a = 0;
    b = 2**BUS_WIDTH-1;
    // c = 0;
    converged = 1'b0;
  end

  // should be SIGNED and BUS_WIDTH+1 bit long
  reg signed [BUS_WIDTH:0] error;

  always @(posedge clk or posedge rst) begin: bisection
    if (rst) begin
      a         = 0;
      b         = 2**BUS_WIDTH-1;
      //   iter      <= 0;
      converged = 1'b0;
    end

    if(!ready) c <= 0;
    else if (!converged) begin

      // finding midpoint
      c <= (a+b)/2;

      if (error < TOL) converged <= 1'b1;
      // desired value is between a and c
      else if (q_desired > q_measured) a <= c;
      // desired value is between b and c
      else if (q_desired < q_measured) b <= c;
      // convergence achieved
      else converged <= 1'b0;
    end
  end

  always @* begin
    // updating reference current with midpoint
    i_ref <= c;
  end

  always @* begin
    // calculating error (\epsilon) and taking the absolute value
    error = q_measured - q_desired;
    error = (error > 0) ? error : -error;
  end

endmodule