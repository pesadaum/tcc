module i_ref_mux #(parameter BUS_WIDTH = 10) (
  input                  went_unstable,
  input  [BUS_WIDTH-1:0] i_ref        ,
  input  [BUS_WIDTH-1:0] i_ref_max    ,
  output [BUS_WIDTH-1:0] i_ref_out
);

  assign i_ref_out = went_unstable ? i_ref_max : i_ref;


endmodule