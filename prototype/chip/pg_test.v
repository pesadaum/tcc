`timescale 1ns/1ps

module pg_test;
  reg  enab ;
  wire pulse;

  localparam N = 10;
  localparam D = 2 ;

  pulse_generator #(
    .N_PULSES (N),
    .PULSE_DUR(D)
  ) pg_inst (
    .enab (enab ),
    .pulse(pulse)
  );

  task expect(input pulse_expected, input current_n);
    if (pulse !== pulse_expected) begin
      $display("TEST FAILED");
      $display("At time %0d duration=%d pulse=%b pulse_number=%d",
        $time, D, pulse, current_n);
      $display("data_out should be %b", pulse_expected);
      // $finish;
    end
    else begin
      $display("At time %0d duration=%d pulse=%b pulse_number=%d",
        $time, D, pulse, current_n);
    end
  endtask

  initial begin
    enab <= 0;
    # 10

    enab <= 1;

    for (integer i = 0; i < 10; i = i+2 ) begin
      // #i;
      expect(1, i);
      
    end




  end




endmodule