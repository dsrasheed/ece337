onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/clk
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/n_rst
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/load_buffer
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/packet_data
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/data_read
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/rx_data
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/data_ready
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/overrun_error
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/nxt_rx_data
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/nxt_overrun_error
add wave -noupdate -expand -group {UART RX Data Buffer} /tb_apb_uart_rx/DUT/uart/rx/nxt_data_ready
add wave -noupdate -expand -group {UART -> Slave Registers} /tb_apb_uart_rx/DUT/apb_inter/data_status
add wave -noupdate -expand -group {UART -> Slave Registers} /tb_apb_uart_rx/DUT/apb_inter/error_status
add wave -noupdate -expand -group {UART -> Slave Registers} /tb_apb_uart_rx/DUT/apb_inter/data
add wave -noupdate -expand -group {UART -> Slave Registers} /tb_apb_uart_rx/DUT/apb_inter/rx_data
add wave -noupdate -expand -group {UART -> Slave Registers} /tb_apb_uart_rx/DUT/apb_inter/prdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {16535 ps}
