// $Id: $
// File name:   flex_counter.sv
// Created:     9/21/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Counter design with changeable maximum.

module flex_counter #(
	NUM_CNT_BITS = 3
)
(
	input  clk, n_rst, clear, count_enable,
	input  [NUM_CNT_BITS-1:0] rollover_val,
	output reg [NUM_CNT_BITS-1:0] count_out,
	output reg rollover_flag
);

reg [NUM_CNT_BITS-1:0] next_cnt;
reg next_rollover;

always_comb
begin
	if (clear == 1)
		next_cnt = 0;
	else if (count_enable == 1)
	begin
		if (count_out == rollover_val)
			next_cnt = 1;
		else
			next_cnt = count_out + 1;
	end
	else
		next_cnt = count_out;
end

always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
		count_out <= '0;
	else
		count_out <= next_cnt;
end

always_comb
begin
	if (next_cnt == rollover_val)
		next_rollover = 1;
	else
		next_rollover = 0;
end

always_ff @ (posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
		rollover_flag <= 0;
	else
		rollover_flag <= next_rollover;
end

endmodule
