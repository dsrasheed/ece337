// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     10/26/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite Slave Interface for FIR Filter

module ahb_lite_fir_filter (
    input         clk, n_rst,
    input         hsel,
    input  [3:0]  haddr,
    input         hsize,
    input  [1:0]  htrans,
    input         hwrite,
    input  [15:0] hwdata,
    output [15:0] hrdata,
    output        hresp
);

wire [15:0] fir_out;
wire error;
wire data_ready;
wire [15:0] sample_data;
wire modwait;
wire new_coefficient_set;
wire load_coeff;
wire [1:0] coefficient_num;
wire [15:0] fir_coefficient;

fir_filter fir (
    .clk(clk), .n_reset(n_rst),
    .sample_data(sample_data), .fir_coefficient(fir_coefficient),
    .load_coeff(load_coeff), .data_ready(data_ready),
    .modwait(modwait),
    .fir_out(fir_out),
    .err(error)
);

coefficient_loader coeff_loader (
    .clk(clk), .n_rst(n_rst),
    .new_coefficient_set(new_coefficient_set),
    .modwait(modwait),
    .load_coeff(load_coeff),
    .coefficient_num(coefficient_num)
);

ahb_lite_slave ahb_slv_interface (
    .clk(clk), .n_rst(n_rst),
    .data_ready(data_ready), .sample_data(sample_data),
    .new_coefficient_set(new_coefficient_set), .fir_coefficient(fir_coefficient), .coefficient_num(coefficient_num),
    .modwait(modwait), .fir_out(fir_out), .err(error),
    .hsel(hsel), .haddr(haddr), .hsize(hsize), .htrans(htrans), .hwrite(hwrite), .hwdata(hwdata), .hrdata(hrdata), .hresp(hresp)
);

endmodule