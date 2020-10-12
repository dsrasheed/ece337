onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fir_filter/tb_clk
add wave -noupdate /tb_fir_filter/DUT/ctrllr/modwait
add wave -noupdate -expand -group Sample -radix binary /tb_fir_filter/DUT/dr
add wave -noupdate -expand -group Sample -radix unsigned /tb_fir_filter/tb_sample
add wave -noupdate -expand -group Coefficient -radix binary /tb_fir_filter/DUT/lc
add wave -noupdate -expand -group Coefficient -radix decimal /tb_fir_filter/tb_coeff
add wave -noupdate -expand -group Coefficient {/tb_fir_filter/DUT/computer/RF/regs_matrix[9]}
add wave -noupdate -expand -group Coefficient {/tb_fir_filter/DUT/computer/RF/regs_matrix[8]}
add wave -noupdate -expand -group Coefficient {/tb_fir_filter/DUT/computer/RF/regs_matrix[7]}
add wave -noupdate -expand -group Coefficient {/tb_fir_filter/DUT/computer/RF/regs_matrix[6]}
add wave -noupdate -expand -group Error /tb_fir_filter/tb_expected_err
add wave -noupdate -expand -group Error /tb_fir_filter/DUT/ctrllr/err
add wave -noupdate -expand -group {Register 0} {/tb_fir_filter/DUT/computer/RF/regs_matrix[0]}
add wave -noupdate -expand -group {Register 0} -radix decimal /tb_fir_filter/DUT/outreg_data
add wave -noupdate -expand -group {Register 0} -radix unsigned /tb_fir_filter/tb_fir_out
add wave -noupdate -expand -group {Register 0} -radix unsigned /tb_fir_filter/tb_expected_fir_out
add wave -noupdate /tb_fir_filter/DUT/ctrllr/state
add wave -noupdate -expand -group {Datapath Controls} -radix unsigned /tb_fir_filter/DUT/ctrllr/op
add wave -noupdate -expand -group {Datapath Controls} -radix unsigned /tb_fir_filter/DUT/ctrllr/src1
add wave -noupdate -expand -group {Datapath Controls} -radix unsigned /tb_fir_filter/DUT/ctrllr/src2
add wave -noupdate -expand -group {Datapath Controls} -radix unsigned /tb_fir_filter/DUT/ctrllr/dest
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {520228 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {5 ns} {2105 ns}
