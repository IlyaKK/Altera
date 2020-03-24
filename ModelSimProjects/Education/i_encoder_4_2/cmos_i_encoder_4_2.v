module cmos_i_encoder_4_2
(
input wire [3:0] a,
output wire [1:0] b
);

wire w0,w1, w2, w3;
supply0 gnd; supply1 vcc;

//output b1
nmos (w1, gnd, a[3]); pmos (w2, vcc, a[3]);
nmos (w2, w1, a[2]); pmos (w2, vcc, a[2]);
//invertor 1
nmos (b[1], gnd, w2); pmos (b[1], vcc, w2);
//output b0
nmos (w3, gnd, a[3]); pmos (w4, vcc, a[3]);
nmos (w4, w3, a[1]); pmos (w4, vcc, a[1]);
//invertor 2
nmos (b[0], gnd, w4); pmos (b[0], vcc, w4);

endmodule
