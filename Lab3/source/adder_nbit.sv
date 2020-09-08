// $Id: $
// File name:   adder_nbit.sv
// Created:     9/5/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: An n-bit ripple carry adder

module adder_nbit
#(
	BIT_WIDTH = 4
)
(
	input  [BIT_WIDTH-1:0] a, b,
	input  wire carry_in,
	output wire overflow,
	output [BIT_WIDTH-1:0] sum
);

wire [BIT_WIDTH:0] carrys;
assign carrys[0] = carry_in;
assign overflow  = carrys[BIT_WIDTH];

genvar i;

generate
for (i = 0; i < BIT_WIDTH; i = i + 1)
begin
	adder_1bit IX(.a(a[i]), .b(b[i]), .sum(sum[i]), 
		.carry_in(carrys[i]), .carry_out(carrys[i+1]));
end
endgenerate

endmodule
