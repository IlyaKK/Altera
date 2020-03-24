module i_encoder_4_2_function_if
 (
 input [3:0] a,
 output reg [1:0] b
 );

  function [1:0] dc;
   input [3:0] in;
      if      (in == 14) dc = 3;
      else if (in == 13) dc = 2;
      else if (in == 11) dc = 1;
      else if (in == 7) dc = 0;
      else              dc = 'bx;
   endfunction

 always @(a)
  begin
   b = dc(a);
  end

 endmodule
