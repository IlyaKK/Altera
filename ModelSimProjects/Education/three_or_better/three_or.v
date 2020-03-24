module three_or
#(parameter Realization = "better")
(input [2:0] x, output y);

generate
  if (Realization == "better")
   begin
    supply0 gnd; supply1 vcc;
    wire [2:1] x;
    wire w1;
    rnmos qr1(w1, vcc, vcc);
    pmos q1(y, vcc, w1);
    nmos q2(y, gnd, w1);
    nmos q3(y, gnd, w1);
    nmos q4(y, gnd, w1);
    nmos q5(w1, gnd, x[0]);
    nmos q6(w1, gnd, x[1]);
    nmos q7(w1, gnd, x[2]);
  end
endgenerate
endmodule
