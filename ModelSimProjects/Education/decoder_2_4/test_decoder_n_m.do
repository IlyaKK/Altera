vlib work
vlog decoder_N_M.v
vsim decoder_N_M
add wave -divider Time
add wave -expand /decoder_N_M/t
add wave -divider Input
add wave -expand /decoder_N_M/a
add wave -divider Output
add wave -expand /decoder_N_M/b
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {40ns}
run -all