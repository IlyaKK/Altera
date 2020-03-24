`include "cmos_decoder_3_6.v"
`include "Pirs_decoder_3_6.v"
`include "sheffer_decoder_3_6.v"
`include "Zhegalkn_decoder_3_6.v"

module decoder3_6_top (input [2:0] a, output [5:0] b);
parameter select = "CMOS";
generate
if (select == "CMOS")
cmos_decoder_3_6 dc1 (.a(a), .b(b));
if (select == "Pearce")
Pirs_decoder_3_6 dc1 (.a(a), .b(b));
if (select == "Sheffer")
sheffer_decoder_3_6 dc1 (.a(a), .b(b));
if (select == "Zhegalkn")
Zhegalkn_decoder_3_6 dc1 (.a(a), .b(b));

endgenerate
endmodule
