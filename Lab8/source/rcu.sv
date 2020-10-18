// $Id: $
// File name:   rcu.sv
// Created:     10/4/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Reciever Control Unit FSM Module

module rcu (
	input clk, n_rst, start_bit_detected, packet_done, framing_error,
	output sbc_clear, sbc_enable, load_buffer, enable_timer
);

typedef enum logic [2:0] {IDLE, SBC_CLR, READ, SBC_EN, CHCK_ERR, LOAD} STATE;

STATE state;
STATE next_state;

always_comb begin
	next_state = state;
	case (state)
		IDLE: 	  if (start_bit_detected == 1) next_state = SBC_CLR;
		SBC_CLR:  next_state = READ;
		READ: 	  if (packet_done == 1) next_state = SBC_EN;
		SBC_EN:   next_state = CHCK_ERR;
		CHCK_ERR: if (framing_error == 1) next_state = IDLE;
			  	  else next_state = LOAD;
		LOAD:     next_state = IDLE;
		default:  next_state = IDLE;
	endcase
end

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 0)
		state <= IDLE;
	else
		state <= next_state;	
end

assign sbc_clear    = (state == SBC_CLR);
assign sbc_enable   = (state == SBC_EN);
assign load_buffer  = (state == LOAD);
assign enable_timer = (state == SBC_CLR) | (state == READ);

endmodule
