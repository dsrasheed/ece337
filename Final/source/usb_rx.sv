// $Id: $
// File name:   usb_rx.sv
// Created:     12/2/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: USB Receiver Module

module usb_rx (
    input  wire clk, n_rst, d_plus, d_minus,
    output wire [3:0] rx_packet,
    output wire [6:0] address,
    output wire [3:0] endpoint,
    output wire [7:0] packet_data,
    output wire w_enable, rcving, r_error
);

wire d_plus_sync;
wire d_minus_sync;
wire d_edge;
wire bit_stuff_det;
wire shift_enable;
wire eop;
wire d_orig;
wire [23:0] rcv_data;
wire byte_received;
wire pid_reset;
wire pid_save;

sync_high sync_plus  (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));
sync_low  sync_minus (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));

edge_det edge_detector(.clk(clk), .n_rst(n_rst), .serial_in(d_plus_sync), .edge_detected(d_edge));

bit_stuff_det bit_stuff_detector (.clk(clk), .n_rst(n_rst), 
    .d_edge(d_edge), .shift_enable(shift_enable),
    .bit_stuff_det(bit_stuff_det)
);

eop_det eop_detector (.d_plus_sync(d_plus_sync), .d_minus_sync(d_minus_sync), .eop(eop));

decoder decode (.clk(clk), .n_rst(n_rst), 
    .d_plus_sync(d_plus_sync), .shift_enable(shift_enable), .eop(eop),
    .d_orig(d_orig)
);

stp_sr_24_lsb sr (.clk(clk), .n_rst(n_rst),
    .serial_in(d_orig), .shift_enable(shift_enable),
    .parallel_out(rcv_data)
);

timer t (.clk(clk), .n_rst(n_rst),
    .rcving(rcving), .d_edge(d_edge), .bit_stuff_det(bit_stuff_det),
    .shift_enable(shift_enable), .byte_received(byte_received)
);

pid_register pid (.clk(clk), .n_rst(n_rst),
    .pid_reset(pid_reset), .pid_save(pid_save), .pid(rcv_data[19:16]),
    .rx_packet(rx_packet)
);

rcu ctrl (.clk(clk), .n_rst(n_rst), 
    .d_edge(d_edge), .eop(eop), .shift_enable(shift_enable), .byte_received(byte_received), .rcv_data(rcv_data[23:16]),
    .pid_reset(pid_reset), .pid_save(pid_save), .rcving(rcving), .r_error(r_error), .w_enable(w_enable)
);

assign address = rcv_data[14:8];
assign endpoint = rcv_data[18:15];
assign packet_data = rcv_data[7:0];

endmodule