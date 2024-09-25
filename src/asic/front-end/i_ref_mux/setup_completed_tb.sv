module i_ref_mux_tb ();
  localparam BUS_WIDTH = 10;

  logic [BUS_WIDTH-1:0] i_ref      ;
  logic [BUS_WIDTH-1:0] i_ref_setup;
  logic [BUS_WIDTH-1:0] i_ref_out  ;
  bit               completed  ;

  i_ref_mux DUT (.*);

  initial begin : setup
    i_ref = (2**BUS_WIDTH-1)/3; // random value
    i_ref_setup = 2**BUS_WIDTH-1; // max I_REF value
    completed = 0;
  end

  initial begin : tb
    // $display("Setup I_REF will be decremented until it reaches ")
    for (int i = 0; i < 75 ; i++) begin
      #1 i_ref_setup = i_ref_setup - 2*i;
      if (i == 25) #1 completed = 1;
      if (i == 55) #1 completed = 0;
    end

  end

  task show();
    $display("At time %3d: i_ref=%4d, i_ref_setup=%4d, i_ref_out=%4d, completed=%b",
      $time ,i_ref, i_ref_setup, i_ref_out, completed);
  endtask

  always @ (i_ref_setup, completed) show;


endmodule