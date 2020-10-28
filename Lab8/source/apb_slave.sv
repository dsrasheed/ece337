// $Id: $
// File name:   apb_slave.sv
// Created:     10/18/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: APB Slave Interface

module apb_slave (
	input 	           clk, n_rst, data_ready, 
	input 	           overrun_error, framing_error, psel, penable, pwrite,
	input       [2:0]  paddr,
	input       [7:0]  rx_data, pwdata,
	output reg         data_read,
	output reg	   	   pslverr,
	output reg  [7:0]  prdata,
	output wire [3:0]  data_size,
	output wire [13:0] bit_period
);

// Read-Only Registers
reg [7:0] data_status, nxt_data_status;
reg [7:0] error_status, nxt_error_status;
reg [7:0] data, nxt_data;
// Destination Registers
reg [7:0] bit_period_msb, nxt_bit_period_msb;
reg [7:0] bit_period_lsb, nxt_bit_period_lsb;
reg [7:0] data_size_reg, nxt_data_size;

// Registered Outputs
reg [7:0] nxt_prdata;
reg nxt_data_read;
reg nxt_pslverr;

always_comb begin
	// Read-Only Regs
	nxt_data_status  = {7'b0, data_ready};
	nxt_error_status = {6'b0, overrun_error, framing_error};

	// D = Data, X = Garbage
	// DDDDDDDD --> DDDDDDDD
	nxt_data         = rx_data;
	if (data_size == 3'd5)
		// DDDDDXXX --> 000DDDDD
		nxt_data = rx_data >> 3;
	else if (data_size == 3'd7)
		// DDDDDDDX --> 0DDDDDDD
		nxt_data = rx_data >> 1;

	// Destination Regs
	nxt_bit_period_msb = bit_period_msb;
	nxt_bit_period_lsb = bit_period_lsb;
	nxt_data_size      = data_size_reg;

	nxt_prdata = 8'b0;
	nxt_data_read = 1'b0;
	pslverr = 1'b0;
	if (psel && pwrite) begin
		case (paddr)
			3'd2: nxt_bit_period_lsb = pwdata;
			3'd3: nxt_bit_period_msb = pwdata;
			3'd4: nxt_data_size      = pwdata;
			default: if (penable) pslverr = 1'b1;
		endcase
	end
	else if (psel && !pwrite) begin
		case (paddr)
			3'd0: nxt_prdata = data_status;
			3'd1: nxt_prdata = error_status;
			3'd2: nxt_prdata = bit_period_lsb;
			3'd3: nxt_prdata = bit_period_msb;
			3'd4: nxt_prdata = data_size_reg;
			3'd6: begin
				nxt_prdata = data;
				nxt_data_read = 1'b1;
				nxt_data_status = 8'b0;
			end
			default: if (penable) pslverr = 1'b1;
		endcase
	end
end

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 1'b0) begin
		data_status <= '0;
		error_status <= '0;
		data <= '0;
		bit_period_msb <= '0;
		bit_period_lsb <= '0;
		data_size_reg  <= '0;

		prdata <= '0;
		data_read <= '0;
	end
	else begin
		data_status <= nxt_data_status;
		error_status <= nxt_error_status;
		data <= nxt_data;
		bit_period_msb <= nxt_bit_period_msb;
		bit_period_lsb <= nxt_bit_period_lsb;
		data_size_reg <= nxt_data_size;

		prdata <= nxt_prdata;
		data_read <= nxt_data_read;
	end
end

// Outputs to UART Receiver
assign bit_period = {bit_period_msb[5:0], bit_period_lsb};
assign data_size  = data_size_reg[3:0];

endmodule
