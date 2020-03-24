module pi_encoderM_N_fun (a,b);
 parameter SIZE = 2;
 input [2**SIZE-1:0] a;
 output [SIZE-1:0] b;
 
 function integer prcd;
  input [2**SIZE-1:0] in;
  integer i;
   begin : fun
    prcd = 'b0;
    for (i = 2**SIZE-1; i >= 0; i = i - 1)
     if (in[i] == 1'b1) begin
      prcd = i;
      disable fun;
     end
   end
 endfunction

assign b = ~prcd(a);
endmodule
