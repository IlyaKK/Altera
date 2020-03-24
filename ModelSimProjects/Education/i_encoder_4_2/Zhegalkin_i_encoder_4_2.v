module Zhegalkin_i_encoder_4_2
(
input wire [3:0] a,
output reg [1:0] b
);

always @(a)
  begin
    b[1]=1^a[3]^a[2];
    b[0]=1^a[1]^a[3];
  end

endmodule
