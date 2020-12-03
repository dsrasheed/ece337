// $Id: $
// File name:   pid_register.sv
// Created:     12/2/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Holds the pid of the most recently read packet

module pid_register (
    input clk, n_rst, pid_reset, pid_save,
    input [3:0] pid,
    output reg [3:0] rx_packet
);

reg [3:0] nxt_rx_packet;

always_comb begin
    nxt_rx_packet = rx_packet;

    if (pid_reset)
        nxt_rx_packet = '1;
    else if (pid_save)
        nxt_rx_packet = pid;
end

always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 1'b0)
        rx_packet <= '1;
    else
        rx_packet <= nxt_rx_packet;
end

endmodule