vlib work
vlog binary_John_counter_tb.v
vsim binary_John_counter_tb
add wave -divider Time
add wave -expand /binary_John_counter_tb/clock
add wave -divider Count
add wave -expand /binary_John_counter_tb/count
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {800ns}
run -all