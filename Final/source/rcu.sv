// $Id: $
// File name:   rcu.sv
// Created:     12/2/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit

module rcu (
    input clk, n_rst, d_edge, eop, shift_enable, byte_received,
    input wire [7:0] rcv_data,
    output logic pid_reset, pid_save, rcving, r_error, w_enable
);

localparam OUT   = {4'b1110, 4'b0001};
localparam IN    = {4'b0110, 4'b1001};
localparam DATA0 = {4'b1100, 4'b0011};
localparam DATA1 = {4'b0100, 4'b1011};
localparam ACK   = {4'b1101, 4'b0010};
localparam NAK   = {4'b0101, 4'b1010};
localparam STALL = {4'b0001, 4'b1110};

typedef enum logic [4:0] {
    IDLE, SYNC, PID, W8_EOP, W8_IDLE,
    E_IDLE, E_W8_EOP, E_W8_IDLE, 
    TOKEN, T1, T2, CHECK_3,
    HSHAKE, CHECK_1,
    DATA, BYTE1, BYTE2, WAIT_SHIFT, READ_BYTE, WRITE_BYTE
} rcu_state;

rcu_state nxt_state;
rcu_state state;

always_comb begin
    nxt_state = state;

    case (state)
        IDLE: if (d_edge) nxt_state = SYNC;
        SYNC: if (byte_received && rcv_data == 8'h80) nxt_state = PID;
          else if (byte_received && rcv_data != 8'h80) nxt_state = E_W8_EOP;
        PID: if (byte_received) begin
                case (rcv_data)
                    IN,OUT: nxt_state = TOKEN;
                    DATA0,DATA1: nxt_state = DATA;
                    ACK,NAK: nxt_state = HSHAKE;
                    default: nxt_state = E_W8_EOP;
                endcase
             end
             else if (!byte_received && eop)
                nxt_state = E_W8_IDLE;
        W8_EOP: if (eop) nxt_state = W8_IDLE;
        W8_IDLE: if (d_edge) nxt_state = IDLE;
        E_IDLE: if (d_edge) nxt_state = SYNC;
        E_W8_EOP: if (eop) nxt_state = E_W8_IDLE;
        E_W8_IDLE: if (d_edge) nxt_state = E_IDLE;
        TOKEN: nxt_state = T1;
        T1: if (byte_received) nxt_state = T2;
            else if (!byte_received && eop) nxt_state = E_W8_IDLE;
        T2: if (byte_received) nxt_state = CHECK_3;
            else if (!byte_received && eop) nxt_state = E_W8_IDLE;
        CHECK_3: if (eop) nxt_state = W8_EOP;
                 else if (~eop && shift_enable) nxt_state = E_W8_EOP;
        HSHAKE: nxt_state = CHECK_1;
        CHECK_1: if (eop) nxt_state = W8_EOP;
                 else if (~eop && shift_enable) nxt_state = E_W8_EOP;
        DATA: nxt_state = BYTE1;
        BYTE1: if (byte_received) nxt_state = BYTE2;
               else if (!byte_received && eop) nxt_state = E_W8_IDLE;
        BYTE2: if (byte_received) nxt_state = WAIT_SHIFT;
               else if (!byte_received && eop) nxt_state = E_W8_IDLE;
        WAIT_SHIFT: if (eop) nxt_state = W8_EOP;
                    else if (shift_enable && !eop) nxt_state = READ_BYTE;
        READ_BYTE: if (byte_received) nxt_state = WRITE_BYTE;
                   else if (!byte_received && eop) nxt_state = E_W8_IDLE;
        WRITE_BYTE: nxt_state = WAIT_SHIFT;
        endcase
end

always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 1'b0)
        state <= IDLE;
    else
        state <= nxt_state;
end

always_comb begin
    rcving = 1'b0;
    pid_reset = 1'b0;
    pid_save = 1'b0;
    r_error = 1'b0;
    w_enable = 1'b0;

    case (state)
        SYNC: begin
            rcving = 1'b1;
            pid_reset = 1'b1;
        end
        PID: begin
            rcving = 1'b1;
        end
        W8_EOP: begin
            rcving = 1'b1;
        end
        E_W8_EOP: begin
            rcving = 1'b1;
            r_error = 1'b1;
        end
        E_W8_IDLE: begin
            r_error = 1'b1;
        end
        E_IDLE: begin
            r_error = 1'b1;
        end
        TOKEN: begin
            rcving = 1'b1;
            pid_save = 1'b1;
        end
        T1: begin
            rcving = 1'b1;
        end
        T2: begin
            rcving = 1'b1;
        end
        CHECK_3: begin
            rcving = 1'b1;
        end
        HSHAKE: begin
            rcving = 1'b1;
            pid_save = 1'b1;
        end
        CHECK_1: begin
            rcving = 1'b1;
        end
        DATA: begin
            rcving = 1'b1;
            pid_save = 1'b1;
        end
        BYTE1: begin
            rcving = 1'b1;
        end
        BYTE2: begin
            rcving = 1'b1;
        end
        WAIT_SHIFT: begin
            rcving = 1'b1;
        end
        READ_BYTE: begin
            rcving = 1'b1;
        end
        WRITE_BYTE: begin
            rcving = 1'b1;
            w_enable = 1'b1;
        end
    endcase
end

endmodule