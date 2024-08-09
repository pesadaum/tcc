module control_tb ();
  localparam WIDTH = 10;
  localparam TOL   = 1 ;
  // localparam DESIRED_Q = 110;

  reg clk   ;
  reg ready ;
  reg enable;
  reg rst   ;

  reg  [WIDTH-1:0] desired_q  ;
  reg  [WIDTH-1:0] measured_q ;
  reg  [WIDTH-1:0] i_ref_setup;
  wire [WIDTH-1:0] i_ref      ;


  bisection #(
    .WIDTH(WIDTH),
    .TOL  (TOL  )
  ) DUT_bisection (
    .rst        (rst        ),
    .clk        (clk        ),
    .ready      (enable     ),
    .desired_q  (desired_q  ),
    .measured_q (measured_q ),
    .i_ref      (i_ref      ),
    .i_ref_setup(i_ref_setup)
  );

  // secant #(
  //   .WIDTH(WIDTH),
  //   .TOL  (TOL  )
  // ) DUT_secant (
  //   .rst        (rst        ),
  //   .clk        (clk        ),
  //   .ready      (enable     ),
  //   .desired_q  (DESIRED_Q  ),
  //   .measured_q (measured_q ),
  //   .i_ref      (i_ref      ),
  //   .i_ref_setup(i_ref_setup)
  // );

  initial begin
    clk         =          0;
    ready       =          1;
    enable      =          1;
    desired_q   =         110;
    measured_q  =          0;
    i_ref_setup = 2**WIDTH-1;
    DUT_bisection.error = 2**WIDTH-1;
    // DUT_bisection.c = 512;
  end


  reg [WIDTH-1:0] q_array[2**WIDTH-1:0]; // Caution, large array

  initial begin: fill_measurements
    integer file  ;
    integer parsed;
    integer i     ;
    string  data  ;

    file = $fopen("./q_fit_10bits_no_drop.txt", "r");

    i = 0;
    while (!$feof(file)) begin : reading_file
      $fgets(data, file);
      parsed = data.atoi();

      q_array[i] = parsed;
      if (i % 10 == 0)
        $display("Reading Q = %0d at position %0d", q_array[i], i);

      i = i+1;
    end
    $fclose(file);
    // $display("\n\nData acquire completed\n\n");
  end


  task generate_clock;
    input integer pulses, duration;
    repeat(pulses) begin
      # (duration) clk = 1'b1;
      # (duration) clk = 1'b0;
    end
  endtask

  task show;
    $write("At time %3d: i_ref=%d, measured_q=%d, desired_q=%4d, clk=%b, enable=%b, ready=%b",
      $time, i_ref, measured_q, desired_q, clk, enable, ready);
  endtask


  initial begin
    # 5 rst = 1;
    # 5 rst = 0;
    generate_clock(50, 1);
  end

  always @(posedge clk) begin: update_q_by_iref
    measured_q = q_array[i_ref];
  end

  integer i_test = 0;

  integer sweep[13:0];

  integer j = 0;

  initial begin
    sweep[0] = 30;
    for (j = 1; j < 14; j = j+1) begin
      sweep[j] = sweep[j-1] + 20;
      $display("Sweep[j]=%d", sweep[j]);
    end
    j = 0;
  end


  always @(posedge clk or negedge clk) begin: tb
    show();
    $display(" a=%4d, b=%4d, c=%4d", DUT_bisection.a, DUT_bisection.b, DUT_bisection.c);

    if(DUT_bisection.converged) begin
      DUT_bisection.converged = 0;
      rst                     = 1;
      desired_q               = sweep[j];
      j                       = j+1;
      rst                     = 0;
      // i = i+1;
      $display("Q Converged with desired_q=%4d, measured_q=%d, after %3d time units", desired_q, measured_q, $time);
      $finish();
    end
  end

endmodule