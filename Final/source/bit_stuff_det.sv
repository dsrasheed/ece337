// $Id: $
// File name:   bit_stuff_det.sv
// Created:     12/2/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Detects when the next bit is a stuff bit

module bit_stuff_det (
	input clk, n_rst, d_edge, shift_enable,
	output bit_stuff_det
);

flex_counter #(.NUM_CNT_BITS(3)) bit_cnt (
	.clk(clk), .n_rst(n_rst),
	.clear(d_edge | bit_stuff_det),
	.count_enable(shift_enable),
	.rollover_val(3'd6),
	.rollover_flag(bit_stuff_det)
);

endmodule
