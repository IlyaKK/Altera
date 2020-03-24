`include "three_and.v"
`timescale 1ns/1ns
module three_and_tb ();
 reg [2:0] x = 0;
 wire y;

 three_and #(.Realization("tranif0"))
 fun1 (.x(x), .y(y));

initial begin
 $display("i x2 x1 x0  y");
 repeat (8) begin
 #5;
 $display("%d  %b  %b  %b  %b",
 x, x[2], x[1], x[0], y);
 x = x + 1;
 end
end
endmodule

