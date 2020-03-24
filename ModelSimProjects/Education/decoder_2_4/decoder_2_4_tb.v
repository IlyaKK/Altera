`include "decoder2_4_top.v"
`timescale 1ns/1ns
module decoder_2_4_tb ();
 reg [1:0] a = 0;
 wire [3:0] b;
 realtime t;

decoder2_4_top mut ( .a( a ), .b( b ) );
 defparam mut.select = "Func_and_if"; 
 

initial begin
 $display("------------------------------------------");
 $display("|  t   | i | a1 | a0 | b3 | b2 | b1 | b0 |");
 repeat (4) begin
 #5;
 t = $time;
 $display("|%3.0f ns|%2d |%3b |%3b |%3b |%3b |%3b |%3b |",
 t, a, a[1], a[0], b[3], b[2], b[1], b[0]);
 a = a + 1;
 end
 $display("------------------------------------------");
end
endmodule
