// `timescale 1ns/1ps

// module pulse_generator_test ();
//   reg  enab;
//   wire pulse;

//   localparam N = 10;
//   localparam D = 2;

//   pulse_generator #(
//     .N_PULSES  (N),
//     .PULSE_DUR (D)
//   ) pg_inst (
//     .enab(enab),
//     .pulse(pulse)
//   );

//   // TODO: write `expect` task

//   task expect(input pulse_expected);
//     if (pulse !== pulse_expected) begin
//       $display("TEST FAILED");
//       $display("At time %0d rst=%b duration=%d pulse=%b",
//         $time, rst, D, pulse);
//       $display("data_out should be %b", pulse_expected);
//       // $finish;
//     end
//     else begin
//       $display("At time %0d rst=%b duration=%d pulse=%b",
//         $time, rst, D, pulse);
//     end
//   endtask

//   // TODO: write a decent tb

//   initial begin
//     rst = 1;
//     start = 0;
//     expect(1'b0);
//     #10;

//     rst = 0;
//     start = 1;
//     #(D-1);
//     expect(1'b1);
//     #(D);
//     expect(1'b1);
//     #(D);
//     expect(1'b1);
//     #(D);
//     expect(1'b1);

//     #30;
//     start = 0;

//     #50;
//     start = 1;
//     $finish;
//   end
// endmodule
