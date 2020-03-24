module my_func
#(parameter Realization = "Transistors")
 (input [3:0] x, output y);

generate
supply0 gnd; supply1 vcc;
genvar j;

  if (Realization == "Transistors")
    begin
     wire w1, w2, w3, w4, w5, w6;
     wire [3:0] nx;
     
     for (j = 0; j < 4; j = j + 1)
      begin
       pmos (nx[j], vcc, x[j]);
       nmos (nx[j],gnd, x[j]);
      end
     pmos q1(w1, vcc, x[0]); pmos q2(w1, vcc, nx[3]);
     pmos q3(w2, w1, x[3]); pmos q4(w2, w1, nx[2]); pmos q5(w2, w1, nx[0]);
     pmos q6(y, w2, x[3]); pmos q7(y, w2, nx[1]);
     nmos q8(y, w3, x[0]); nmos q9(w3, gnd, nx[3]);
     nmos q10(y, w4, x[3]); nmos q11(w4, w5, nx[2]); nmos q12(w5, gnd, nx[0]);
     nmos q13(y, w6, x[3]); nmos q14(w6, gnd, nx[1]);

    end
   else if(Realization == "Base_of_Pirs")
    begin
     nor(nx0, x[0], x[0]);
     nor(nx1, x[1], x[1]);
     nor(nx2, x[2], x[2]);
     nor(nx3, x[3], x[3]);
     nor(x0Vx3, x[0], x[3]);
     nor(x0Vnx1Vnx2, x[0], nx1, nx2);
     nor(nx0Vnx1Vnx3, nx0, nx1, nx3);
     nor(ny, x0Vx3, x0Vnx1Vnx2, nx0Vnx1Vnx3);
     nor(y, ny, ny);
    end
   else if(Realization == "Base_of_Sheffer")
    begin
     nand(nx0, x[0], x[0]);
     nand(nx3, x[3], x[3]);
     nand(NX0xNX3, nx0, nx3);
     nand(NX0xX1xX2, nx0, x[1], x[2]);
     nand(X0xX1xX3, x[0], x[1], x[3]);
     nand(y, NX0xNX3, NX0xX1xX2, X0xX1xX3);
     
    end
   else if(Realization == "Base_of_Zhegalkin")
    begin
     and(X3xX2xX1, x[3], x[2], x[1]);
     and(X3xX2xX1xX0, X3xX2xX1, x[0]);
     and(X3xX1xX0, x[3], x[1], x[0]);
     and(X3xX0, x[3], x[0]);
     xor(y, 1, x[0], x[3], X3xX0, X3xX1xX0, X3xX2xX1, X3xX2xX1xX0); 
    end
   else if(Realization == "PZU")
    begin
     wire [3:0] nx;
     wire [15:0] m;
     wire ny;

     for (j = 0; j < 4; j = j + 1)
      begin
       pmos (nx[j], vcc, x[j]);
       nmos (nx[j],gnd, x[j]);
      end

     rnmos(m[0],vcc, vcc);
     rnmos(m[2],vcc, vcc);
     rnmos(m[4],vcc, vcc);
     rnmos(m[6],vcc, vcc);
     rnmos(m[11],vcc, vcc);
     rnmos(m[14],vcc, vcc);
     rnmos(m[15],vcc, vcc);

     nmos (m[0],gnd, x[3]);  nmos (m[0],gnd, x[2]);  nmos (m[0],gnd, x[1]);  nmos (m[0],gnd, x[0]); 
     nmos (m[2],gnd, x[3]);  nmos (m[2],gnd, x[2]);  nmos (m[2],gnd, nx[1]); nmos (m[2],gnd, x[0]);
     nmos (m[4],gnd, x[3]);  nmos (m[4],gnd, nx[2]); nmos (m[4],gnd, x[1]);  nmos (m[4],gnd, x[0]);
     nmos (m[6],gnd, x[3]);  nmos (m[6],gnd, nx[2]); nmos (m[6],gnd, nx[1]); nmos (m[6],gnd, x[0]);
     nmos (m[11],gnd,nx[3]); nmos (m[11],gnd, x[2]); nmos (m[11],gnd,nx[1]); nmos (m[11],gnd,nx[0]);
     nmos (m[14],gnd,nx[3]); nmos (m[14],gnd,nx[2]); nmos (m[14],gnd,nx[1]); nmos (m[14],gnd,x[0]);
     nmos (m[15],gnd,nx[3]); nmos (m[15],gnd,nx[2]); nmos (m[15],gnd,nx[1]); nmos (m[15],gnd,nx[0]);
 
     rnmos(ny, vcc, vcc);
     nmos(ny, gnd, m[0]);
     nmos(ny, gnd, m[2]);
     nmos(ny, gnd, m[4]);
     nmos(ny, gnd, m[6]);
     nmos(ny, gnd, m[11]);
     nmos(ny, gnd, m[14]);
     nmos(ny, gnd, m[15]);
     
     pmos(y, vcc, ny);
     nmos(y,gnd, ny);
     
    end
   else if(Realization == "With_third_condition")
    begin
     wire w1, w2, w3, w4, w5, w6, w7, w8, w9;
     reg en = 0;
     wire [3:0] nx;
     
     for (j = 0; j < 4; j = j + 1)
      begin
       pmos (nx[j], vcc, x[j]);
       nmos (nx[j],gnd, x[j]);
      end
     pmos q1(w1, w8, x[0]); pmos q2(w1, w8, nx[3]);
     pmos q3(w2, w1, x[3]); pmos q4(w2, w1, nx[2]); pmos q5(w2, w1, nx[0]);
     pmos q6(y, w2, x[3]); pmos q7(y, w2, nx[1]);
     nmos q8(y, w3, x[0]); nmos q9(w3, w9, nx[3]);
     nmos q10(y, w4, x[3]); nmos q11(w4, w5, nx[2]); nmos q12(w5, w9, nx[0]);
     nmos q13(y, w6, x[3]); nmos q14(w6, w9, nx[1]);
     nmos q15(w8, vcc, w7); nmos q18(w9, gnd, en);
     pmos q16(w7, vcc, en); nmos q17(w7, gnd, en);

    end 
   else if(Realization == "Primitives_of_MDNF")
    begin
     nand(nx0, x[0], x[0]);
     nand(nx3, x[3], x[3]);
     and(NX0xNX3, nx0, nx3);
     and(NX0xX1xX2, nx0, x[1], x[2]);
     and(X0xX1xX3, x[0], x[1], x[3]);
     or(y, NX0xNX3, NX0xX1xX2, X0xX1xX3);    
    end

endgenerate
endmodule
