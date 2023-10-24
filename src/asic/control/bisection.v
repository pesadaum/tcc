module bisection #(
  parameter MAX_ITER = 2 , // maximum number of iterations
  parameter WIDTH    = 10, // bus width
  parameter TOL      = 30  // minimum acceptable value
) (
  input  wire             ready      ,
  input  wire             clk        ,
  input  wire [WIDTH-1:0] desired_q  ,
  input  wire [WIDTH-1:0] measured_q ,
  input  wire [WIDTH-1:0] i_ref_setup, // upper bound
  output reg  [WIDTH-1:0] i_ref
);

  // Initial lower and upper bounds, respectively; next point to be measured
  reg [WIDTH-1:0] a, b, c;

  // placeholders for measurements
  // TODO: implement measurement mock
  reg [WIDTH-1:0] f_c;

  // auxiliar variable used in calculation, maybe should be inserted directly for `reg` economy;
  reg [WIDTH-1:0] slope;

  // iteration control
  reg [WIDTH-1:0] iter;

  // flag for achieving convergence
  reg converged = 1'b0;

  /* REMEMBER:
  some initializations are unnecessary for synthesis, no need to specify the splicit initialization path, but some are necessary
  */
  initial begin
    a = 0;
    b = 2**WIDTH-1;
    c = 0;
    f_c = 2**WIDTH-1;
    iter = 1;
    converged = 1'b0;
  end

  always @(posedge clk) begin: bisection
    // should be local
    reg error;

    if(!ready) c <= 0;
    else begin

      c <= (a+b)/2;

      // f(<arg>) is a call to the measurement function
      // f_c = f(c);
      // f_c <= measured_q;

      i_ref <= c;
      f_c   <= measured_q;

      error <= f_c - desired_q;
      error <= error > 0 ? error : -error;

      if (measured_q > desired_q) converged <= 1'b1;
      else if ((desired_q - f_c) > 0) a <= c;
      else if ((desired_q - f_c) < 0) b <= c;
      else converged <= 1'b0;
    end
  end


  always @* begin
    i_ref <= c;
  end


endmodule