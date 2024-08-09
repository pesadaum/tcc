module control_tb_new ();

  // timeunit = 900us;
  // timeprecision = 1us;
  localparam WIDTH = 10;
  localparam TOL   = 1 ;
  // localparam DESIRED_Q = 110;



  logic clk  ;
  logic ready;
  logic rst  ;
//   logic enable;

  logic [WIDTH-1:0] desired_q  ;
  logic [WIDTH-1:0] measured_q ;
  logic [WIDTH-1:0] i_ref_setup;
  logic [WIDTH-1:0] i_ref      ;

  bisection #(
    .WIDTH(WIDTH),
    .TOL  (TOL  )
  ) DUT (
    .rst        (rst        ),
    .clk        (clk        ),
    .ready      (ready      ),
    .desired_q  (desired_q  ),
    .measured_q (measured_q ),
    .i_ref      (i_ref      ),
    .i_ref_setup(i_ref_setup)
  );


  initial begin
    clk         =          0;
    ready       =          0;
    rst         =          0;
    desired_q   =        110;
    i_ref_setup = 2**WIDTH-1;
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

  /* Internal signals strobes*/
  integer a         = DUT.a        ;
  integer b         = DUT.b        ;
  integer c         = DUT.c        ;
  integer error     = DUT.error    ;
  logic   converged = DUT.converged;

  always @* begin
    a         = DUT.a;
    b         = DUT.b;
    c         = DUT.c;
    error     = DUT.error;
    converged = DUT.converged;
  end

  always @(i_ref) measured_q = q_array[i_ref];


  // CLK generator
  always
    #1 clk = ~clk;

  initial begin
    // # 5 start = 1'b1; // wait 5 units to set high impedance

    #5 rst = 1; ready = 0;
    #5 rst = 0; ready = 1;
    # 50;

    desired_q = 40;
    #5 rst = 1; ready = 0;
    #5 rst = 0; ready = 1;
    #50;

    $stop();

  end

endmodule