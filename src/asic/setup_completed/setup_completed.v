module setup_completed #(parameter BUS_WIDTH = 10) (
  input  [BUS_WIDTH-1:0] i_ref      ,
  input  [BUS_WIDTH-1:0] i_ref_setup,
  input              completed  ,
  output [BUS_WIDTH-1:0] i_ref_out
);

  assign i_ref_out = completed ? i_ref : i_ref_setup;


endmodule