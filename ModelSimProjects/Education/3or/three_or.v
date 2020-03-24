module three_or
#(parameter Realization = "kmos")
 (input [2:0] x, output y);

generate
supply0 gnd; supply1 vcc;
wire w1, w2, w3;
  if (Realization == "kmos")
    begin
      pmos q6(w1, vcc, x[0]); pmos q5(w2, w1, x[1]); pmos q4(w3, w2, x[2]);
      nmos q1(w3, gnd, x[0]); nmos q2(w3, gnd, x[1]); nmos q3(w3, gnd, x[2]);
      pmos q7(y, vcc, w3); nmos q8(y, gnd, w3); 
    end
  else if(Realization == "nmos")
    begin
      rnmos qr1(w1, vcc, vcc);
      nmos q1(w1, gnd, x[0]);
      nmos q2(w1, gnd, x[1]);
      nmos q3(w1, gnd, x[2]);
      rnmos qr2(y, vcc, vcc);
      nmos q4(y, gnd, w1); 
    end
  else if(Realization == "pmos")
    begin
      pmos q1(w1, vcc, x[0]); 
      pmos q2(w2, w1, x[1]); 
      pmos q3(w3, w2, x[2]);
      rpmos qr1(w3, gnd, gnd);
      pmos q4(y, vcc, w3); rpmos qr2(y, gnd, gnd);      
    end
  else if(Realization == "better")
    begin
     rnmos qr1(w1, vcc, vcc);
     nmos q1(w1, gnd, x[0]);
     nmos q2(w1, gnd, x[1]);
     nmos q3(w1, gnd, x[2]);
     pmos q4(y, vcc, w1);
     nmos q5(y, gnd, w1);
    end
  else if(Realization == "tranif1")
    begin
      rtranif1 qr1(w1, vcc, vcc);
      tranif1 q1(w1, gnd, x[0]);
      tranif1 q2(w1, gnd, x[1]);
      tranif1 q3(w1, gnd, x[2]);
      rtranif1 qr2(y, vcc, vcc);
      tranif1 q4(y, gnd, w1);
    end
  else if(Realization == "tranif0")
    begin
      tranif0 q1(w1, vcc, x[0]); 
      tranif0 q2(w2, w1, x[1]); 
      tranif0 q3(w3, w2, x[2]);
      rtranif0 qr1(w3, gnd, gnd);
      tranif0 q4(y, vcc, w3); rtranif0 qr2(y, gnd, gnd); 
    end
 endgenerate
endmodule
