module secant #(
  parameter WIDTH = 10, // bus width
  parameter TOL   = 30  // minimum acceptable value of difference between measured Q and desired Q
) (
  input                   clk        , // Clock
  input                   rst        , // Async reset
  input                   ready      , // Flag for measurement done
  input  wire [WIDTH-1:0] desired_q  , // Desired Q value
  input  wire [WIDTH-1:0] measured_q , // Measured Q value
  input  wire [WIDTH-1:0] i_ref_setup, // upper bound
  output reg  [WIDTH-1:0] i_ref        // produces Q
);

  // State is necessary for retaining value of 3 initial measurements
  reg [2:0] state;

  // Initial lower and upper bounds and midpoint respectively;
  reg [WIDTH-1:0] a, b, c;

  // Variables for f(x) == Q at x value of I_{REF}
  reg [WIDTH-1:0] f_a, f_b, f_c;

  // [Warning] Register type is not adequate in current implementation
  reg [WIDTH-1:0] slope;

  // flag for achieving convergence
  reg converged;


  // should be SIGNED and WIDTH+1 bit long
  reg signed [WIDTH:0] error;

  // state updates
  always @(posedge clk) begin : state_updates
    if (ready) state <= state+1;

    if (error < TOL) converged <= 1'b1;
    else converged <= 1'b0;

  end

  always @(state) begin: current_updates
    case (state)
      0 : begin
        i_ref <= a;
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
      end

      4 : begin : new_bounds
        a     <= b;
        b     <= c;
        state <= -1;
      end
    endcase

  end

  always @(state) begin : blocking_updates
    if (state == 3) begin

      slope = (f_b - f_a)/ (b-a);
      // slope could be zero if is less than 1 in binary.
      if (!slope) begin
        c = b - (f_b - desired_q);
      end
      else
        c = b - (f_b - desired_q) / slope;
    end
  end

  always @* begin
    // calculating error (\epsilon) and taking the absolute value
    error = f_c - desired_q;
    error = (error > 0) ? error : -error;
  end

endmodule