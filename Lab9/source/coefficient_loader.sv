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
    output logic load_coeff,
    output logic [1:0] coefficient_num
);

typedef enum logic [3:0] {IDLE, S1, S2, S3, S4, S5, S6, S7, S8, S9} state_type;

state_type nxt_state;
state_type state;

logic [1:0] nxt_coefficient_num;

always_comb begin
    nxt_state = IDLE;
    case(state)
        IDLE: if (new_coefficient_set) nxt_state = S1;
        S1: nxt_state = S2;
        S2: nxt_state = S3;
        S3: nxt_state = S4;
        S4: nxt_state = S5;
        S5: nxt_state = S6;
        S6: nxt_state = S7;
        S7: nxt_state = S8;
        S8: nxt_state = IDLE;
        default: nxt_state = IDLE;
    endcase
end 

always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 0) begin
        state <= IDLE;
        coefficient_num <= '0;
    end
    else begin
        state <= nxt_state;
        coefficient_num <= nxt_coefficient_num;
    end
end

always_comb begin
    load_coeff = 0;
    case (state)
        S1: begin
            nxt_coefficient_num = 2'd0;
            load_coeff = 1'b1;
        end
        S2: begin
            nxt_coefficient_num = 2'd1;
        end
        S3: begin
            nxt_coefficient_num = 2'd1;
            load_coeff = 1'b1;
        end
        S4: begin
            nxt_coefficient_num = 2'd2;
        end
        S5: begin
            nxt_coefficient_num = 2'd2;
            load_coeff = 1'b1;
        end
        S6: begin
            nxt_coefficient_num = 2'd3;
        end
        S7: begin
            nxt_coefficient_num = 2'd3;
            load_coeff = 1'b1;
        end
        S8: begin
            nxt_coefficient_num = 2'd0;
        end
        default: begin
            nxt_coefficient_num = 2'd0;
        end
    endcase
end

endmodule
