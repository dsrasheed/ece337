onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -label tb_test_case_num /tb_adder_16bit/tb_test_case_num
add wave -noupdate -color Gold -label tb_test_case /tb_adder_16bit/tb_test_case
add wave -noupdate -color Gold -label tb_test_case_err /tb_adder_16bit/tb_test_case_err
add wave -noupdate -divider {DUT Input Signals}
add wave -noupdate -label tb_a -radix hexadecimal /tb_adder_16bit/tb_a
add wave -noupdate -label tb_b -radix hexadecimal /tb_adder_16bit/tb_b
add wave -noupdate -label tb_carry_in -radix hexadecimal /tb_adder_16bit/tb_carry_in
add wave -noupdate -divider {DUT Output Signals}
add wave -noupdate -expand -group Sum -color Cyan -label tb_expected_sum -radix hexadecimal /tb_adder_16bit/tb_expected_sum
add wave -noupdate -expand -group Sum -color {Dark Orchid} -label tb_sum -radix hexadecimal /tb_adder_16bit/tb_sum
add wave -noupdate -expand -group Overflow -color Cyan -label tb_expected_overflow -radix hexadecimal /tb_adder_16bit/tb_expected_overflow
add wave -noupdate -expand -group Overflow -color {Blue Violet} -label tb_overflow -radix hexadecimal /tb_adder_16bit/tb_overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {132 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 195
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
WaveRestoreZoom {0 ps} {60031 ps}
