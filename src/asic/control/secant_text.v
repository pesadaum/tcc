module secant #(
  parameter BUS_WIDTH = 10, // bus BUS_WIDTH
  parameter TOL   = 30  // minimum acceptable value of difference between measured Q and desired Q
) (
  input                   clk        , // Clock
  input                   rst        , // Async reset
  input                   ready      , // Flag for measurement done
  input  wire [BUS_WIDTH-1:0] q_desired  , // Desired Q value
  input  wire [BUS_WIDTH-1:0] q_measured , // Measured Q value
  input  wire [BUS_WIDTH-1:0] i_ref_setup, // upper bound
  output reg  [BUS_WIDTH-1:0] i_ref        // produces Q
);

  // State is necessary for retaining value of 3 initial measurements
  reg [2:0] state;

  // Initial lower and upper bounds and midpoint respectively;
  reg [BUS_WIDTH-1:0] a, b, c;

  // Variables for f(x) == Q at x value of I_{REF}
  reg [BUS_WIDTH-1:0] f_a, f_b, f_c;

  // [Warning] Register type is not adequate in current implementation
  reg [BUS_WIDTH-1:0] slope;

  // flag for achieving convergence
  reg converged;


  // should be SIGNED and BUS_WIDTH+1 bit long
  reg signed [BUS_WIDTH:0] error;

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
        f_a   <= q_measured;
      end

      2 : begin
        i_ref <= c;
        f_b   <= q_measured;
      end

      3 : begin
        f_c <= q_measured;
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
        c = b - (f_b - q_desired);
      end
      else
        c = b - (f_b - q_desired) / slope;
    end
  end

  always @* begin
    // calculating error (\epsilon) and taking the absolute value
    error = f_c - q_desired;
    error = (error > 0) ? error : -error;
  end

endmodule