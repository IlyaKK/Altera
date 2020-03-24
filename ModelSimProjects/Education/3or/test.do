vlib work
vlog three_or_tb.v
vsim three_or_tb
add wave -divider Input
add wave -expand /three_or_tb/x
add wave -divider Output
add wave -expand /three_or_tb/y
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {415ns}
run -all