// $Id: $
// File name:   flex_stp_str.sv
// Created:     9/27/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: A serial to parallel register with a flexible number of storage bits.

module flex_stp_sr #(
	NUM_BITS = 4,
	SHIFT_MSB = 1
)
(
	input wire clk, n_rst, shift_enable, serial_in,
	output wire [NUM_BITS-1:0] parallel_out
);

reg [NUM_BITS-1:0] Q;
reg [NUM_BITS-1:0] next_Q;

always_comb
begin
	next_Q = Q;
	if (shift_enable)
	begin
		if (SHIFT_MSB == 1'b1)
			next_Q = {Q[NUM_BITS-2:0], serial_in};
		else
			next_Q = {serial_in, Q[NUM_BITS-1:1]};
	end
end

always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
		Q <= '1;
	else
		Q <= next_Q;
end

assign parallel_out = Q;

endmodule
