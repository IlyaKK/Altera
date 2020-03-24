module Sheffer_i_encoder_4_2
(
input wire [3:0] a,
output wire [1:0] b
);

assign b[1]=~(~(a[3]&a[2])),
       b[0]=~(~(a[3]&a[1]));
 
endmodule
