module sheffer_decoder_2_4
(
input wire [1:0] a,
output wire [3:0] b
);

assign b[3] = (~(a[1] & a[0]) & ~(a[1] & a[0]));
assign b[2] = ~(a[1]&~(a[0]&a[0]))&~(a[1]&~(a[0]&a[0]));
assign b[1] = ~(~(a[1]&a[1])&a[0])&~(~(a[1]&a[1])&a[0]);
assign b[0] = ~(~(a[1]&a[1])&~(a[0]&a[0]))&~(~(a[1]&a[1])&~(a[0]&a[0]));

endmodule
