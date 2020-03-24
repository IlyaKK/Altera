`include "i_encoder_4_2_top.v"
`timescale 1ns/1ns
module i_encoder_4_2_tb ();
 integer i;
 reg [3:0] a; wire [1:0] b;
 realtime t;

i_encoder_4_2_top mut ( .a( a ), .b( b ) );
 defparam mut.select = "Zhegalkin"; 

initial 
begin
 $display("------------------------------------------"); 
 $display("|  t   | i | a3 | a2 | a1 | a0 | b1 | b0 |");
 $monitor("|%3.0f ns|%2d |%3.0f |%3.0f |%3.0f |%3.0f |%3.0f |%3.0f |",
   t, a, a[3], a[2], a[1], a[0], b[1], b[0]);
end

initial begin
 for (i = 0; i < 4; i = i+1)
  begin
   t = $time;
   a = ~(2**i); #50;   
  end
 $display("------------------------------------------");
end
endmodule
