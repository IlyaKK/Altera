`include "cmos_decoder_2_4.v"
`include "Pirs_decoder_2_4.v"
`include "sheffer_decoder_2_4.v"
`include "Zhegalkn_decoder_2_4.v"
`include "ternarny_decoder_2_4.v"
`include "case_decoder_2_4.v"
`include "decoder2_4_function_if.v"

module decoder2_4_top (input [1:0] a, output [3:0] b);
parameter select = "Ternarny";
generate
if (select == "CMOS")
cmos_decoder_2_4 dc1 (.a(a), .b(b));
if (select == "Base_of_Pirs")
Pirs_decoder_2_4 dc1 (.a(a), .b(b));
if (select == "Sheffer")
sheffer_decoder_2_4 dc1 (.a(a), .b(b));
if (select == "Zhegalkin")
Zhegalkn_decoder_2_4 dc1 (.a(a), .b(b));
if (select == "Ternarny")
ternarny_decoder_2_4 dc1 (.a(a), .b(b));
if (select == "Case")
case_decoder_2_4 dc1 (.a(a), .b(b));
if (select == "Func_and_if")
decoder2_4_function_if dc1 (.a(a), .b(b));

endgenerate
endmodule
