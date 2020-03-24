module ternary_i_encoder_4_2 (input reg [3:0] a, output reg [1:0] b);

always @(a or b)
 begin
  b = (a == 14) ? 3 :
      (a == 13) ? 2 :
      (a == 11) ? 1 :
      (a == 7) ? 0 : 'bx;
 end
endmodule
