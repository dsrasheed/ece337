// $Id: $
// File name:   counter.sv
// Created:     10/11/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: A counter that outputs high when it hits a 1000

module counter (
	input  clk, n_rst,
	input  cnt_up, clear,
	output one_k_samples
);

flex_counter #(.NUM_CNT_BITS(10)) count (
	.clk(clk), .n_rst(n_rst),
	.clear(clear), .count_enable(cnt_up), .rollover_val(10'd1000),
	.rollover_flag(one_k_samples)
);

endmodule
