module bisection #(
  parameter WIDTH    = 10, // bus width
  parameter TOL      = 30  // minimum acceptable value of difference between measured Q and desired Q
) (
  input  wire             ready      , // flag for 
  input  wire             clk        ,
  input  wire             rst        ,
  input  wire [WIDTH-1:0] desired_q  ,
  input  wire [WIDTH-1:0] measured_q ,
  input  wire [WIDTH-1:0] i_ref_setup, // upper bound
  output reg  [WIDTH-1:0] i_ref
);

  // Initial lower and upper bounds and midpoint respectively;
  reg [WIDTH-1:0] a, b, c;

  // flag for achieving convergence
  reg converged;

  /* REMEMBER:
  some initializations are unnecessary for synthesis, no need to specify the splicit initialization path, but some are necessary
  */

  initial begin
    a = 0;
    b = 2**WIDTH-1;
    // c = 0;
    converged = 1'b0;
  end

  // should be SIGNED and WIDTH+1 bit long
  reg signed [WIDTH:0] error;

  always @(posedge clk or posedge rst) begin: bisection
    // if (rst) begin
    //   a         <= 0;
    //   b         <= 2**WIDTH-1;
    //   iter      <= 0;
    //   converged <= 1'b0;
    // end

    if(!ready) c <= 0;
    else if (!converged) begin

      // finding midpoint
      c <= (a+b)/2;

      if (error < TOL) converged <= 1'b1;
      // desired value is between a and c
      else if (desired_q > measured_q) a <= c;
      // desired value is between b and c
      else if (desired_q < measured_q) b <= c;
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
    error = measured_q - desired_q;
    error = (error > 0) ? error : -error;
  end

endmodule