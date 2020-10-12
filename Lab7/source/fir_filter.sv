// $Id: $
// File name:   fir_filter.sv
// Created:     10/11/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Top Level block for 4-Point FIR Filter

module fir_filter (
    input  wire        clk, n_reset,
    input  wire [15:0] sample_data, fir_coefficient,
    input  wire        load_coeff, data_ready,
    output wire        one_k_samples, modwait,
    output wire [15:0] fir_out,
    output wire        err
);

wire dr, lc, overflow, cnt_up, clear;
wire [2:0] op;
wire [3:0] src1;
wire [3:0] src2;
wire [3:0] dest;
wire [16:0] outreg_data;

sync_low sync_dr (.clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(dr));
sync_low sync_lc (.clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(lc));

controller ctrllr (
    .clk(clk), .n_rst(n_reset), 
    .dr(dr), .lc(lc), .overflow(overflow),
    .cnt_up(cnt_up), .clear(clear), .modwait(modwait), 
    .op(op), .src1(src1), .src2(src2), .dest(dest), 
    .err(err)
);

counter count (
    .clk(clk), .n_rst(n_reset), 
    .clear(clear), .cnt_up(cnt_up),
    .one_k_samples(one_k_samples)
);

datapath computer (
    .clk(clk), .n_reset(n_reset),
    .op(op), .src1(src1), .src2(src2), .dest(dest),
    .ext_data1(sample_data), .ext_data2(fir_coefficient),
    .outreg_data(outreg_data),
    .overflow(overflow)
);

magnitude mag (.in(outreg_data), .out(fir_out));

endmodule