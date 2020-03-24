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

module bin_counter (clock,q);
parameter Realization = "d-type";
localparam digits = 3;
input clock; output [digits-1:0] q;
genvar i;
generate
if (Realization == "rs-type") begin
reg [digits-1:0] r, s;
always @*
case (q)
'b000 : {r,s} = 'b??0001;
'b001 : {r,s} = 'b?01010;
'b010 : {r,s} = 'b?000?1;
'b011 : {r,s} = 'b011100;
'b100 : {r,s} = 'b000??1;
'b101 : {r,s} = 'b001?10;
'b110 : {r,s} = 'b0?0?01;
'b111 : {r,s} = 'b111000;
endcase
for (i = 0; i < digits; i = i + 1)
rsff rsffi (q[i],clock,r[i],s[i]);
end
else if (Realization == "jk-type")
begin
reg [digits-1:0] k, j;
always @*
case (q)
'b000 : {j,k} = 'b001???;
'b001 : {j,k} = 'b01???1;
'b010 : {j,k} = 'b0?1?0?;
'b011 : {j,k} = 'b1???11;
'b100 : {j,k} = 'b?010??;
'b101 : {j,k} = 'b?1?0?1;
'b110 : {j,k} = 'b??100?;
'b111 : {j,k} = 'b???111;
endcase
for (i = 0; i < digits; i = i + 1)
jkff jkffi (q[i],clock,j[i],k[i]);
end
else if (Realization == "d-type") begin
reg [digits-1:0] d;
always @*
case (q)
'b000 : d = 'b001;
'b001 : d = 'b010;
'b010 : d = 'b011;
'b011 : d = 'b100;
'b100 : d = 'b101;
'b101 : d = 'b110;
'b110 : d = 'b111;
'b111 : d = 'b000;
endcase
for (i = 0; i < digits; i = i + 1)
dff dffi (q[i],clock,d[i]);
end
else begin
reg [digits-1:0] t;
always @*
case (q)
'b000 : t = 'b001;
'b001 : t = 'b011;
'b010 : t = 'b001;
'b011 : t = 'b111;
'b100 : t = 'b001;
'b101 : t = 'b011;
'b110 : t = 'b001;
'b111 : t = 'b111;
endcase
for (i = 0; i < digits; i = i + 1)
tff tffi (q[i],clock,t[i]);
end
endgenerate
endmodule

`timescale 1ns/1ns
module bin_counter_tb ();
reg clock = 0;
wire [2:0] b [0:3];

bin_counter
#("rs-type") bc0 (clock,b[0]);

bin_counter
#("jk-type") bc1 (clock,b[1]);

bin_counter
#("d-type") bc2 (clock,b[2]);

bin_counter
#("t-type") bc3 (clock,b[3]);

initial
repeat (30) #5 clock = ~clock;
endmodule
