// $Id: $
// File name:   decoder.sv
// Created:     12/2/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Decodes an NRZI encoded bit stream

module decoder (
	input clk, n_rst, d_plus_sync, shift_enable, eop,
	output d_orig
);

reg nxt_prev;
reg prev;

always_comb begin
	nxt_prev = prev;
	if (eop)
		nxt_prev = 1'b1;
	else if (shift_enable)
		nxt_prev = d_plus_sync;
end

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 1'b0)
		prev = 1'b1;
	else
		prev = nxt_prev;
end

assign d_orig = ~(d_plus_sync ^ prev);

endmodule
