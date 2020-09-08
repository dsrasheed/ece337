// $Id: $
// File name:   adder_4bit.sv
// Created:     9/5/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: 4-bit Full Adder

module adder_4bit(input [3:0] a, b, wire carry_in, output overflow, [3:0] sum);

wire [4:0] carrys;
genvar i;

assign carrys[0] = carry_in;
assign overflow = carrys[4];

generate
for (i = 0; i < 4; i = i + 1) begin
	adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), 
		.carry_out(carrys[i+1]), .sum(sum[i]));
end
endgenerate

endmodule
