// $Id: $
// File name:   coefficient_loader.sv
// Created:     10/26/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Loads in the coefficients from the AHB-Lite Slave Interface

module coefficient_loader (
    input clk, n_rst,
    input new_coefficient_set,
    input modwait,
    output reg load_coeff,
    output reg [1:0] coefficient_num
);

logic nxt_load_coeff;
logic increment;

always_comb begin
    nxt_load_coeff = 0;
    increment = 0;

    if (new_coefficient_set) begin
        if (coefficient_num == 2'd3)
            nxt_load_coeff = 1'b0;
        else
            nxt_load_coeff = !load_coeff;

        if (modwait == 1)
            increment = 1;
    end
end 

always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 0) begin
        load_coeff <= '0;
    end
    else begin
        load_coeff <= nxt_load_coeff;
    end
end

flex_counter #(.NUM_CNT_BITS(2)) coeff_cnt(
    .clk(clk), .n_rst(n_rst),
    .clear(1'b0), .count_enable(increment),
    .count_out(coefficient_num),
    .rollover_val(2'd3)
);

endmodule
