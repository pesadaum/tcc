`include "../resonant_system_emulation/resonant_sys.sv"

module top_tb ();
localparam BUS_WIDTH = 10;
// -- module: Q measurement
localparam WTD_BUS_WIDTH = 4 ;
localparam Q_PER_PULSE   = 10;
// -- module: control
localparam TOL = Q_PER_PULSE + 5;
// -- module: instability determination
localparam I_REF_DELTA_INSTB = 10;
localparam DELTA_Q_INSTB     = 50;
// -- module: resonant system emulation
parameter PULSE_DURATION = 3;

wire                 q_serialized;
reg                  start       ;
reg                  clk         ;
reg                  rst         ;
reg                  enable      ;
reg  [BUS_WIDTH-1:0] q_desired   ;
wire [BUS_WIDTH-1:0] i_ref_w     ;
reg                  pulses_ended;

top #(
  .BUS_WIDTH        (BUS_WIDTH        ),
  .WTD_BUS_WIDTH    (WTD_BUS_WIDTH    ),
  .Q_PER_PULSE      (Q_PER_PULSE      ),
  .TOL              (TOL              ),
  .I_REF_DELTA_INSTB(I_REF_DELTA_INSTB),
  .DELTA_Q_INSTB    (DELTA_Q_INSTB    )
) top_inst (
  .q_serialized(q_serialized),
  .start       (start       ),
  .clk         (clk         ),
  .rst         (rst         ),
  .enable      (enable      ),
  .q_desired   (q_desired   ),
  .i_ref_out   (i_ref_w     )
);

resonant_sys #(
  .BUS_WIDTH     (BUS_WIDTH     ),
  .PULSE_DURATION(PULSE_DURATION),
  .Q_PER_PULSE   (Q_PER_PULSE   )
) resonant_sys_inst (
  .i_ref       (i_ref_w     ),
  .start       (start       ),
  .q_serialized(q_serialized)
);

// Strobe for pulses ended debug signal
always @(q_serialized) begin
  pulses_ended = resonant_sys_inst.pulses_ended;
end


initial begin
  // q_serialized = 0;
  start        = 0;
  clk          = 0;
  rst          = 0;
  enable       = 0;
  q_desired    = 0;
  // i_ref_w    = 2**BUS_WIDTH-1;
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
  #5 rst = 1;  #5 rst = 0;
  #5 start = 1; enable = 1;

  q_desired = 210;

  # 210;

  // $stop();
end
  






endmodule