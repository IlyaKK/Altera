`timescale 1ns/1ns
//`include "encoder4_2_fun.v"
module icoderM_N_tb ();
localparam M = 4; // Parameter M
reg [2**M-1:0] a;
reg [2**M-1:0] na;
reg [M-1:0] b;
integer i;

function integer flog2;
input integer number;
integer tmp;

if ((number == 0) || (number == 1))
flog2 = 0;
else
begin
tmp = 1;
while (2**tmp <= number)
tmp = tmp + 1;
flog2 = tmp - 1;
end
endfunction

function integer cd;
input integer a;
integer shift;

begin
shift = flog2(a);
cd = (a == (2**shift)) ? ~shift : 'bx;
end
endfunction
initial 
begin
for (i = 0; i < 2**M; i = i + 1)
begin
a = ~(2**i);
na = ~a;
assign b = cd(na);
$strobe("a = %016b, b = %04b", a, b);
#50;
end
//$stop(2);
end

endmodule
