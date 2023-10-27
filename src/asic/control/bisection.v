module bisection #(
  parameter MAX_ITER = 32, // maximum number of iterations
  parameter WIDTH    = 10, // bus width
  parameter TOL      = 30  // minimum acceptable value of difference between measured Q and desired Q
) (
  input  wire             ready      ,
  input  wire             clk        ,
  input  wire             rst        ,
  input  wire [WIDTH-1:0] desired_q  ,
  input  wire [WIDTH-1:0] measured_q ,
  input  wire [WIDTH-1:0] i_ref_setup, // upper bound
  output reg  [WIDTH-1:0] i_ref
);

  // Initial lower and upper bounds, respectively; next point to be measured
  reg [WIDTH-1:0] a, b, c;

  // iteration control variable
  reg [WIDTH-1:0] iter;

  // flag for achieving convergence
  reg converged;

  /* REMEMBER:
  some initializations are unnecessary for synthesis, no need to specify the splicit initialization path, but some are necessary
  */


  initial begin
    a = 0;
    b = 2**WIDTH-1;
    // c = 0;
    iter = 1;
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

      // updating reference current with midpoint
      // i_ref <= c;

      // taking the modulus of the error

      // error <= measured_q - desired_q;
      // error <= (error > 0) ? error : -error;


      if (error < TOL) converged <= 1'b1;
      else if (desired_q > measured_q) a <= c;
      else if (desired_q < measured_q) b <= c;
      else converged <= 1'b0;
    end
  end

  always @* begin
    i_ref <= c;
  end

  always @* begin
      error = measured_q - desired_q;
      error = (error > 0) ? error : -error;
  end

endmodule