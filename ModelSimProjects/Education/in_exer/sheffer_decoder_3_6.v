module sheffer_decoder_3_6
(
input wire [3:0] a,
output wire [5:0] b
);

assign b[5] = ~(~(a[2]*~(a[1]*a[1])*a[0])), 
       b[4] = ~(~(a[2]*~(a[1]*a[1])*~(a[0]*a[0]))),
       b[3] = ~(~(~(a[2]*a[2])*a[1]*a[0])),
       b[2] = ~(~(~(a[2]*a[2])*a[1]*~(a[0]*a[0]))),
       b[1] = ~(~(~(a[2]*a[2])*~(a[1]*a[1])*a[0])),
       b[0] = ~(~(~(a[2]*a[2])*~(a[1]*a[1])*~(a[0]*a[0])));
endmodule