`include "cmos_i_encoder_4_2.v"
`include "Pearce_i_encoder_4_2.v"
`include "Sheffer_i_encoder_4_2.v"
`include "Zhegalkin_i_encoder_4_2.v"
`include "ternary_i_encoder_4_2.v"
`include "case_i_encoder_4_2.v"
`include "i_encoder_4_2_function_if.v"

module i_encoder_4_2_top (input [3:0] a, output [1:0] b);
parameter select = "Ternarny";
generate
if (select == "CMOS")
cmos_i_encoder_4_2 dc1 (.a(a), .b(b));
if (select == "Pearce")
Pearce_i_encoder_4_2 dc1 (.a(a), .b(b));
if (select == "Sheffer")
Sheffer_i_encoder_4_2 dc1 (.a(a), .b(b));
if (select == "Zhegalkin")
Zhegalkin_i_encoder_4_2 dc1 (.a(a), .b(b));
if (select == "Ternary")
ternary_i_encoder_4_2 dc1 (.a(a), .b(b));
if (select == "Case")
case_i_encoder_4_2 dc1 (.a(a), .b(b));
if (select == "Func_if")
i_encoder_4_2_function_if dc1 (.a(a), .b(b));

endgenerate
endmodule
