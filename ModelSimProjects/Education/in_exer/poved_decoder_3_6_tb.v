`include "poved_decoder_3_6.v"
`timescale 1ns/1ns
module poved_decoder_3_6_tb ();
 reg [2:0] a = 0;
 wire [5:0] b;
 realtime t;

poved_decoder_3_6 dc1 ( .a( a ), .b( b ) ); 

initial begin
 $display("---------------------------------------------------------");
 $display("|  t   | i | a2 | a1 | a0 | b5 | b4 | b3 | b2 | b1 | b0 |");
 repeat (6) begin
 #50;
 t = $time;
 $display("|%3.0f ns|%2d |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |",
 t, a, a[2], a[1], a[0], b[5], b[4], b[3], b[2], b[1], b[0]);
 a = a + 1;
 end
 $display("---------------------------------------------------------");
end
endmodule
