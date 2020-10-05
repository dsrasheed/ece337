// $Id: $
// File name:   sr_9bit.sv
// Created:     10/4/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: 9-bit shift register to shift in data from serial_in

module sr_9bit (
	input clk, n_rst, shift_strobe, serial_in,
	output wire [7:0] packet_data,
	output wire stop_bit
);

flex_stp_sr #(.NUM_BITS(9), .SHIFT_MSB(0)) sr (
	.clk(clk), 
	.n_rst(n_rst), 
	.shift_enable(shift_strobe), 
	.serial_in(serial_in), 
	.parallel_out({stop_bit, packet_data})
);

endmodule
