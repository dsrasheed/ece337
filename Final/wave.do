onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_usb_rx/DUT/t/clk
add wave -noupdate -color Yellow /tb_usb_rx/DUT/ctrl/state
add wave -noupdate -expand -group Timer -radix binary /tb_usb_rx/DUT/d_edge
add wave -noupdate -expand -group Timer -color Blue /tb_usb_rx/two_behind
add wave -noupdate -expand -group Timer -color Blue /tb_usb_rx/one_behind
add wave -noupdate -expand -group Timer -radix binary /tb_usb_rx/DUT/d_plus_sync
add wave -noupdate -expand -group Timer -radix binary /tb_usb_rx/DUT/t/shift_enable
add wave -noupdate -expand -group Timer -radix binary /tb_usb_rx/DUT/bit_stuff_detector/bit_stuff_det
add wave -noupdate -expand -group Timer -color Blue /tb_usb_rx/stuff
add wave -noupdate -expand -group Timer -color Blue /tb_usb_rx/prev_was_stuff
add wave -noupdate -expand -group Timer -color Blue /tb_usb_rx/num_ones
add wave -noupdate -expand -group Timer /tb_usb_rx/DUT/d_orig
add wave -noupdate -expand -group Timer -radix binary /tb_usb_rx/DUT/t/byte_received
add wave -noupdate /tb_usb_rx/DUT/ctrl/rcving
add wave -noupdate /tb_usb_rx/DUT/ctrl/r_error
add wave -noupdate -expand -group Data -radix hexadecimal /tb_usb_rx/address
add wave -noupdate -expand -group Data -radix hexadecimal /tb_usb_rx/endpoint
add wave -noupdate -expand -group Data -radix hexadecimal /tb_usb_rx/packet_data
add wave -noupdate -expand -group Data -radix hexadecimal /tb_usb_rx/DUT/rcv_data
add wave -noupdate -expand -group Data /tb_usb_rx/DUT/ctrl/w_enable
add wave -noupdate -expand -group PID /tb_usb_rx/DUT/ctrl/pid_reset
add wave -noupdate -expand -group PID /tb_usb_rx/DUT/ctrl/pid_save
add wave -noupdate -expand -group PID /tb_usb_rx/DUT/pid/rx_packet
add wave -noupdate -radix binary /tb_usb_rx/DUT/d_minus_sync
add wave -noupdate -radix binary /tb_usb_rx/DUT/d_plus_sync
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34251776 ps} 0}
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
WaveRestoreZoom {32826246 ps} {35541940 ps}
