module case_i_encoder_4_2 (input [3:0] a, output reg [1:0] b);

always @*
 case (a)
  14 : b = 3;
  13 : b = 2;
  11 : b = 1;
  7 : b = 0;
  default b = 'bx;
 endcase

endmodule
