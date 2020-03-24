vlib work
vlog decoder_3_6_tb.v
vsim decoder_3_6_tb
add wave -divider Time
add wave -expand /decoder_3_6_tb/t
add wave -divider a
add wave -expand /decoder_3_6_tb/a
add wave -divider b
add wave -expand /decoder_3_6_tb/b
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {35ns}
run -all