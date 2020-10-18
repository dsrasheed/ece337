onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_rcv_block/DUT/shift_strobe
add wave -noupdate /tb_rcv_block/DUT/bit_period
add wave -noupdate /tb_rcv_block/DUT/data_size
add wave -noupdate /tb_rcv_block/DUT/rx_data
add wave -noupdate /tb_rcv_block/DUT/packet_done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {234 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1 ns}
