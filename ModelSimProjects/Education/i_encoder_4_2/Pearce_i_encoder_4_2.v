module Pearce_i_encoder_4_2
(
input wire [3:0] a,
output wire [1:0] b
);

wire [3:0] na;
nor (na[3],a[3],a[3]);
nor (na[2],a[2],a[2]);
nor (na[1],a[1],a[1]);
nor (b[1], na[3], na[2]);
nor (b[0], na[3], na[1]);  
endmodule
