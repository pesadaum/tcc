module i_ref_sampling_tb ();

  localparam BUS_WIDTH = 10;


  reg                 clk          ;
  reg                 rst          ;
  reg                 enable       ;
  reg                 ready        ;
  reg                 went_unstable;
  reg [BUS_WIDTH-1:0] i_ref        ;
  reg [BUS_WIDTH-1:0] i_ref_max    ;

  i_ref_sampling #(.BUS_WIDTH(BUS_WIDTH)) i_ref_sampling_inst (
    .i_ref        (i_ref        ),
    .clk          (clk          ),
    .rst          (rst          ),
    .enable       (enable       ),
    .ready        (ready        ),
    .went_unstable(went_unstable),
    .i_ref_max    (i_ref_max    )
  );

  initial begin
    clk = 0;
    rst = 0;
    enable = 1;
    ready = 0;
    went_unstable = "z";
    i_ref = 2**BUS_WIDTH-1;
  end


  always
    #1 clk = ~clk;

  always begin
      #5 ready = 1;
      #3 ready = 0;
    end
    
    always @ (posedge ready) begin 
        i_ref = $urandom_range(1, 1024);
    end
        
  initial begin : tb
    #1 clk = 0;
    #5 rst = 1; #5 rst = 0;

    # 50;
    went_unstable = 1;
    # 5 went_unstable = 0;

    # 100;

    $stop();

  end


endmodule