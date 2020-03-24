module Zhegalkn_decoder_2_4 (input [1:0] a, output reg [3:0] b);
supply1 vcc;
always @(a)
begin
b[0] = (a[1] & a[0] ^ a[1] ^ a[0]);
b[1] = (a[1] & a[0] ^ a[0] ^ vcc);
b[2] = (a[1] & a[0] ^ a[1] ^ vcc);
b[3] = (a[1] & a[0] ^ vcc);
end
endmodule
