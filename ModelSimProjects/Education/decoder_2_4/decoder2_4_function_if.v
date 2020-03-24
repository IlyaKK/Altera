module decoder2_4_function_if
 (
 input [1:0] a,
 output reg [3:0] b
 );

  function [3:0] dc;
   input [1:0] in;
      if (in == 0)      dc = 4'b1110;
      else if (in == 1) dc = 4'b1101;
      else if (in == 2) dc = 4'b1011;
      else if (in == 3) dc = 4'b0111;
      else dc = 'bx;
   endfunction

 always @(a)
  begin
   b = dc(a);
  end

 endmodule
