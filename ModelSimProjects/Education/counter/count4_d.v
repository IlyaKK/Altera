module dff (q,clk,d);
output reg q = 0;
input clk, d;

always @(posedge clk)
 q <= d;
endmodule

module tff (q,clk,t);
output reg q = 0;
input clk, t;
always @(posedge clk)
if (t) q <= ~q;
endmodule

module jkff (q,clk,j,k);
output reg q = 0;
input clk, j, k;
always @(posedge clk)
if (j && k) q <= ~q;
else if (j) q <= 1'b1;
else if (k) q <= 1'b0;
endmodule

module rsff (q,clk,r,s);
output reg q = 0;
input clk, r, s;
always @(posedge clk)
if (r && s) q <= 1'bx;
else if (s) q <= 1'b1;
else if (r) q <= 1'b0;
endmodule

module count4_d (clock,q);
parameter Realization = "d-type";
localparam digits = 5;
input clock; output [digits-1:0] q;
genvar i;
generate
if (Realization == "rs-type") begin
reg [digits-1:0] r, s;
always @*
case (q)
      0 : {r,s} = 'b????000001;
      1 : {r,s} = 'b???0100010;
      2 : {r,s} = 'b???00000?1;
      3 : {r,s} = 'b??01100100;
      4 : {r,s} = 'b??0?000?01;
      5 : {r,s} = 'b??00100?10;
      6 : {r,s} = 'b??00000??1;
      7 : {r,s} = 'b?011101000;
      8 : {r,s} = 'b?0??00?001;
      9 : {r,s} = 'b?0?010??10;
      10 : {r,s} ='b?0?000?0?1;
      11 : {r,s} ='b?00110?100;
      12 : {r,s} ='b?00?00??01;
      13 : {r,s} ='b?00010??10;
      14 : {r,s} ='b?00000???1;
      15 : {r,s} ='b001111?000;
      24 : {r,s}='b000????100;
      28 : {r,s}='b0000????10;
      30 : {r,s}='b00000????1;
      31 : {r,s}='b01000?0???;
      23 : {r,s}='b0?100?00??;
      19 : {r,s}='b0??10?000?;
      17 : {r,s}='b0???1?0000;
      16 : {r,s}='b1????00000;
endcase
for (i = 0; i < 5; i = i + 1)
rsff rsffi (q[i],clock,r[i],s[i]);
end
else if (Realization == "d-type") begin
 reg [4:0] d;
  always @*
    case(q)
      0:d='b00100;
      3 : d = 'b00100;
      4 : d = 'b00101;
      5 : d = 'b00110;
      6 : d = 'b00111;
      7 : d = 'b01000;
      8 : d = 'b01001;
      9 : d = 'b01010;
      10 : d ='b01011;
      11 : d ='b01100;
      12 : d ='b11100;
      13 : d ='b01110;
      14 : d ='b01111;
      15 : d ='b11111;
      31 : d ='b11110;
      30 : d ='b11101;
      29 : d ='b11100;
      28 : d ='b11011;
      27 : d ='b11010;
      26 : d ='b11001;
      25 : d ='b11000;
      24 : d ='b10111;
      23 : d ='b10110;
      22 : d ='b10101;
      21 : d ='b10100;
      20 : d ='b10011;
      19 : d ='b00011;
    endcase

   for (i = 0; i < 6; i = i + 1)
    dff dffi (q[i], clock, d[i]);
end
else if (Realization == "jk-type")
begin
reg [digits-1:0] k, j;
always @*
case (q)
     0 : {k,j} = 'b?????00001;
     1 : {k,j} = 'b????10001?;
     2 : {k,j} = 'b???0?000?1;
     3 : {k,j} = 'b???11001??; 
     4 : {k,j} = 'b??0??00?01;
     5 : {k,j} = 'b??0?100?1?;
     6 : {k,j} = 'b??00?00??1;
     7 : {k,j} = 'b??11101???;
     8 : {k,j} = 'b?0???0?001;
     9 : {k,j} = 'b?0??10?01?;
     10 : {k,j} = 'b?0?0?0?0?1;
     11 : {k,j} = 'b?0?110?1??;
     12 : {k,j} = 'b?00??0??01;
     13 : {k,j} = 'b?00?10??1?;
     14 : {k,j} = 'b?000?0???1;
     15 : {k,j} = 'b?01111????;
     24 : {k,j} = 'b00?????100;
     28 : {k,j} = 'b000?????10;
     30 : {k,j} = 'b0000?????1;
     31 : {k,j} = 'b01000?????;
     23 : {k,j} = 'b0?100?0???;
     19 : {k,j} = 'b0??10?00??;
     17 : {k,j} = 'b0???1?000?;
     16 : {k,j} = 'b1?????0000;

endcase
for (i = 0; i < digits; i = i + 1)
jkff jkffi (q[i],clock,j[i],k[i]);
end
else if (Realization == "t-type") begin
 reg [4:0] t;

  always @*
    case(q)
     0 : t = 'b00001;
     1 : t = 'b00011;
     2 : t = 'b00001;
     3 : t = 'b00111;
     4 : t = 'b00001;
     5 : t = 'b00011;
     6 : t = 'b00001;
     7 : t = 'b01111;
     8 : t = 'b00001;
     9 : t = 'b00011;
     10 :t = 'b00001;
     11 :t = 'b00111;
     12 :t = 'b00001;
     13 :t = 'b00011;
     14 :t = 'b00001;
     15 :t = 'b10111;
     24 :t = 'b00100;
     28 :t = 'b00010;
     30 :t = 'b00001;
     31 :t = 'b01000;
     23 :t = 'b00100;
     19 :t = 'b00010;
     17 :t = 'b00001;
     16 :t = 'b10000;
    endcase

   for (i = 0; i < digits; i = i + 1)
     tff tffi (q[i],clock,t[i]);
end
endgenerate
endmodule
