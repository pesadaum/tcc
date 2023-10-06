// module mock_measure #(
//   parameter READY_DELAY = 10,
//   parameter WIDTH       = 10
// ) (
//   input                  clk       ,
//   input      [WIDTH-1:0] i_ref     ,
//   output reg [WIDTH-1:0] q_measured,
//   output reg             ready
// );

//   integer i_ref_index;
//   iref_index = i_ref.atoi();


//   always @(posedge clk ) begin
//     ready      = 1'b0;
//     # READY_DELAY;
//     q_measured <= q_measured[i_ref_index];
//     ready      <= 1'b1;

//   end

// endmodule