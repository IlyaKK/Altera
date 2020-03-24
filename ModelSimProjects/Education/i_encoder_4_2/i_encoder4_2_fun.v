module i_encoder4_2_fun (a,b);
 parameter SIZE = 2;
 input [2**SIZE-1:0] a;
 output [SIZE-1:0] b;

 function integer flog2;
  input integer number;
  integer tmp;

  if ((~number == 0)||(~number == 1))
   flog2 = 0;
  else
   begin
    tmp =1;
    while (2**tmp <= ~number)
     tmp = tmp + 1;
    flog2 = tmp - 1;
   end

 endfunction

 function integer cd;
  input integer a;
  integer shift;
  begin
   shift = flog2(a);
   cd = (~a == 2**shift) ? shift : 'bx;
  end
 endfunction

 assign b = ~cd(a);

endmodule

