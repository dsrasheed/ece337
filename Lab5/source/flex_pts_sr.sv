// $Id: $
// File name:   flex_pts_sr.sv
// Created:     9/27/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: A parallel to serial shift register with a paramaterized number of storage bits

module flex_pts_sr #(
	NUM_BITS = 4,
	SHIFT_MSB = 1
)
(
	input wire clk, n_rst, shift_enable, load_enable,
	input [NUM_BITS-1:0] parallel_in,
	output wire serial_out
);

reg [NUM_BITS-1:0] Q;
reg [NUM_BITS-1:0] next_Q;

always_comb
begin
	next_Q = Q;
	if (load_enable == 1'b1)
		next_Q = parallel_in;
	else if (shift_enable == 1'b1)
	begin
		if (SHIFT_MSB == 1'b1)
			next_Q = {Q[NUM_BITS-2:0], 1'b1};
		else
			next_Q = {1'b1, Q[NUM_BITS-1:1]};
	end
end

always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 1'b0)
		Q <= '1;
	else
		Q <= next_Q;
end

assign serial_out = SHIFT_MSB == 1'b1 ? Q[NUM_BITS-1] : Q[0];

endmodule
