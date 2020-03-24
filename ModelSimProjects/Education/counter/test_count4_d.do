vlib work
vlog PulseGenerator_tb.v
vsim PulseGenerator_tb
add wave -divider Time
add wave -expand /PulseGenerator_tb/Clock
add wave -divider Button_Up
add wave -expand /PulseGenerator_tb/Button_Up
add wave -divider Button_Down
add wave -expand /PulseGenerator_tb/Button_Down
add wave -divider Button_Sign
add wave -expand /PulseGenerator_tb/Button_Sign
add wave -divider State
add wave -expand /PulseGenerator_tb/PulseGenerator/State
add wave -divider Up
add wave -expand /PulseGenerator_tb/Up
add wave -divider Down
add wave -expand /PulseGenerator_tb/Down
add wave -divider Sign
add wave -expand /PulseGenerator_tb/Sign
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {0ps} {800ns}
run -all