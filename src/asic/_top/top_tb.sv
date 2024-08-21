`include "resonant_sys.sv"

module top_tb ();
  localparam BUS_WIDTH = 10;
// -- module: Q measurement
  localparam WTD_BUS_WIDTH = 2 ;
  localparam Q_PER_PULSE   = 30;
// -- module: control
  localparam TOL = 1;
// -- module: instability determination
  localparam I_REF_DELTA_INSTB = 10;
  localparam DELTA_Q_INSTB     = 50;

  reg                 q_serialized;
  reg                 start       ;
  reg                 clk         ;
  reg                 rst         ;
  reg                 enable      ;
  reg [BUS_WIDTH-1:0] q_desired   ;
  reg [BUS_WIDTH-1:0] i_ref_out   ;

  top #(
    .BUS_WIDTH        (BUS_WIDTH        ),
    .WTD_BUS_WIDTH    (WTD_BUS_WIDTH    ),
    .Q_PER_PULSE      (Q_PER_PULSE      ),
    .TOL              (TOL              ),
    .I_REF_DELTA_INSTB(I_REF_DELTA_INSTB),
    .DELTA_Q_INSTB    (DELTA_Q_INSTB    )
  ) top_inst (.*);

  resonant_sys #(.BUS_WIDTH(BUS_WIDTH)) resonant_sys_inst(
    .start(start),
    .i_ref(i_ref_out),
    .q_serialized(q_serialized)
  );

  initial begin
    q_serialized = 0;
    start        = 0;
    clk          = 0;
    rst          = 0;
    enable       = 0;
    q_desired    = 0;
    i_ref_out    = 0;
  end

  

//   /* Internal signals strobes*/
//   integer a         = DUT.a        ;
//   integer b         = DUT.b        ;
//   integer c         = DUT.c        ;
//   integer error     = DUT.error    ;
//   logic   converged = DUT.converged;

//   always @* begin
//     a         = DUT.a;
//     b         = DUT.b;
//     c         = DUT.c;
//     error     = DUT.error;
//     converged = DUT.converged;
//   end


  // CLK generator
  always
    #1 clk = ~clk;


  initial begin
    #5 rst = 1; rst = 0;
    #5 start = 1;
  end





endmodule