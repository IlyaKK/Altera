vlib work
vlog i_decoder_2_10.v
vsim i_decoder_2_10
add wave -divider Time
add wave -expand /i_decoder_2_10/t
add wave -divider Input
add wave -expand /i_decoder_2_10/a
add wave -divider Output
add wave -expand /i_decoder_2_10/b
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {55ns}
run -all