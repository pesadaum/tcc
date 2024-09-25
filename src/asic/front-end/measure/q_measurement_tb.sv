module q_measurement_tb ();
  localparam WTD_BUS_WIDTH   = 3 ;
  localparam BUS_WIDTH       = 10;
  localparam Q_PER_PULSE = 30;

  logic             clk         ;
  logic             q_serialized;
  logic             start       ;
  logic             ready       ;
  logic [BUS_WIDTH-1:0] q_measured  ;

  q_measurement #(
    .BUS_WIDTH      (BUS_WIDTH      ),
    .WTD_BUS_WIDTH  (WTD_BUS_WIDTH  ),
    .Q_PER_PULSE(Q_PER_PULSE)
  ) DUT (.*);

  localparam CLK_PERIOD      = 2;
  localparam Q_PULSES_PERIOD = 8;

  initial begin
    clk = 1'b0;
    start = 1'b0;
    q_serialized = 1'b0;
  end

  task generate_clock;
    input integer pulses, duration;
    repeat(pulses*2) begin
      # (2*duration) q_serialized = ~q_serialized;
    end
  endtask

  // CLK generation
  always
    #(CLK_PERIOD/2) clk = ~clk;

  // task show;
  //   $write("At time %3d: clk=%d, rst=%d, count=%4d",
  //     $time, clk, rst, count);
  // endtask

  // always @(posedge clk or negedge clk) begin
  //   // show();
  //   $display();
  // end

  always @(posedge clk or negedge clk) begin
    $display("wtd=%4d, q_pulses_count=%4d", DUT.wtd, DUT.q_pulses_count);
  end

  initial begin
    # 5 start = 1'b1; // wait 5 units to set high impedance

    # 5 // wait 34 units
      generate_clock(6, 3);
    # 50 ;

    # 5 start = 1'b0;
    # 5 start = 1'b1; // wait 5 units to set high impedance

    # 5 // wait 34 units
      generate_clock(3, 3);
    # 50 ;

    $stop();

  end

endmodule