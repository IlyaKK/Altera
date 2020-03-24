`include "pi_encoderM_N_fun.v"
`timescale 1ns/1ns
module pi_encoderM_N_fun_tb ();
 localparam size = 2;
 reg [2**size-1:0] a=0;
 wire [size-1:0] b;
 integer fid, i;
 realtime t;

 pi_encoderM_N_fun #( .SIZE(size) )cd1 ( .a(a), .b(b) );

 initial
 begin
  fid = $fopen("pencoder_data.txt");
  $display("------------------------------------------"); 
  $fstrobe(fid,"------------------------------------------");
  $display("|  t   | i | a3 | a2 | a1 | a0 | b1 | b0 |");
  $fstrobe(fid,"|  t   | i | a3 | a2 | a1 | a0 | b1 | b0 |");
  for (i = 0; i <= 2**(2**size)-1; i = i + 1)
  begin
   a = a+1; /* i */
   t = $time;
   $monitor("|%3.0f ns|%2d |%3.0f |%3.0f |%3.0f |%3.0f |%3.0f |%3.0f |",
   t, a, a[3], a[2], a[1], a[0], b[1], b[0]);
   $fstrobe(fid,"|%3.0f ns|%2d |%3.0f |%3.0f |%3.0f |%3.0f |%3.0f |%3.0f |",
   t, a, a[3], a[2], a[1], a[0], b[1], b[0]);
   #50;
  end
  $display("------------------------------------------");
  $fstrobe(fid,"------------------------------------------");
  #1;
  $fclose(fid);
  $stop(2);
 end

endmodule
