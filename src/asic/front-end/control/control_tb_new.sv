module control_tb_new ();

  // timeunit = 900us;
  // timeprecision = 1us;
  localparam BUS_WIDTH = 10;
  localparam TOL       = 1 ;
  // localparam q_desired = 110;



  logic clk          ;
  logic ready        ;
  logic rst          ;
  logic enable       ;
  logic went_unstable;

  logic [BUS_WIDTH-1:0] q_desired ;
  logic [BUS_WIDTH-1:0] q_measured;
  logic [BUS_WIDTH-1:0] i_ref_mux ;
  logic [BUS_WIDTH-1:0] i_ref     ;

  // bisection #(
  //   .BUS_WIDTH(BUS_WIDTH),
  //   .TOL      (TOL      )
  // ) DUT (
  //   .ready        (ready        ), // flag for measurement is ready
  //   .clk          (clk          ),
  //   .rst          (rst          ),
  //   .enable       (enable       ),
  //   .i_ref_mux    (i_ref_mux    ),
  //   .q_desired    (q_desired    ),
  //   .q_measured   (q_measured   ),
  //   .i_ref        (i_ref        ),
  //   .went_unstable(went_unstable)
  // );

  secant #(
    .BUS_WIDTH(BUS_WIDTH),
    .TOL      (TOL      )
  ) DUT (
    .ready        (ready        ), // flag for measurement is ready
    .clk          (clk          ),
    .rst          (rst          ),
    // .enable       (enable       ),
    .i_ref_setup  (i_ref_mux    ),
    .q_desired    (q_desired    ),
    .q_measured   (q_measured   ),
    .i_ref        (i_ref        ),
    .went_unstable(went_unstable)
  );


  initial begin
    clk         =          0;
    ready       =          0;
    rst         =          0;
    q_desired   =        110;
    i_ref_mux   = 2**BUS_WIDTH-1;
    enable      = 1;
    went_unstable = 0;
  end

  reg [BUS_WIDTH-1:0] q_array[2**BUS_WIDTH-1:0]; // Caution, large array

  real my_real = 3.14159;

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

  always @(i_ref) q_measured = q_array[i_ref];


  // CLK generator
  always
    #1 clk = ~clk;

  initial begin
    // # 5 start = 1'b1; // wait 5 units to set high impedance

    #5 rst = 1; ready = 0;
    #5 rst = 0; ready = 1;
    # 50;

    q_desired = 40;
    #5 rst = 1; ready = 0;
    #5 rst = 0; ready = 1;
    #50;

    $display(my_real);
    $stop();

  end

endmodule