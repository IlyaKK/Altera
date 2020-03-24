`include "count4_d.v"
`timescale 1ns/1ns
module count4_d_tb ();
reg clock = 0;
wire [4:0] b [0:3];
count4_d
#("rs-type") bc0 (clock,b[0]);
count4_d
#("jk-type") bc1 (clock,b[1]);
count4_d
#("d-type") bc2 (clock,b[2]);
count4_d
#("t-type") bc3 (clock,b[3]);
initial
repeat (500) #5 clock = ~clock;
endmodule
