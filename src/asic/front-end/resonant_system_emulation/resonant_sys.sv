module resonant_sys #(
  parameter BUS_WIDTH      = 10,
  parameter PULSE_DURATION = 3 ,
  parameter Q_PER_PULSE    = 30,
  parameter INCLUDE_Q_DROP = 0
) (
  input      [BUS_WIDTH-1:0] i_ref       ,
  input                      start       ,
  output reg                 q_serialized
);


  initial begin
    q_serialized = 0;
  end

  reg [BUS_WIDTH-1:0] q_parallel  = 0;
  reg [BUS_WIDTH-1:0] n_of_pulses = 0;

  reg pulses_ended = 0;

  integer i_ref_idx = 0;
  reg [BUS_WIDTH-1:0] q_array[2**BUS_WIDTH-1:0];

  initial begin: fill_measurements
    integer file  ;
    integer parsed;
    integer i     ;
    string  data  ;

    if (INCLUDE_Q_DROP)
      file = $fopen("./q_fit_10bits_with_drop.txt", "r");
    else
      file = $fopen("./q_fit_10bits_no_drop.txt", "r");

    i = 0;
    while (!$feof(file)) begin : reading_file
      $fgets(data, file);
      parsed = data.atoi();

      q_array[i] = parsed;
      if (i % 10 == 0) begin
        $display("Reading Q = %0d at position %0d", q_array[i], i);
      end

      i = i+1;
    end
    $fclose(file);
    $display("\n\nData acquire completed\n\n");
    // $display("Q array is=%p", q_array);
  end

  always @(i_ref or start) begin
    i_ref_idx = i_ref;
    n_of_pulses = 0;
    if (start) begin
      q_parallel  = q_array[i_ref_idx];
      n_of_pulses = q_parallel / Q_PER_PULSE;

      if (n_of_pulses == 0) n_of_pulses = 1;
      $display("q_parallel=%4d, i_ref=%4d, indexed_q=%4d, n_of_pulses=%4d", q_parallel, i_ref, q_array[i_ref], n_of_pulses);
    end
    else q_parallel = 0;
  end

  always @(n_of_pulses or start) begin
    pulses_ended = 0;
    if (start) begin
      repeat (n_of_pulses*2) begin
        # (2*PULSE_DURATION) q_serialized = ~q_serialized;
      end
      pulses_ended = 1;
    end
  end

endmodule