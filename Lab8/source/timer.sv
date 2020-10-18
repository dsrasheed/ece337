// $Id: $
// File name:   timer.sv
// Created:     10/4/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Produces shift enable pulses for reading in the data and informs the RCU
// when 10 bits have been read (1 Start Bit, 8 Data Bits, 1 Stop Bit).

module timer(
	input              clk, n_rst, enable_timer,
	input  wire [13:0] bit_period,
	input  wire [3:0]  data_size,
	output logic       shift_enable,
	output wire	   packet_done
);

wire [13:0] count;

always_comb begin
	if (bit_period < 15)
		shift_enable = count == 4'd2;
	else if (bit_period < 30)
		shift_enable = count == 4'd8;
	else
		shift_enable = count == (bit_period >> 2);
end


flex_counter #(.NUM_CNT_BITS(14)) clkdiv (
	.clk(clk),
	.n_rst(n_rst),
	.clear(~enable_timer),
	.count_enable(enable_timer),
	.rollover_val(bit_period),
	.count_out(count)
);

flex_counter #(.NUM_CNT_BITS(4)) bitcnt (
	.clk(clk),
	.n_rst(n_rst),
	.clear(~enable_timer),
	.count_enable(shift_enable),
	.rollover_val(data_size + 4'd2),
	.rollover_flag(packet_done)
);

endmodule
