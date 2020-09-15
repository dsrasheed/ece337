// $Id: $
// File name:   adder_1bit
// Created:     9/4/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: 1-bit Full Adder Module

`timescale 1ns / 100ps

module adder_1bit(input a, b, carry_in, output sum, carry_out);

assign sum       = carry_in ^ (a ^ b);
assign carry_out = (~carry_in & b & a) | (carry_in & (b | a));

always @ (a) begin
	#(2) assert (a == 1 || a == 0)
	else $error("Input 'a' of component is not a digital logic value");
end

logic exp_sum;
logic exp_carry_out;

always @(a, b, carry_in) begin
	{exp_carry_out,exp_sum} = a + b + carry_in;

	#(2) 

	assert (exp_sum == sum)
	else $error("Output 'sum' of 1bit adder is incorrect");
	assert (exp_carry_out == carry_out)
	else $error("Output 'carry_out' of 1 bit adder is incorrect"); 
end

endmodule
