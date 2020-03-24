module Pirs_decoder_2_4
(
input wire [1:0] a,
output wire [3:0] b
);
wire [1:0] na;
wire [3:0] nb;
nor (na[1], a[1], a[1]);
nor (na[0], a[0], a[0]);
nor (nb[3], na[1], na[0]);
nor (nb[2], na[1], a[0]);
nor (nb[1], a[1], na[0]);
nor (nb[0], a[1], a[0]);
nor (b[3], nb[3], nb[3]);
nor (b[2], nb[2], nb[2]);
nor (b[1], nb[1], nb[1]); 
nor (b[0], nb[0], nb[0]); 
endmodule
