vlib work
vlog my_func_tb.v
vsim my_func_tb
add wave -divider Input
add wave -expand /my_func_tb/x
add wave -divider Output
add wave -expand /my_func_tb/y
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {415ns}
run -all