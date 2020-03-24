module case_decoder_2_4 
(
input [1:0] a,
output reg [3:0] b
);

generate
 always @(a)
  begin
   case (a)
     2'b00 : b = 4'b1110;
     2'b01 : b = 4'b1101;
     2'b10 : b = 4'b1011;
     2'b11 : b = 4'b0111;
     default b = 'bx;
   endcase
  end
endgenerate
endmodule
