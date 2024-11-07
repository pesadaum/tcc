module secant #(
  parameter BUS_WIDTH = 10,
  parameter TOL       = 30
) (
  input  wire                 ready        , // flag for measurement is ready
  input  wire                 clk          ,
  input  wire                 rst          ,
  input  wire                 enable       ,
  input  wire [BUS_WIDTH-1:0] q_desired    ,
  input  wire [BUS_WIDTH-1:0] q_measured   ,
  output reg  [BUS_WIDTH-1:0] i_ref        ,
  output reg                  went_unstable
);

  reg [2:0] state;

  localparam SEND_I_REF_A  = 3'd0,
    SEND_I_REF_B    = 3'd1,
    GET_FB          = 3'd2,
    CALC_SLOPE      = 3'd3,
    CALC_C          = 3'd4,
    SEND_I_REF_C    = 3'd5,
    UPDATE_BOUNDS   = 3'd6,
    FORWARD_MEASURE = 3'd7;


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

  assign went_unstable = 1'b0;

  reg rdy_reg;



  always @(posedge clk or posedge rst) begin

    rdy_reg <= ready;


    if (ready && enable) begin

      if (error < TOL) converged <= 1'b1;
      else converged <= 1'b0;
    end


    if (rst) begin

      state     <= 0;
      converged <= 1'b0;
      a         <= 0;
      b         <= 2**BUS_WIDTH-2;
      error     <= 0;

    end

    else begin
      if (enable) begin

        case (state)
          SEND_I_REF_A :
            begin
              i_ref <= a;
              state <= ready ? SEND_I_REF_B : SEND_I_REF_A;
            end

          SEND_I_REF_B :
            begin
              i_ref <= b;
              
              if (rdy_reg) begin
                f_a   <= q_measured;
                state <= GET_FB;
              end

            end

          GET_FB :
            begin
                f_b   <= q_measured;
                state <= CALC_SLOPE;
            end

          CALC_SLOPE :
            begin
              slope <= (f_b - f_a) / ((b_f - a_f ) / (2**BUS_WIDTH-2));
              state <= CALC_C;
            end

          CALC_C :
            begin
              c <= b_f - (1023 * (f_b - q_desired) / slope);
              state <= SEND_I_REF_C;
            end

          SEND_I_REF_C :
            begin
              i_ref <= c;

              state <= ready ? UPDATE_BOUNDS : SEND_I_REF_C;

            end

          UPDATE_BOUNDS :
            begin

                a <= b;
                b <= c;
                
                f_a <= f_b;
                f_c   <= q_measured;
                
                state <= FORWARD_MEASURE;
            end

          FORWARD_MEASURE :
            begin

              f_b <= f_c;

              if (converged)
                state <= FORWARD_MEASURE;
              else state <= CALC_SLOPE;

            end

        endcase
      end
    end

  end

  always @* begin
    // calculating error (\epsilon) and taking the absolute value
    error = f_c - q_desired;
    error = (error > 0) ? error : -error;
  end




endmodule