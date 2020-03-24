vlib work
vlog pi_encoderM_N_fun_tb.v
vsim pi_encoderM_N_fun_tb
add wave -divider Time
add wave -expand /pi_encoderM_N_fun_tb/t
add wave -divider a
add wave -expand /pi_encoderM_N_fun_tb/a
add wave -divider b
add wave -expand /pi_encoderM_N_fun_tb/b
configure wave -namecolwidth 90
configure wave -valuecolwidth 60
configure wave -justifyvalue right
WaveRestoreZoom {750 ps} {750 ns}
run -all