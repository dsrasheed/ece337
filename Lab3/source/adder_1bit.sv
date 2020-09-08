// $Id: $
// File name:   adder_1bit
// Created:     9/4/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: 1-bit Full Adder Module

module adder_1bit(input a, b, carry_in, output sum, carry_out);

assign sum       = carry_in ^ (a ^ b);
assign carry_out = (~carry_in & b & a) | (carry_in & (b | a));

endmodule
