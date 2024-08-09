module instability_detect_tb ();

  localparam WIDTH      = 10;
  localparam DELTA      = 50;
  localparam IREF_DELTA = 10;

  logic clk   ;
  logic rst   ;
  logic ready ;
  logic enable;

  logic [WIDTH-1:0] q_measured ;
  wire  [WIDTH-1:0] i_ref_setup;

  initial begin: variables_setup
    clk = 0;
    rst = 0;
    ready = 1;
    enable = 0;
  end

  instability_detect #(
    .WIDTH     (WIDTH     ),
    .DELTA     (DELTA     ),
    .IREF_DELTA(IREF_DELTA)
  ) DUT (
    .clk        (clk        ),
    .rst        (rst        ),
    .ready      (ready      ),
    .enable     (enable     ),
    .q_measured (q_measured ),
    .i_ref_setup(i_ref_setup)
  );


  // clock generator
  always #1 clk = ~clk;

  logic             found ;
  logic [WIDTH-1:0] curr_q;
  logic [WIDTH-1:0] last_q;

  always @(posedge clk or negedge clk) begin
    found  = DUT.found;
    curr_q = DUT.curr_q;
    last_q = DUT.last_q;
  end

  reg [WIDTH-1:0] q_array[2**WIDTH-1:0]; // Caution, large array

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



  task show;
    $write("At time %3d: i_ref_setup=%d, q_measured=%d, clk=%b, enable=%b, rst=%b",
      $time, i_ref_setup, q_measured, clk, enable, rst);
  endtask


  initial begin
    # 1 rst = 1;
    # 1 rst = 0;
    # 1 enable = 1;

    # 15 enable = 0;
    # 10 enable = 1;

    # 10 rst = 1 ; #5 rst = 0;

    # 50;

    # 10 rst = 1 ; #5 rst = 0;

    # 50;
    $stop();
  end

  always @(i_ref_setup) q_measured = q_array[i_ref_setup];

  always @(posedge clk or negedge clk) begin: tb
    show();
    $display();
  end



endmodule