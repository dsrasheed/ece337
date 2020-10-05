// $Id: $
// File name:   timer.sv
// Created:     10/4/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Produces shift enable pulses for reading in the data and informs the RCU
// when 10 bits have been read (1 Start Bit, 8 Data Bits, 1 Stop Bit).

module timer(
	input clk, n_rst, enable_timer,
	output shift_enable, packet_done
);

wire [3:0] count;
assign shift_enable = count == 2;

flex_counter #(.NUM_CNT_BITS(4)) clkdiv (
	.clk(clk),
	.n_rst(n_rst),
	.clear(~enable_timer),
	.count_enable(enable_timer),
	.rollover_val(4'd10),
	.count_out(count)
);

flex_counter #(.NUM_CNT_BITS(4)) bitcnt (
	.clk(clk),
	.n_rst(n_rst),
	.clear(~enable_timer),
	.count_enable(shift_enable),
	.rollover_val(4'd10),
	.rollover_flag(packet_done)
);

endmodule
