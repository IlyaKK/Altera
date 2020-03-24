module cmos_decoder_2_4
(input wire [1:0] a,
output wire [3:0] b
);

wire w0,w1, w2, w3;
wire [3:0] na;
supply0 gnd; supply1 vcc;
genvar j;
  
for (j = 0; j < 2; j = j + 1)
 begin
  pmos (na[j], vcc, a[j]);
  nmos (na[j],gnd, a[j]);
 end

//output b0
pmos (b[0], vcc, na[0]); pmos (b[0], vcc, na[1]);
nmos (w0, gnd, na[0]); nmos (b[0], w0, na[1]);
//output b1
pmos (b[1], vcc, a[0]); pmos (b[1], vcc, na[1]);
nmos (w1, gnd, a[0]); nmos (b[1], w1, na[1]);
//output b2
pmos (b[2], vcc, na[0]); pmos (b[2], vcc, a[1]);
nmos (w2, gnd, na[0]); nmos (b[2], w2, a[1]);
//output b3
pmos (b[3], vcc, a[0]); pmos (b[3], vcc, a[1]);
nmos (w3, gnd, a[0]); nmos (b[3], w3, a[1]);

endmodule
