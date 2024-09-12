`include "../control/bisection.v"
`include "../measure/q_measurement.v"
`include "../setup_completed/setup_completed.v"
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
  parameter INCLUDE_Q_DROP = 0
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

generate
  if (INCLUDE_Q_DROP) begin : gen_blk/* In this case, we have a limited upper bound for i_ref*/
    wire [BUS_WIDTH-1:0] i_ref_setup_w    ;
    wire                 setup_completed_w;
    instability_detect #(
      .BUS_WIDTH        (BUS_WIDTH        ),
      .DELTA_Q_INSTB    (DELTA_Q_INSTB    ),
      .I_REF_DELTA_INSTB(I_REF_DELTA_INSTB)
    ) instb_detect_inst (
      .clk            (clk              ),
      .rst            (rst              ),
      .ready          (ready_w          ),
      .enable         (enable           ),
      .q_measured     (q_measured_w     ),
      .i_ref_setup    (i_ref_setup_w    ),
      .setup_completed(setup_completed_w)
    );
  end
  else begin : gen_blk /* In this case, wthe upper bound for i_ref is the BUS_WIDTH chosen*/
    wire [BUS_WIDTH-1:0] i_ref_setup_w     = 2**BUS_WIDTH-1;
    wire                 setup_completed_w = 1'b1          ;
  end
endgenerate

bisection #(
  .BUS_WIDTH(BUS_WIDTH),
  .TOL      (TOL      )
) q_control_inst (
  .clk            (clk              ),
  .rst            (rst              ),
  .enable         (enable           ),
  .ready          (ready_w          ),
  .setup_completed(setup_completed_w),
  .q_desired      (q_desired        ),
  .q_measured     (q_measured_w     ),
  .i_ref          (i_ref_w          ),
  .i_ref_setup    (gen_blk.i_ref_setup_w    )
);

setup_completed #(.BUS_WIDTH(BUS_WIDTH)) setup_completed_inst (
  .i_ref      (i_ref_w                  ),
  .i_ref_setup(gen_blk.i_ref_setup_w    ),
  .completed  (gen_blk.setup_completed_w),
  .i_ref_out  (i_ref_out                )
);

endmodule