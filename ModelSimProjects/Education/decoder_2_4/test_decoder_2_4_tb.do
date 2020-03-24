vlib work
vlog decoder_2_4_tb.v
vsim decoder_2_4_tb
add wave -divider Input
add wave -expand /decoder_2_4_tb/a
add wave -divider Output
add wave -expand /decoder_2_4_tb/b
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {415ns}
run -all