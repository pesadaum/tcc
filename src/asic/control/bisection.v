module bisection #(
  parameter BUS_WIDTH = 10, // bus BUS_WIDTH
  parameter TOL       = 1   // minimum acceptable value of difference between measured Q and desired Q
) (
  input  wire                 ready      , // flag for measurement is ready
  input  wire                 clk        ,
  input  wire                 rst        ,
  input  wire                 enable     ,
  input  wire [BUS_WIDTH-1:0] q_desired  ,
  input  wire [BUS_WIDTH-1:0] q_measured ,
  input  wire [BUS_WIDTH-1:0] i_ref_setup, // upper bound
  output reg  [BUS_WIDTH-1:0] i_ref
);

  // Initial lower and upper bounds and midpoint respectively;
  reg [BUS_WIDTH-1:0] a, b, c;

  // flag for achieving convergence
  reg converged = 1'b0;

  // should be SIGNED and BUS_WIDTH+1 bit long
  reg signed [BUS_WIDTH:0] error;

  always @(posedge clk or posedge rst) begin: bisection
    if (rst) begin
      a         <= 0;
      b         <= (2**BUS_WIDTH)-1;
      c         <= (a+b)/2;
      converged <= 1'b0;
    end

    else if (!converged && ready && enable) begin

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
    if (enable)
      i_ref <= c;
  end

  always @* begin
    if (enable) begin
      // calculating error (\epsilon) and taking the absolute value
      error = q_measured - q_desired;
      error = (error > 0) ? error : -error;
    end
  end

endmodule