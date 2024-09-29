module i_ref_sampling #(parameter BUS_WIDTH = 10) (
  input      [BUS_WIDTH-1:0] i_ref        ,
  input                      clk          ,
  input                      rst          ,
  input                      enable       ,
  input                      ready        ,
  input                      went_unstable,
  output reg [BUS_WIDTH-1:0] i_ref_max
);

reg [BUS_WIDTH-1:0] i_ref_smp_1;
reg [BUS_WIDTH-1:0] i_ref_smp_2;
reg [BUS_WIDTH-1:0] i_ref_smp_3;
reg [BUS_WIDTH-1:0] i_ref_smp_4;

always @(posedge clk or posedge rst)
    if (rst) begin
        i_ref_smp_1 <= 2**BUS_WIDTH-1;
        i_ref_smp_2 <= 2**BUS_WIDTH-1;
        i_ref_smp_3 <= 2**BUS_WIDTH-1;
        i_ref_smp_4 <= 2**BUS_WIDTH-1;
        i_ref_max   <= 2**BUS_WIDTH-1;
    end
    else if (ready & !went_unstable) begin
        i_ref_smp_1 <= i_ref;
        i_ref_smp_2 <= i_ref_smp_1;
        i_ref_smp_3 <= i_ref_smp_2;
        i_ref_smp_4 <= i_ref_smp_3;
    end
    else if (went_unstable) begin
        i_ref_max <= i_ref_smp_4;
    end
    

endmodule