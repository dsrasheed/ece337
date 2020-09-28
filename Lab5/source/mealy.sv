// $Id: $
// File name:   moore.sv
// Created:     9/27/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Mealy Machine '1101' detector

module mealy(
	input clk, n_rst, i,
	output o
);

typedef enum logic [1:0] {WAITING, RCV1, RCV11, 
			RCV110} state_type;

state_type state;
state_type next_state;

always_comb begin
	next_state = WAITING;

	case (state)
		WAITING:
			if (i == 1) next_state = RCV1;
		RCV1:
			if (i == 1) next_state = RCV11;
		RCV11: begin
			if (i == 0) next_state = RCV110;
			else next_state = RCV11;
		end
		RCV110:
			if (i == 1) next_state = RCV1;
		default:
			next_state = WAITING;
	endcase	
end

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 1'b0)
		state <= WAITING;
	else
		state <= next_state;
end

assign o = i & (state == RCV110);

endmodule
