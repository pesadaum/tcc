`include "../control/bisection.v"
`include "../i_ref_sampling/i_ref_sampling.v"
`include "../measure/q_measurement.v"
`include "../i_ref_mux/i_ref_mux.v"
`include "../resonant_system_emulation/resonant_sys.sv"

module top #(
  // -- general
  parameter BUS_WIDTH         = 10,
  // -- module: Q measurement
  parameter WTD_BUS_WIDTH     = 2 ,
  parameter Q_PER_PULSE       = 30,
  // -- module: control
  parameter TOL               = 1 ,
  // -- module: instability determination
  parameter I_REF_DELTA_INSTB = 10,
  parameter DELTA_Q_INSTB     = 50,
  // -- module: resonant system emulation
  parameter PULSE_DURATION = 3,
  parameter INCLUDE_Q_DROP = 1
) (
  input                      q_serialized,
  input                      start       ,
  input                      clk         ,
  input                      rst         ,
  input                      enable      ,
  input       [BUS_WIDTH-1:0] q_desired   ,
  output wire [BUS_WIDTH-1:0] i_ref_out
);

// -- top module connections
// --- wires
wire ready_w               ;
wire went_unstable_w       ; //

// --- buses
wire [BUS_WIDTH-1:0] q_measured_w                  ;
wire [BUS_WIDTH-1:0] i_ref_w                       ;
wire [BUS_WIDTH-1:0] i_ref_max_w                   ;


q_measurement #(
  .BUS_WIDTH    (BUS_WIDTH    ),
  .WTD_BUS_WIDTH(WTD_BUS_WIDTH),
  .Q_PER_PULSE  (Q_PER_PULSE  )
) q_measurement_inst (
  .q_serialized(q_serialized),
  .clk         (clk         ),
  .rst         (rst         ),
  .start       (start       ),
  .ready       (ready_w     ),
  .q_measured  (q_measured_w)
);

bisection #(
  .BUS_WIDTH(BUS_WIDTH),
  .TOL      (TOL      )
) q_control_inst (
  .clk            (clk              ),
  .rst            (rst              ),
  .enable         (enable           ),
  .ready          (ready_w          ),
  .q_desired      (q_desired        ),
  .q_measured     (q_measured_w     ),
  .i_ref          (i_ref_w          ),
  .went_unstable  (went_unstable_w  )
);

i_ref_sampling #(.BUS_WIDTH(BUS_WIDTH)) i_ref_sampling_inst (
  .i_ref        (i_ref_w        ),
  .clk          (clk            ),
  .rst          (rst            ),
  .enable       (enable         ),
  .ready        (ready_w        ),
  .went_unstable(went_unstable_w),
  .i_ref_max    (i_ref_max_w    )
);

i_ref_mux #(.BUS_WIDTH(BUS_WIDTH)) i_ref_mux_inst (
  .i_ref        (i_ref_w        ),
  .i_ref_max    (i_ref_max_w    ),
  .went_unstable(went_unstable_w),
  .i_ref_out    (i_ref_out      )
);

endmodule