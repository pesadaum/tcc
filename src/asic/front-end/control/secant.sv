module secant #(
  parameter BUS_WIDTH = 10,
  parameter TOL       = 30
) (
  input  wire                 ready        ,
  input  wire                 clk          ,
  input  wire                 rst          ,
  input  wire [BUS_WIDTH-1:0] q_desired    ,
  input  wire [BUS_WIDTH-1:0] q_measured   ,
  input  wire [BUS_WIDTH-1:0] i_ref_setup  ,
  output reg                  went_unstable,
  output reg  [BUS_WIDTH-1:0] i_ref
);

  localparam SEND_I_REF_A  = 'd0;
  localparam SEND_I_REF_B  = 'd1;
  localparam GET_FB        = 'd2;
  localparam CALC_SLOPE    = 'd3;
  localparam CALC_C        = 'd4;
  localparam SEND_I_REF_C  = 'd5;
  localparam UPDATE_BOUNDS = 'd6;

  reg [2:0] state;

  // Initial lower and upper bounds and midpoint respectively;
  reg [BUS_WIDTH-1:0] a, b, c;

  real a_f, b_f, c_f;

  // reg signed [BUS_WIDTH:0] f_a, f_b, f_c;

  real f_a, f_b, f_c;

  real slope = -1;

  // flag for achieving convergence
  reg converged;

  /* REMEMBER:
  some initializations are unnecessary for synthesis, no need to specify the splicit initialization path, but some are necessary
  */

  // should be SIGNED and BUS_WIDTH+1 bit long
  reg signed [BUS_WIDTH:0] error;

  assign a_f = a;
  assign b_f = b;
  assign c_f = c;

  initial begin
    state = -1;
    a = 0;
    b = 2**BUS_WIDTH-2;
    // b = 900;
    // c = 0;
    // q_desired = 258;
    // c = 826;
    // f_c = 119;
    converged = 1'b0;
  end

  always @(posedge clk) begin
    if (ready) state <= state + 1;

    if (error < TOL) converged <= 1'b1;
    else converged <= 1'b0;

    // $display("[IN-MODULE] a=%d, b=%d, c=%d, f_a=%d, f_b=%d, f_c=%d, state=%d", a, b, c, f_a, f_b, f_c, state);
  end

  always @(state) begin: current_updates
    case (state)
      SEND_I_REF_A :
        begin
          i_ref <= a;
          // f_c   <= q_measured;
        end

      SEND_I_REF_B :
        begin
          i_ref <= b;
          f_a   <= q_measured;
        end

      GET_FB :
        begin
          f_b <= q_measured;

        end

      CALC_SLOPE :
        begin

          slope <= (f_b - f_a) / ((b_f - a_f ) / (2**BUS_WIDTH-2));

        end

      CALC_C :
        begin
          c <= b_f - (1023 * (f_b - q_desired) / slope);

        end

      SEND_I_REF_C :
        begin
          i_ref <= c;

        end

      UPDATE_BOUNDS :
        begin

          // $display(a,, b,, c,, f_a,, f_b,, f_c,,slope ,, q_desired,,);
          a   <= b;
          b   <= c;
          f_c <= q_measured;
        end
    endcase

  end

  // always @(state) begin
  //   if (state == 3) begin

  //     $display("slope=%f, f_b=%f, f_a=%f, b=%f, a=%f ", slope, f_b, f_a, b, a);
  //     slope = (f_b - f_a) / ((b-a)/1022);

  //     if (slope == 0) begin
  //       slope = (10 *(f_b - f_a)/ (b-a)) * 100;
  //       $display("slope=%f [float]", slope);

  //       c     = (b - (f_b - q_desired));

  //     end
  //     else
  //       c = (b/1000) - (f_b - q_desired) / slope;
  //   end
  //   // c <= slope;
  // end

  always @* begin
    // calculating error (\epsilon) and taking the absolute value
    error = f_c - q_desired;
    error = (error > 0) ? error : -error;
  end




endmodule