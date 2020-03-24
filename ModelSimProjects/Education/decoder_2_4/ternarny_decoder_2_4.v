`define F 4'b1111
`define E 4'b1110
`define D 4'b1101
`define B 4'b1011
`define SEVEN 4'b0111
module ternarny_decoder_2_4 (input reg [1:0] a, output reg [3:0] b);

always @(a or b)
begin
{b[3], b[2], b[1], b[0]} =
({a[1], a[0]} == 2'b00) ? `E :
({a[1], a[0]} == 2'b01) ? `D :
({a[1], a[0]} == 2'b10) ? `B :
({a[1], a[0]} == 2'b11) ? `SEVEN :
`F ;
end
endmodule
