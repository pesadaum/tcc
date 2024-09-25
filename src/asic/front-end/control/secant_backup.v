// module secant_backup #(
//   parameter BUS_WIDTH = 10,
//   parameter TOL   = 30
// ) (
//   input  wire             ready      ,
//   input  wire             clk        ,
//   input  wire             rst        ,
//   input  wire [BUS_WIDTH-1:0] q_desired  ,
//   input  wire [BUS_WIDTH-1:0] q_measured ,
//   input  wire [BUS_WIDTH-1:0] i_ref_setup,
//   output reg  [BUS_WIDTH-1:0] i_ref
// );

//   // Initial lower and upper bounds, respectively; next point to be measured
//   reg [BUS_WIDTH-1:0] a, b, c;

//   // placeholders for measurements
//   // TODO: implement measurement mock
//   reg [BUS_WIDTH-1:0] f_a, f_b, f_c;

//   // auxiliar variable used in calculation, maybe should be inserted directly for `reg` economy;
//   reg [BUS_WIDTH-1:0] slope;

//   // flag for achieving convergence
//   reg converged = 1'b0;

//   /* REMEMBER:
//   some initializations are unnecessary for synthesis, no need to specify the splicit initialization path, but some are necessary
//   */
  
//   // reg clk_enb = 1'b1;

//   // always @*
//   // clk_enb = clk && ~converged;

//   reg signed [BUS_WIDTH:0] error;
//   reg [1:0] ctr;

//   initial begin
//     a = 0;
//     b = 2**BUS_WIDTH-1;
//     c = 512;
//     f_a = 0;
//     f_b = 0;
//     f_c = 0;
//     slope = 0;
//     converged = 1'b0;
//     i_ref = 2**BUS_WIDTH-1;
//     ctr = 0;
//   end


//   always @(posedge clk) begin
//     ctr <= ctr +1;
//     if (ctr == 2) ctr <= 0;
//   end

//   always @(posedge clk) begin
//     case (ctr) 
//       0: i_ref <= a;
//       1: i_ref <= b;
//       2: i_ref <= c;
//       default: i_ref <= c;
//     endcase
//   end

//   always @* begin
//     case (ctr)
//       0: f_a <= q_measured;
//       1: f_b <= q_measured;
//       2: f_c <= q_measured;  
//     endcase

    
//     $display("[IN-MODULE] a=%d, b=%d, f_a=%d, f_b=%d, slope=%d, c=%d, i_ref=%b, q_measured=%d, ctr=%d, [1]", a, b, f_a, f_b, slope, c,  i_ref, q_measured, ctr);
//   end

//   always @(posedge clk or posedge rst) begin: secant


//     if(!ready) c <= 0;
//     else if (!converged) begin

//       // f(<arg>) is a call to the measurement function
//       $display("[IN-MODULE] a=%d, b=%d, f_a=%d, f_b=%d, slope=%d, c=%d [2]", a, b, f_a, f_b, slope, c);

//       // f_a = f(a);
//       // i_ref <= a;
//       // f_a   <= q_measured;

//       // i_ref <= b;
//       // f_b   <= q_measured;



//       // f_b = f(b);
//       // i_ref <= b;
//       // f_b   <= q_measured;

//       if (ctr == 2) begin
//         // slope <= (f_b - f_a) / (b - a);
//         c     <= (b - (f_b - q_desired)) / (f_b - f_a) / (b - a);
//         // a <= b;
//         // b <= c;
//         if (error < TOL) converged = 1'b1;
//       end

//       // i_ref <= c;
//       // f_c   <= q_measured;

//       // error = f_c - q_desired;
//       // error = error > 0 ? error : -error;

//     end
//   end

//   // always @* begin
//   //   f_a <= q_measured;
//   //   f_b <= q_measured;
//   //   f_c <= q_measured;
//   // end

//   // always @* begin
//   //   i_ref <= a;
//   //   i_ref <= b;
//   //   i_ref <= c;
//   // end

//   always @* begin
//     a = b;
//     b = c;
//     error = q_measured - q_desired;
//     error = (error > 0) ? error : -error;
//   end

// endmodule