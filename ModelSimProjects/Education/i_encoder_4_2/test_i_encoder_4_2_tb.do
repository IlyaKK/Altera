vlib work
vlog i_encoder_4_2_tb.v
vsim i_encoder_4_2_tb
add wave -divider Time
add wave -expand /i_encoder_4_2_tb/t
add wave -divider a
add wave -expand /i_encoder_4_2_tb/a
add wave -divider b
add wave -expand /i_encoder_4_2_tb/b
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {300ns}
run -all