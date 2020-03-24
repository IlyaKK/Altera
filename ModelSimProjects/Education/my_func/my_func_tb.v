`include "my_func.v"
`timescale 1ns/1ns
module my_func_tb ();
 reg [3:0] x = 0;
 wire [6:0] y;

 my_func #(.Realization("Transistors"))fun1 (.x(x), .y(y[6]));
 my_func #(.Realization("Base_of_Pirs"))fun2 (.x(x), .y(y[5]));
 my_func #(.Realization("Base_of_Sheffer"))fun3 (.x(x), .y(y[4]));
 my_func #(.Realization("Base_of_Zhegalkin"))fun4 (.x(x), .y(y[3]));
 my_func #(.Realization("PZU"))fun5 (.x(x), .y(y[2]));
 my_func #(.Realization("With_third_condition"))fun6 (.x(x), .y(y[1]));
 my_func #(.Realization("Primitives_of_MDNF"))fun7 (.x(x), .y(y[0]));


initial begin
 $display(" i x3 x2 x1 x0  y1  y2  y3  y4  y5  y6  y7");
 repeat (16) begin
 #5;
 $display("%d  %b  %b  %b  %b   %b   %b   %b   %b   %b   %b   %b",
 x, x[3], x[2], x[1], x[0], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);
 x = x + 1;
 end
end
endmodule
