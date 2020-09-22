onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label tb_test_num /tb_flex_counter/tb_test_num
add wave -noupdate -label tb_test_case /tb_flex_counter/tb_test_case
add wave -noupdate -expand -group {DUT input} -label tb_clk /tb_flex_counter/tb_clk
add wave -noupdate -expand -group {DUT input} -label tb_n_rst /tb_flex_counter/tb_n_rst
add wave -noupdate -expand -group {DUT input} -label tb_clear /tb_flex_counter/tb_clear
add wave -noupdate -expand -group {DUT input} -label tb_count_enable /tb_flex_counter/tb_count_enable
add wave -noupdate -expand -group {DUT input} -label tb_rollover_val -radix hexadecimal /tb_flex_counter/tb_rollover_val
add wave -noupdate -label tb_count_out -radix unsigned /tb_flex_counter/tb_count_out
add wave -noupdate -label tb_rollover_flag /tb_flex_counter/tb_rollover_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9873 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {21 ns}
