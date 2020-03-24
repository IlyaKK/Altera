`timescale 1ns/1ns
module decoder_N_M ();
 localparam S = 2;
 realtime t;
 reg [S-1:0] a = 0;
 wire [2**S - 1:0] b;

 assign b = ~(2 ** a);


initial begin
 $display("------------------------------------------");
 $display("|  t   | i | a1 | a0 | b3 | b2 | b1 | b0 |");
 repeat (2**S) begin
 #5;
 t = $time;
 $display("|%3.0f ns|%2d |%3b |%3b |%3b |%3b |%3b |%3b |",
 t, a, a[1], a[0], b[3], b[2], b[1], b[0]);
 a = a + 1;
 end
 $display("------------------------------------------");
end

endmodule
