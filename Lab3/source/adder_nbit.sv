// $Id: $
// File name:   adder_nbit.sv
// Created:     9/5/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: An n-bit ripple carry adder

`timescale 1ns / 100ps

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

always @ (a, b, carry_in)
begin
	assert (carry_in == 1 || carry_in == 0)
	else $error("Input 'carry_in' is not a 1 or 0");

	for (int i = 0; i < BIT_WIDTH; i++)
	begin
		assert (a[i] == 0 || a[i] == 1)
		else $error("Input 'a' is not a 1 or 0");

		assert (b[i] == 0 || b[i] == 1)
		else $error("Input 'b' is not a 1 or 0");
	end
end

genvar i;

logic exp_sum;
logic exp_carry_out;

generate
for (i = 0; i < BIT_WIDTH; i = i + 1)
begin
	adder_1bit IX(.a(a[i]), .b(b[i]), .sum(sum[i]), 
		.carry_in(carrys[i]), .carry_out(carrys[i+1]));
	
	always @ (a[i], b[i], carrys[i])
	begin
		{exp_carry_out,exp_sum} = a[i] + b[i] + carrys[i];

		assert (sum[i] == exp_sum)
		else $error("Output 'sum' of a 1-bit adder is incorrect");

		assert (carrys[i+1] == exp_carry_out)
		else $error("Output 'carry_out' of 1-bit adder is incorrect");
	end
end
endgenerate

/*
logic exp_sum;
logic exp_overflow;

always @ (a[0], b[0], carrys[0])
begin
	for (int i = 0; i < BIT_WIDTH; i++)
	begin
		{exp_carry_out, exp_sum} = a[i] + b[i] + carrys[i];

		#(2)

		assert (exp_sum == sum[i])
		else $error("Output 'sum' 
	end
end
*/
endmodule
