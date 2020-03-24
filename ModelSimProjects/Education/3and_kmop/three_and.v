module three_and
#(parameter Realization = "better_version")
 (input [2:0] x, output y);

generate
supply0 gnd; supply1 vcc;
wire w1, w2, w3;
  if (Realization == "kmop")
    begin
      nmos q1(w1, gnd, x[0]); nmos q2(w2, w1, x[1]); nmos q3(w3, w2, x[2]);
      pmos q4(w3, vcc, x[1]); pmos q5(w3,vcc, x[2]); pmos q6(w3, vcc,x[0]);
      pmos q7(y, vcc, w3); nmos q8(y, gnd, w3);
     end
  else
  if (Realization == "nmop")
    begin
      rnmos qr1(w2, vcc, vcc); rnmos qr2(y, vcc, vcc); nmos q1(w0, gnd, x[0]);
      nmos q2(w1, w0, x[1]); nmos q3(w2,w1, x[2]); nmos q4(y, gnd, w2);
    end 
  if (Realization == "pmop")
    begin
      rpmos qr1(w0, gnd, gnd); rpmos qr2(y, gnd, gnd); pmos q1(w0, vcc, x[0]);
      pmos q2(w0, vcc, x[1]); pmos q3(w0,vcc, x[2]); pmos q4(y, vcc, w0);
    end 
  if (Realization == "better_version")
    begin
      rnmos qr(y, vcc, vcc); nmos q1(y, gnd, w3); nmos q2(w3, gnd, x[2]);
      pmos q3(w3, vcc, x[2]); nmos q4(w1,gnd, x[0]); pmos q5(w1, vcc, x[0]);
      nmos q6(y, gnd, w1); nmos q7(y, gnd, w2); pmos q8(w2, vcc, x[1]); nmos q9(w2, gnd, x[1]);
    end 
  if (Realization == "tranif1")
    begin
      rtranif1 qr1(w2, vcc, vcc); rtranif1 qr2(y, vcc, vcc); tranif1 q1(w0, gnd, x[0]);
      tranif1 q2(w1, w0, x[1]); tranif1 q3(w2,w1, x[2]); tranif1 q4(y, gnd, w2);
    end
  if (Realization == "tranif0")
    begin
      rtranif0 qr1(w0, gnd, gnd); rtranif0 qr2(y, gnd, gnd); tranif0 q1(w0, vcc, x[0]);
      tranif0 q2(w0, vcc, x[1]); tranif0 q3(w0,vcc, x[2]); tranif0 q4(y, vcc, w0);
    end 
 endgenerate
endmodule
