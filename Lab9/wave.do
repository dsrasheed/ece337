onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_slave/DUT/clk
add wave -noupdate -expand -group {AHB Control} -radix binary /tb_ahb_lite_slave/DUT/hsel
add wave -noupdate -expand -group {AHB Control} -radix hexadecimal /tb_ahb_lite_slave/DUT/haddr
add wave -noupdate -expand -group {AHB Control} -radix binary /tb_ahb_lite_slave/DUT/hsize
add wave -noupdate -expand -group {AHB Control} -radix unsigned /tb_ahb_lite_slave/DUT/htrans
add wave -noupdate -expand -group {AHB Control} -radix binary /tb_ahb_lite_slave/DUT/hwrite
add wave -noupdate -expand -group {AHB Control} -radix hexadecimal /tb_ahb_lite_slave/DUT/hwdata
add wave -noupdate -expand -group {Write Select} /tb_ahb_lite_slave/DUT/wsel_even
add wave -noupdate -expand -group {Write Select} /tb_ahb_lite_slave/DUT/delay_wsel_even
add wave -noupdate -expand -group {Write Select} /tb_ahb_lite_slave/DUT/wsel_odd
add wave -noupdate -expand -group {Write Select} /tb_ahb_lite_slave/DUT/delay_wsel_odd
add wave -noupdate -expand -group {Sample Data Reg} -radix unsigned -childformat {{{/tb_ahb_lite_slave/DUT/sample_data[15]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[14]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[13]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[12]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[11]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[10]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[9]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[8]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[7]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[6]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[5]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[4]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[3]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[2]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[1]} -radix unsigned} {{/tb_ahb_lite_slave/DUT/sample_data[0]} -radix unsigned}} -subitemconfig {{/tb_ahb_lite_slave/DUT/sample_data[15]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[14]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[13]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[12]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[11]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[10]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[9]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[8]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[7]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[6]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[5]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[4]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[3]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[2]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[1]} {-height 16 -radix unsigned} {/tb_ahb_lite_slave/DUT/sample_data[0]} {-height 16 -radix unsigned}} /tb_ahb_lite_slave/DUT/sample_data
add wave -noupdate -expand -group {Sample Data Reg} -radix unsigned /tb_ahb_lite_slave/DUT/new_sample
add wave -noupdate -expand -group {Sample Data Reg} /tb_ahb_lite_slave/DUT/data_ready
add wave -noupdate -expand -group {Coefficient Regs} -radix hexadecimal /tb_ahb_lite_slave/DUT/F0
add wave -noupdate -expand -group {Coefficient Regs} -radix hexadecimal /tb_ahb_lite_slave/DUT/F1
add wave -noupdate -expand -group {Coefficient Regs} -radix hexadecimal /tb_ahb_lite_slave/DUT/F2
add wave -noupdate -expand -group {Coefficient Regs} -radix hexadecimal /tb_ahb_lite_slave/DUT/F3
add wave -noupdate -expand -group {Read Select} -radix binary /tb_ahb_lite_slave/DUT/rsel_even
add wave -noupdate -expand -group {Read Select} -radix binary /tb_ahb_lite_slave/DUT/rsel_odd
add wave -noupdate -expand -group hrdata -radix hexadecimal /tb_ahb_lite_slave/DUT/upper
add wave -noupdate -expand -group hrdata -radix hexadecimal /tb_ahb_lite_slave/DUT/lower
add wave -noupdate -expand -group hrdata -radix hexadecimal /tb_ahb_lite_slave/DUT/nxt_hrdata
add wave -noupdate -expand -group hrdata -radix hexadecimal /tb_ahb_lite_slave/DUT/hrdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {225456 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 219
configure wave -valuecolwidth 135
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {262500 ps}
