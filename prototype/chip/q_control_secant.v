module q_controller #(
  parameter MAX_ITER = 16,
  parameter WIDTH    = 10
) (
  input  wire             ready    ,
  input  wire             clk      ,
  input  wire [WIDTH-1:0] desired_q,
  input  wire [WIDTH-1:0] q_meas   ,
  output wire [WIDTH-1:0] i_ref    ,
  output reg  [WIDTH-1:0] obt_q
);

  reg     x0, x1, tol, cond, slope, x_next, f_x0, f_x1, f_n;
  integer iter;

  /* REMEMBER:
  some initializations are unnecessary for synthesis, no need to specify the splicit initialization path, but some are necessary
  */
  initial begin
    x0 = 0.1;
    x1 = 1.1;
    f_x0 = 0.0;
    f_x1 = 0.0;
    f_n = 0.0;
    slope = 0.0;
    x_next = 0.0;
    tol = 10;
    iter = 0; // maybe this would be unnecessary due to synthesis concerns
    cond = 1'b1;
  end

  always @(posedge clk) begin: secant
    if(!ready) x_next = 0;
    else begin
      for (iter = 0; iter < MAX_ITER; iter = iter+1) begin
        // f(<a>) is a call to the measurement function
        // f_x0 = f(x0);
        // f_x1 = f(x1);

        slope  = (f_x0 - f_x1) / (x1 - x0);
        x_next = x1 - (f_x1 - desired_q) / slope;

        x0 = x1;
        x1 = x_next;

        // f_xn = f(x_next);
      end
    end
  end

  assign i_ref = x_next;

endmodule