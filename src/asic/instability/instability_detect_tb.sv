module instability_detect_tb ();

  localparam WIDTH      = 10;
  localparam DELTA      = 50;
  localparam IREF_DELTA = 10;

  reg              clk        ;
  reg              rst        ;
  reg              enable     ;
  reg              ready      ;
  reg  [WIDTH-1:0] q_measured ;
  wire [WIDTH-1:0] i_ref_setup;

  initial begin: variables_setup
    rst = 0;
    enable = 0;
    ready = 0;
  end

  instability_detect #(
    .WIDTH     (WIDTH     ),
    .DELTA     (DELTA     ),
    .IREF_DELTA(IREF_DELTA)
  ) DUT (
    .clk        (clk        ),
    .rst        (rst        ),
    .q_measured (q_measured ),
    .i_ref_setup(i_ref_setup)
  );

  reg [WIDTH-1:0] q_array[2**WIDTH:0]; // Caution, large array

  initial begin: fill_measurements
    integer file  ;
    integer parsed;
    integer i     ;
    string  data  ;

    file = $fopen("./q_fit_10bits_with_drop.txt", "r");

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
    $display("\n\nData acquire completed\n\n");
  end


  task generate_clock;
    input integer pulses, duration;
    repeat(pulses) begin
      # (duration) clk = 1'b0;
      # (duration) clk = 1'b1;
    end
  endtask

  task show;
    $write("At time %3d: i_ref_setup=%d, q_measured=%d, clk=%b, enable=%b, rst=%b, ready=%b",
      $time, i_ref_setup, q_measured, clk, enable, rst, ready);
  endtask


  integer idx = (2**WIDTH) - 1;
  initial begin
    // Testing 5 clock cycles in idle mode
    // $display("Testing 5 clock cycles in IDLE mode");
    // generate_clock(5, 1);
    // rst = 1; // wait two clock cycles for resetting the module value

    // #10;
    rst = 1;
    rst = 0;
    enable = 1;
    $display("\nTesting 100 clock cycles in READY mode");
    generate_clock(50, 1);



  end

  always @(posedge clk) begin: update_q_by_iref
    q_measured = q_array[i_ref_setup];
  end

  always @(posedge clk or negedge clk) begin: tb
    show();
    $display();
  end

  // always @(negedge clk)  // gambiarra pra formatação kkkkkkk



endmodule