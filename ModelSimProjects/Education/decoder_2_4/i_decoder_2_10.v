`timescale 1ns/1ns
module i_decoder_2_10 ();
 realtime t;
 reg [3:0] a = 0;
 reg [9:0] b;

 always @(a)
begin
 b = ~(2 ** a);
end


initial begin
 $display("----------------------------------------------------------------------------------");
 $display("|  t   | i | a3 | a2 | a1 | a0 | b9 | b8 | b7 | b6 | b5 | b4 | b3 | b2 | b1 | b0 |");
 repeat (10) begin
 #5;
 t = $time;
 $display("|%3.0f ns|%2d |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |%3b |",
 t, a, a[3], a[2], a[1], a[0], b[9], b[8], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]);
 a = a + 1;
 end
 $display("----------------------------------------------------------------------------------");
end

endmodule
