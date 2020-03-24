module cmos_decoder_3_6
(input wire [2:0] a,
output wire [5:0] b
);

wire w0,w1, w2, w3;
wire [2:0] na;
supply0 gnd; supply1 vcc;
genvar j;
  
for (j = 0; j < 3; j = j + 1)
 begin
  pmos (na[j], vcc, a[j]);
  nmos (na[j],gnd, a[j]);
 end

//output b0
nmos (w1, gnd, na[0]); pmos (w3, vcc, na[0]);
nmos (w2, w1, na[1]); pmos (w3, vcc, na[1]);
nmos (w3, w2, na[2]); pmos (w3, vcc, na[2]);

nmos (b[0], gnd, w3); pmos (b[0], vcc, w3);
//output b1
nmos (w4, gnd, a[0]); pmos (w6, vcc, a[0]);
nmos (w5, w4, na[1]); pmos (w6, vcc, na[1]);
nmos (w6, w5, na[2]); pmos (w6, vcc, na[2]);

nmos (b[1], gnd, w6); pmos (b[1], vcc, w6);
//output b2
nmos (w7, gnd, na[0]); pmos (w9, vcc, na[0]);
nmos (w8, w7, a[1]); pmos (w9, vcc, a[1]);
nmos (w9, w8, na[2]); pmos (w9, vcc, na[2]);

nmos (b[2], gnd, w9); pmos (b[2], vcc, w9);
//output b3
nmos (w10, gnd, a[0]); pmos (w12, vcc, a[0]);
nmos (w11, w10, a[1]); pmos (w12, vcc, a[1]);
nmos (w12, w11, na[2]); pmos (w12, vcc, na[2]);

nmos (b[3], gnd, w12); pmos (b[3], vcc, w12);
//output b4
nmos (w13, gnd, na[0]); pmos (w15, vcc, na[0]);
nmos (w14, w13, na[1]); pmos (w15, vcc, na[1]);
nmos (w15, w14, a[2]); pmos (w15, vcc, a[2]);

nmos (b[4], gnd, w15); pmos (b[4], vcc, w15);
//output b5
nmos (w16, gnd, a[0]); pmos (w18, vcc, a[0]);
nmos (w17, w16, na[1]); pmos (w18, vcc, na[1]);
nmos (w18, w17, a[2]); pmos (w18, vcc, a[2]);

nmos (b[5], gnd, w18); pmos (b[5], vcc, w18);
endmodule
