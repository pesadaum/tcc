module top #(
  // general
  parameter BUS_WIDTH         = 10,
  // -- module: Q measurement
  parameter WTD_BUS_WIDTH     = 2 ,
  parameter Q_PER_PULSE       = 30,
  // -- module: control
  parameter TOL               = 1 ,
  // -- module: instability determination
  parameter I_REF_DELTA_INSTB = 10,
  parameter DELTA_Q_INSTB     = 50
) (
  input                      q_serialized,
  input                      start       ,
  input                      clk         ,
  input                      rst         ,
  input      [BUS_WIDTH-1:0] q_desired   ,
  output reg [BUS_WIDTH-1:0] i_ref_out
);

  wire setup_is_completed;

  reg clk   ;
  reg ready ;
  reg enable;
  reg rst   ;

  reg  [BUS_WIDTH-1:0] q_measured ;
  wire [BUS_WIDTH-1:0] i_ref_setup;
  wire [BUS_WIDTH-1:0] i_ref      ;


  bisection #(
    .BUS_WIDTH(BUS_WIDTH),
    .TOL      (TOL      )
  ) q_control_inst (
    .rst        (rst        ),
    .clk        (clk        ),
    .ready      (ready      ),
    .q_desired  (q_desired  ),
    .q_measured (q_measured ),
    .i_ref      (i_ref      ),
    .i_ref_setup(i_ref_setup)
  );

  q_measurement #(
    .BUS_WIDTH    (BUS_WIDTH    ),
    .WTD_BUS_WIDTH(WTD_BUS_WIDTH),
    .Q_PER_PULSE  (Q_PER_PULSE  )
  ) q_measurement_inst (
    .q_serialized(q_serialized),
    .clk         (clk         ),
    .start       (start       ),
    .ready       (ready       ),
    .q_measured  (q_measured  )
  );


  instability_detect #(
    .BUS_WIDTH        (BUS_WIDTH        ),
    .DELTA_Q_INSTB    (DELTA_Q_INSTB    ),
    .I_REF_DELTA_INSTB(I_REF_DELTA_INSTB)
  ) instb_detect_inst (
    .clk        (clk        ),
    .rst        (rst        ),
    .ready      (ready      ),
    .enable     (enable     ),
    .q_measured (q_measured ),
    .i_ref_setup(i_ref_setup)
  );

  setup_completed #(.BUS_WIDTH(BUS_WIDTH)) setup_completed_inst (
    .i_ref      (i_ref             ),
    .i_ref_setup(i_ref_setup       ),
    .completed  (setup_is_completed),
    .i_ref_out  (i_ref             )
  );

endmodule