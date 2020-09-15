// 337 TA Provided Lab 2 8-bit adder wrapper file template
// This code serves as a template for the 8-bit adder design wrapper file 
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);

	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design

adder_nbit #(.BIT_WIDTH(16)) adder(.a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));

always @ (a, b, carry_in) begin
	assert (carry_in == 0 || carry_in == 1)
	else $error("Input 'carry_in' is not all 0s or 1s");

	for (int i = 0; i < 16; i++) begin
		assert (a[i] == 0 || a[i] == 1)
		else $error("Input 'a' is not all 0s or 1s");
	
		assert (b[i] == 0 || b[i] == 1)
		else $error("Input 'b' is not all 0s or 1");
	end
end

endmodule
