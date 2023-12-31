module secant #(
  parameter WIDTH = 10,
  parameter TOL   = 30
) (
  input  wire             ready      ,
  input  wire             clk        ,
  input  wire             rst        ,
  input  wire [WIDTH-1:0] desired_q  ,
  input  wire [WIDTH-1:0] measured_q ,
  input  wire [WIDTH-1:0] i_ref_setup,
  output reg  [WIDTH-1:0] i_ref
);

  reg [3-1:0] state;

  // Initial lower and upper bounds and midpoint respectively;
  reg signed [WIDTH:0] a, b, c;

  reg signed [WIDTH:0] f_a, f_b, f_c, slope;


  // real slope;
  // flag for achieving convergence
  reg converged;

  /* REMEMBER:
  some initializations are unnecessary for synthesis, no need to specify the splicit initialization path, but some are necessary
  */

  // should be SIGNED and WIDTH+1 bit long
  reg signed [WIDTH:0] error;

  initial begin
    state = -1;
    a = 0;
    b = 2**WIDTH-2;
    // b = 900;
    // c = 0;
    // desired_q = 258;
    c = 826;
    // f_c = 119;
    converged = 1'b0;
  end

  always @(posedge clk) begin
    if (ready) state = state+1;

    if (error < TOL) converged <= 1'b1;
    else converged <= 1'b0;

    // $display("[IN-MODULE] a=%d, b=%d, c=%d, f_a=%d, f_b=%d, f_c=%d, state=%d", a, b, c, f_a, f_b, f_c, state);
  end

  always @(state) begin: current_updates
    case (state)
      0 : begin
        i_ref <= a;
        // f_c   <= measured_q;
      end

      1 : begin
        i_ref <= b;
        f_a   <= measured_q;
      end

      2 : begin
        i_ref <= c;
        f_b   <= measured_q;
      end

      3 : begin
        f_c <= measured_q;

        // slope <= (10 *(f_b - f_a)/ (b-a)) * 10;
        // c <= (b - (f_b - desired_q) / slope);
        // c <= slope;

        // c <= 1023 - (314 - 258)/((314 - 22)/(1023));
        // c <= 1023 - (314 - 258)*1/0.28;

        // c   <= (a+b)/2;
        // c <= 10/3;

        // a <= b;
        // b <= c;

      end

      4 : begin
        // $display(a,, b,, c,, f_a,, f_b,, f_c,,slope ,, desired_q,,);
        a     <= b;
        b     <= c;
        state <= -1;
      end
    endcase

  end

  always @(state) begin
    if (state == 3) begin

      slope = (f_b - f_a)/ (b-a);
      
      if (!slope) begin
        c = (b - (f_b - desired_q));
      end
      else
        c = b - (f_b - desired_q) / slope;
    end
    // c <= slope;
  end

  always @* begin
    // calculating error (\epsilon) and taking the absolute value
    error = f_c - desired_q;
    error = (error > 0) ? error : -error;
  end




endmodule