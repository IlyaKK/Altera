vlib work
vlog poved_decoder_3_6_tb.v
vsim poved_decoder_3_6_tb
add wave -divider Time
add wave -expand /poved_decoder_3_6_tb/t
add wave -divider a
add wave -expand /poved_decoder_3_6_tb/a
add wave -divider b
add wave -expand /poved_decoder_3_6_tb/b
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {305ns}
run -all