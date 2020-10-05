// $Id: $
// File name:   rcv_block.sv
// Created:     10/4/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Top level module for UART Receiver

module rcv_block (
	input clk, n_rst, serial_in, data_read,
	output wire [7:0] rx_data,
	output wire data_ready, overrun_error, framing_error
);

wire start_bit_detected;
wire enable_timer;
wire packet_done;
wire shift_strobe;
wire stop_bit;
wire sbc_clear;
wire sbc_enable;
wire load_buffer;
wire [7:0] packet_data;

sr_9bit sr_in (.clk(clk), .n_rst(n_rst), 
	.shift_strobe(shift_strobe), .serial_in(serial_in), 
	.packet_data(packet_data), .stop_bit(stop_bit));

rx_data_buff rx (.clk(clk), .n_rst(n_rst), 
	.load_buffer(load_buffer), .packet_data(packet_data), .data_read(data_read), 
	.rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error));

start_bit_det startdet (.clk(clk), .n_rst(n_rst), 
	.serial_in(serial_in),
	.start_bit_detected(start_bit_detected));

stop_bit_chk stopchk (.clk(clk), .n_rst(n_rst),
	.sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .stop_bit(stop_bit),
	.framing_error(framing_error));

timer TCU (.clk(clk), .n_rst(n_rst),
	.enable_timer(enable_timer),
	.shift_enable(shift_strobe), .packet_done(packet_done));

rcu RCU (.clk(clk), .n_rst(n_rst),
	.start_bit_detected(start_bit_detected), .packet_done(packet_done), .framing_error(framing_error),
	.sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), .enable_timer(enable_timer));


endmodule
