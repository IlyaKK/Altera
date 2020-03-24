module Pirs_decoder_3_6
(
input wire [2:0] a,
output wire [5:0] b
);
wire [2:0] na;

nor (na[2], a[2], a[2]);
nor (na[1], a[1], a[1]);
nor (na[0], a[0], a[0]);
nor (b[0],a[2],a[1],a[0]);
nor (b[1],a[2],a[1],na[0]);
nor (b[2],a[2],na[1],a[0]);
nor (b[3],a[2],na[1],na[0]);
nor (b[4],na[2],a[1],a[0]);
nor (b[5],na[2],a[1],na[0]); 

endmodule
