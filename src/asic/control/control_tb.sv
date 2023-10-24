module control_tb ();
  localparam MAX_ITER = 32;
  localparam WIDTH    = 10;
  localparam TOL      = 30;

  reg clk   ;
  reg ready ;
  reg enable;

  reg [WIDTH-1:0] desired_q  ;
  reg [WIDTH-1:0] measured_q ;
  reg [WIDTH-1:0] i_ref_setup;
  reg [WIDTH-1:0] i_ref      ;

  initial begin
    clk         =    0;
    ready       =    1;
    enable      =    0;
    desired_q   =   50;
    measured_q  =    0;
    i_ref_setup = 1023;
    i_ref       =    0;
  end


  bisection #(
    .WIDTH   (WIDTH   ),
    .MAX_ITER(MAX_ITER),
    .TOL     (TOL     )
  ) DUT_bisection (
    .clk        (clk        ),
    .ready      (enable     ),
    .desired_q  (desired_q  ),
    .measured_q (measured_q ),
    .i_ref      (i_ref      ),
    .i_ref_setup(i_ref_setup)
  );

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
    $display("\n\nData acquire completed\n\n");
  end



  always #(CLK_PERIOD/2) clk=~clk;

  initial begin
    $dumpfile("tb_bisection.vcd");
    $dumpvars(0, tb_bisection);
  end

  initial begin
    #1 rst_n<=1'bx;clk<=1'bx;
    #(CLK_PERIOD*3) rst_n<=1;
    #(CLK_PERIOD*3) rst_n<=0;clk<=0;
    repeat(5) @(posedge clk);
    rst_n<=1;
    @(posedge clk);
    repeat(2) @(posedge clk);
    $finish(2);
  end

endmodule
`default_nettype wire