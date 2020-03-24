module poved_decoder_3_6 (a,b);
 input [2:0] a;
 output reg [5:0] b;

always @*
  case (a)
    0 : b = 1;
    1 : b = 2;
    2 : b = 4;
    3 : b = 8;
    4 : b = 16;
    5 : b = 32;
    default b = 'bx;
  endcase
endmodule
