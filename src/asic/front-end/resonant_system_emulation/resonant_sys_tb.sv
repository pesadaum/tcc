module resonant_sys_tb ();
  localparam BUS_WIDTH      = 10;
  localparam PULSE_DURATION = 3 ;
  localparam Q_PER_PULSE    = 60;

  reg [BUS_WIDTH-1:0] i_ref       ;
  reg                 start       ;
  reg                 q_serialized;
  reg pulses_ended;

  resonant_sys #(
    .BUS_WIDTH     (BUS_WIDTH     ),
    .PULSE_DURATION(PULSE_DURATION),
    .Q_PER_PULSE   (Q_PER_PULSE   )
  ) DUT (
    .i_ref       (i_ref       ),
    .start       (start       ),
    .q_serialized(q_serialized)
  );

  initial begin
    i_ref = 1024;
    start = 0;
  end

  always @(q_serialized) begin
    pulses_ended = DUT.pulses_ended;
  end


  initial begin
    # 5 i_ref = 600;  
    # 10 start = 1;


    # 40 i_ref = 1000;
    # 100
    
    # 15 start = 0; 
    # 55 start = 1;  

    // # 5 i_ref = 900;  # 1 start = 0;
    // # 5 i_ref = 800;  # 1 start = 1;

    // # 5 ready = 1;

    # 300;


  end

endmodule