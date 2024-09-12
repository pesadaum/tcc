`include "../control/bisection.v"
`include "../measure/q_measurement.v"
`include "../setup_completed/setup_completed.v"
`include "../resonant_system_emulation/resonant_sys.sv"
`include "../instability/instability_detect.v"

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
  parameter PULSE_DURATION = 3
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
wire ready_w                 ;
wire setup_completed_w = 1'b1; //

// --- buses
wire [BUS_WIDTH-1:0] q_measured_w                  ;
wire [BUS_WIDTH-1:0] i_ref_setup_w = 2**BUS_WIDTH-1;
wire [BUS_WIDTH-1:0] i_ref_w                       ;

// -- Lower modules Instance

bisection #(
  .BUS_WIDTH(BUS_WIDTH),
  .TOL      (TOL      )
) q_control_inst (
  .clk        (clk          ),
  .rst        (rst          ),
  .enable     (enable       ),
  .ready      (ready_w      ),
  .q_desired  (q_desired    ),
  .q_measured (q_measured_w ),
  .i_ref      (i_ref_w      ),
  .i_ref_setup(i_ref_setup_w)
);

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


  instability_detect #(
    .BUS_WIDTH        (BUS_WIDTH        ),
    .DELTA_Q_INSTB    (DELTA_Q_INSTB    ),
    .I_REF_DELTA_INSTB(I_REF_DELTA_INSTB)
  ) instb_detect_inst (
    .clk        (clk        ),
    .rst        (rst        ),
    .ready    (ready_w    ),
    .enable     (enable     ),
    .q_measured (q_measured_w ),
    .i_ref_setup(i_ref_setup_w)
  );

setup_completed #(.BUS_WIDTH(BUS_WIDTH)) setup_completed_inst (
  .i_ref      (i_ref_w          ),
  .i_ref_setup(i_ref_setup_w    ),
  .completed  (setup_completed_w),
  .i_ref_out  (i_ref_out        )
);


// reg [BUS_WIDTH-1:0] i_ref       ;
// reg                 start       ;
// reg                 q_serialized;
// reg                 pulses_ended;

// // -- State machine

// // --- States enumeration
// localparam S0 = 4'b000;
// localparam S1 = 4'b001;
// localparam S2 = 4'b010;
// localparam S3 = 4'b011;
// localparam S4 = 4'b100;

// localparam STATE = x;


// always @(posedge clk or posedge rst) begin
//   case (STATE)
//     S0 :
//       STATE <= start ?  S1 : S0 ;
//     S1 :
//       STATE <= ready_w ?  S1 : S1 ;
//     S2 :
//       STATE <= setup_completed_wire ?  S3 : S1 ;
//     // S3 :
//     // STATE <=
//     default : STATE <= S0;
//   endcase

// end


// always @(posedge clk or posedge rst) begin

// end





endmodule