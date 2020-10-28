// $Id: $
// File name:   sync_low.sv
// Created:     9/15/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Sychronizes input to the clock

module sync_low(input clk, async_in, n_rst, output sync_out);

reg first;
reg second;

assign sync_out = second;

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 1'b0) begin
		first <= 0;
		second <= 0;
	end
	else begin
		first <= async_in;
		second <= first;
	end
end

endmodule
