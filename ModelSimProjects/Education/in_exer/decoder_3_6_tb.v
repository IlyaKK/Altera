`include "decoder3_6_top.v"
`timescale 1ns/1ns
module decoder_3_6_tb ();
 reg [2:0] a = 0;
 wire [5:0] b;
 realtime t;

decoder3_6_top mut ( .a( a ), .b( b ) );
 defparam mut.select = "CMOS"; 
 

initial begin
 $display("---------------------------------------------------------");
 $display("|  t   | i | a2 | a1 | a0 | b5 | b4 | b3 | b2 | b1 | b0 |");
 repeat (6) begin
 #5;
 t = $time;
 $display("|%3.0f ns|%2d |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |",
 t, a, a[2], a[1], a[0], b[5], b[4], b[3], b[2], b[1], b[0]);
 a = a + 1;
 end
 $display("---------------------------------------------------------");
end
endmodule
