module setup_completed #(parameter WIDTH = 10) (
  input  [WIDTH-1:0] i_ref      ,
  input  [WIDTH-1:0] i_ref_setup,
  input              completed  ,
  output [WIDTH-1:0] i_ref_out
);

  assign i_ref_out = completed ? i_ref : i_ref_setup;


endmodule