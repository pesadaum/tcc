module bisection #(
  parameter BUS_WIDTH = 10, // bus BUS_WIDTH
  parameter TOL       = 1   // minimum acceptable value of difference between measured Q and desired Q
) (
  input  wire                 ready        , // flag for measurement is ready
  input  wire                 clk          ,
  input  wire                 rst          ,
  input  wire                 enable       ,
  input  wire                 i_ref_mux    ,
  input  wire [BUS_WIDTH-1:0] q_desired    ,
  input  wire [BUS_WIDTH-1:0] q_measured   ,
  output reg  [BUS_WIDTH-1:0] i_ref        ,
  output reg                  went_unstable
);

  // Initial lower and upper bounds and midpoint respectively;
  reg [BUS_WIDTH-1:0] a, b, c;

  // flag for achieving convergence
  reg converged;

  // reg went_unstable;

  // should be SIGNED and BUS_WIDTH+1 bit long
  reg signed [BUS_WIDTH:0] error             ;
  reg signed [BUS_WIDTH:0] error_sample_first;
  reg signed [BUS_WIDTH:0] error_sample_mid  ;
  reg signed [BUS_WIDTH:0] error_sample_last ;


  always @(posedge clk or posedge rst) begin: bisection
    if (rst) begin
      a             <= 0;
      b             <= (2**BUS_WIDTH)-1;
      c             <= (a+b)/2;
      went_unstable <= 0;
      // i_ref <= 0;
      converged     <= 0;
    end

    else if (!converged && ready && enable && i_ref_mux) begin

      if (error < TOL) converged <= 1'b1;
      // desired value is between a and c
      else if (q_desired > q_measured) a <= c;
      // desired value is between b and c
      else if (q_desired < q_measured) b <= c;
      // convergence achieved
      else converged <= 1'b0;
    end
    
    c <= (a+b)/2;

  end

  always @* begin
    i_ref = c;
  end

  always @* begin
    if (enable) begin
      // calculating error (\epsilon) and taking the absolute value
      error = q_measured - q_desired;
      error = (error > 0) ? error : -error;
    end
  end

  always @(posedge ready) begin
    if (enable) begin

      error_sample_first <= error;
      error_sample_mid   <= error_sample_first;
      error_sample_last  <= error_sample_mid;

      if ((error_sample_first == error_sample_mid) & (error_sample_mid == error_sample_last)) begin
        went_unstable = 1'b1;
        // converged = 1'b1;
      end
    end

  end

endmodule