module Zhegalkn_decoder_3_6 (input [2:0] a, output reg [5:0] b);
supply1 vcc;
always @(a)
 begin
  b[0]=1^a[0]^a[1]^(a[1]&a[0])^a[2]^(a[2]&a[0]);
  b[1]=a[0]^(a[1]&a[0])^(a[2]&a[0]);
  b[2]=a[1]^(a[1]&a[0]);
  b[3]=a[1]&a[0];
  b[4]=a[2]^(a[2]&a[0]);
  b[5]=a[2]&a[0];
 end
endmodule
