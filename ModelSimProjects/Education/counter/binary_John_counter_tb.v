`include "binary_John_counter.v"
`timescale 1ns/1ns
module binary_John_counter_tb ();
localparam digits = 4;
localparam max = 16;
reg clock = 0;
wire [digits-1:0] count [0:2];
binary_John_counter #(.max(max),.direction("up")) bc1 (.clock(clock), .count(count[0]));
binary_John_counter #(.max(max),.direction("down")) bc2 (.clock(clock), .count(count[1]));
binary_John_counter #(.max(max),.direction("reverse")) bc3 (.clock(clock), .count(count[2]));
initial repeat (90) #10 clock = ~clock;
endmodule
