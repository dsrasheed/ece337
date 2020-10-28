// $Id: $
// File name:   apb_uart_rx.sv
// Created:     10/18/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: APB Compatible UART Receiver.

module apb_uart_rx (
    input clk, n_rst, serial_in, psel, penable, pwrite,
    [2:0] paddr, 
    [7:0] pwdata,
    output pslverr, [7:0] prdata
);

wire data_read;
wire overrun_error;
wire framing_error;
wire data_ready;
wire [7:0] rx_data;
wire [13:0] bit_period;
wire [3:0] data_size;

apb_slave apb_inter (.clk(clk), .n_rst(n_rst),
    .psel(psel), .penable(penable), .pwrite(pwrite), .paddr(paddr), .pwdata(pwdata), .prdata(prdata), .pslverr(pslverr),
    .data_ready(data_ready), .overrun_error(overrun_error), .framing_error(framing_error), .rx_data(rx_data),
    .data_read(data_read), .bit_period(bit_period), .data_size(data_size)
);

rcv_block uart (.clk(clk), .n_rst(n_rst),
    .serial_in(serial_in), .bit_period(bit_period), .data_size(data_size), .data_read(data_read),
    .overrun_error(overrun_error), .framing_error(framing_error), .data_ready(data_ready), .rx_data(rx_data)
);

endmodule