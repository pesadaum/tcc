module secant_modif_ctrl #(
  parameter MAX_ITER = 2 ,
  parameter WIDTH    = 10,
  parameter TOL      = 30
) (
  input  wire             ready     ,
  input  wire             clk       ,
  input  wire [WIDTH-1:0] desired_q ,
  input  wire [WIDTH-1:0] q_measured,
  output wire [WIDTH-1:0] i_ref
);

// Initial lower and upper bounds, respectively; next point to be measured
  reg [WIDTH-1:0] a, b, c;

  // placeholders for measurements
  // TODO: implement measurement mock
  reg [WIDTH-1:0] f_a, f_b, f_c;

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
    a = 0.0;
    b = 1.0;
    c = 0.0;
    f_a = 0.0;
    f_b = 0.0;
    f_c = 0.0;
    slope = 0.0;
    iter = 1;
    converged = 1'b0;
  end

  // modification for faster convergence
  always @* begin
    if (desired_q > 100) begin
      a = 0.8; b = 1.0;
    end
    else begin
      a = 1.0; b = 0.6;
    end
  end

  reg clk_enb;

  always @*
    clk_enb = clk && ~converged;

  always @(posedge clk_enb) begin: secant
    // should be local
    reg error;

    if(!ready) c = 0;
    else begin
      for (iter = 0; iter < MAX_ITER; iter = iter+1) begin

        // f(<arg>) is a call to the measurement function
        // f_a = f(a);
        // f_b = f(b);

        slope = (f_b - f_a) / (b - a);
        c     = b - (f_b - desired_q) / slope;

        a = b;
        b = c;

        // f_c = f(c);

        error = f_c - desired_q;
        error = error > 0 ? error : -error;

        if (error < TOL) converged = 1'b1;

      end
    end
  end

  assign i_ref = c;

endmodule