vlib work
vlog three_and_tb.v
vsim three_and_tb
add wave -divider Input
add wave -expand /three_and_tb/x
add wave -divider Output
add wave -expand /three_and_tb/y
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {415ns}
run -all