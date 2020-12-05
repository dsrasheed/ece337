// $Id: $
// File name:   timer.sv
// Created:     12/2/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Outputs a shift_enable every 3 clock cycles after an edge, and every 7 clock cycles 
// after the last shift enable. Signals that a byte has been received after 8 shift enables
// occur in a row.

module timer (
	input clk, n_rst, rcving, d_edge, bit_stuff_det,
	output shift_enable, byte_received
);

logic clear;
logic [3:0] rollover;
logic cnt_en;
wire clk_pulse;
wire shift_enable_en;

/*** CLK DIVIDER CONTROLLER ***/
typedef enum logic [1:0] {DISABLED, START4, COUNT4, COUNT8} ctrl_state;

ctrl_state nxt_ctrl;
ctrl_state ctrl;

always_comb begin
	nxt_ctrl = DISABLED;

	case (ctrl)
	DISABLED: if (d_edge) nxt_ctrl = START4;
	START4  : if (rcving) nxt_ctrl = COUNT4;
	COUNT4  : if (rcving && clk_pulse) nxt_ctrl = COUNT8;
			  else if (rcving && !clk_pulse) nxt_ctrl = COUNT4;
	COUNT8  : if (rcving && d_edge) nxt_ctrl = START4;
			  else if (rcving && !d_edge) nxt_ctrl = COUNT8;
	endcase
end

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 1'b0)
		ctrl <= DISABLED;
	else
		ctrl <= nxt_ctrl;
end

always_comb begin
	clear = 1'b0;
	rollover = 4'd0;
	cnt_en = 1'b0;
	
	case (ctrl)
	DISABLED: begin
		clear = 1'b1;
	end
	START4: begin
		clear = 1'b1;
		rollover = 4'd2;
	end
	COUNT4: begin
		cnt_en = 1'b1;
		rollover = 4'd2;
	end
	COUNT8: begin
		cnt_en = 1'b1;
		rollover = 4'd8;
	end
	endcase
end

/*** BIT STUFFING HANDLER ***/
typedef enum logic {ENABLE_SHIFT, DISABLE_SHIFT} bit_stuff_handler_state;

bit_stuff_handler_state nxt_handler_state;
bit_stuff_handler_state handler_state;

always_comb begin
	nxt_handler_state = handler_state;

	case (handler_state)
	ENABLE_SHIFT: if (bit_stuff_det) nxt_handler_state = DISABLE_SHIFT;
	DISABLE_SHIFT: if (clk_pulse) nxt_handler_state = ENABLE_SHIFT;
	endcase 
end

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 1'b0)
		handler_state <= ENABLE_SHIFT;
	else
		handler_state <= nxt_handler_state;
end

assign shift_enable_en = handler_state == ENABLE_SHIFT;

/*** COuNTERS ***/
flex_counter #(.NUM_CNT_BITS(4)) clkdiv (
	.clk(clk), .n_rst(n_rst),
	.clear(clear),
	.count_enable(cnt_en),
	.rollover_val(rollover),
	.rollover_flag(clk_pulse)
);

flex_counter #(.NUM_CNT_BITS(4)) bitcnt (
	.clk(clk), .n_rst(n_rst),
	.clear(byte_received | ~rcving),
	.count_enable(shift_enable),
	.rollover_val(4'd8),
	.rollover_flag(byte_received)
);

/*** MODULE OUTPUTS ***/
assign shift_enable = clk_pulse & shift_enable_en;

endmodule
