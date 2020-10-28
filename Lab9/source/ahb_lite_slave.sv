// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     10/26/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: AHB-Lite Slave Interface

module ahb_lite_slave (
    input  wire         clk, n_rst,
    // FIR Sample Loading
    output reg          data_ready, 
    output wire  [15:0] sample_data,
    // FIR Coefficient Loading
    output wire         new_coefficient_set,
    output wire  [15:0] fir_coefficient,
    input  wire  [1:0]  coefficient_num,
    // FIR Status, Result, and Error
    input  wire         modwait,
    input  wire  [15:0] fir_out,
    input  wire         err,
    // AHB Interface Signals
    input  wire         hsel,
    input  wire  [3:0]  haddr,
    input  wire         hsize,
    input  wire  [1:0]  htrans,
    input  wire         hwrite,
    input  wire  [15:0] hwdata,
    output reg   [15:0] hrdata,
    output logic        hresp
);

/**** CONSTANTS ****/
// HTRANS Modes
localparam NON_SEQ = 2'd2;
localparam IDLE    = 2'd0;

/**** REGISTERS ****/
reg [15:0] status;
reg [15:0] result;
reg [15:0] new_sample;
reg [15:0] F0;
reg [15:0] F1;
reg [15:0] F2;
reg [15:0] F3;
reg [7:0]  new_coeff_confirm;

/**** ADDRESS MAPPING LOGIC ****/
logic [5:0] wsel_even;
logic [4:0] wsel_odd;
reg [5:0] delay_wsel_even;
reg [4:0] delay_wsel_odd;
logic [2:0] rsel_even;
logic [2:0] rsel_odd;

always_comb begin
    wsel_even = '0;
    wsel_odd  = '0;
    rsel_even = '0;
    rsel_odd  = '0;
    hresp = 0;
    if (hsel && hwrite && htrans == NON_SEQ) begin
        // 0xF doesn't have a register, so a 1 byte write cannot be performed
        // Addresses 0,1,2,3 are read-only.
        if (hsize == 0 && haddr == 4'hf || haddr < 4'h4)
            hresp = 1;
        // For 2 byte writes to 0xF, just write to 0xE.
        else if (haddr == 4'hf)
            wsel_even[3'h7 - 3'h2] = 1;
        else if (hsize == 1) begin
            wsel_even[haddr[3:1] - 3'h2] = 1'b1;
            wsel_odd[haddr[3:1] - 3'h2] = 1'b1;
        end
        else if (hsize == 0 && haddr[0] == 0) 
            wsel_even[haddr[3:1] - 3'h2] = 1'b1;
        else if (hsize == 0 && haddr[0] == 1)
            wsel_odd[haddr[3:1] - 3'h2] = 1'b1;
    end
    else if (hsel && !hwrite && htrans == NON_SEQ) begin
        // OxF doesn't have a register, so a 1 byte read cannot be performed
        if (hsize == 0 && haddr == 4'hf)
            hresp = 1;
        else begin
            // Don't worry about hsize == 0, the hrdata controller will handle replacing
            // the upper or lower bits with 0s.
            rsel_even = haddr[3:1];
            rsel_odd  = haddr[3:1];
        end
    end
end

always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 0) begin
        delay_wsel_even <= '0;
        delay_wsel_odd  <= '0;
    end
    else begin
        delay_wsel_even <= wsel_even;
        delay_wsel_odd  <= wsel_odd;
    end
end

/**** READ-ONLY REGISTERS ****/
// Status Controller
wire [16:0] nxt_status;
assign nxt_status = {7'b0, err, 7'b0, modwait | new_coefficient_set};
always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 0)
        status <= '0;
    else
        status <= nxt_status;
end

// Result Register
always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 0)
        result <= '0;
    else
        result <= fir_out;
end

/**** CONFIG REGISTERS (Addresses 0x4 to 0xE) ****/
// Addresses 0x4 to 0xD (Sample Data and Coefficients)
logic [15:0] nxt_new_sample, nxt_F0, nxt_F1, nxt_F2, nxt_F3;

always_comb begin
    nxt_new_sample[7:0]  = delay_wsel_even[0] == 1 ? hwdata[7:0] : new_sample[7:0];  // 0x4
    nxt_new_sample[15:8] = delay_wsel_odd[0] == 1 ? hwdata[15:8] : new_sample[15:8]; // 0x5

    nxt_F0[7:0]  = delay_wsel_even[1] == 1 ? hwdata[7:0] : F0[7:0];  // 0x6 
    nxt_F0[15:8] = delay_wsel_odd[1] == 1 ? hwdata[15:8] : F0[15:8]; // 0x7

    nxt_F1[7:0]  = delay_wsel_even[2] == 1 ? hwdata[7:0] : F1[7:0];  // 0x8
    nxt_F1[15:8] = delay_wsel_odd[2] == 1 ? hwdata[15:8] : F1[15:8]; // 0x9

    nxt_F2[7:0]  = delay_wsel_even[3] == 1 ? hwdata[7:0] : F2[7:0];  // 0xA
    nxt_F2[15:8] = delay_wsel_odd[3] == 1 ? hwdata[15:8] : F2[15:8]; // 0xB

    nxt_F3[7:0]  = delay_wsel_even[4] == 1 ? hwdata[7:0] : F3[7:0];  // 0xC
    nxt_F3[15:8] = delay_wsel_odd[4] == 1 ? hwdata[15:8] : F3[15:8]; // 0xD
end

always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 0) begin
        new_sample <= '0;
        F0 <= '0;
        F1 <= '0;
        F2 <= '0;
        F3 <= '0;
    end
    else begin
        new_sample <= nxt_new_sample;
        F0 <= nxt_F0;
        F1 <= nxt_F1;
        F2 <= nxt_F2;
        F3 <= nxt_F3;
    end
end

// New Coefficient Set (Address 0xE)
logic [7:0] nxt_new_coeff_confirm;

always_comb begin
    nxt_new_coeff_confirm = new_coeff_confirm;

    if (delay_wsel_even[3'h7 - 3'h2] == 1)
        nxt_new_coeff_confirm = hwdata[7:0];
    else if (coefficient_num == 2'd3 && modwait == 1)
        nxt_new_coeff_confirm = '0;
end

always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 0)
        new_coeff_confirm <= '0;
    else
        new_coeff_confirm <= nxt_new_coeff_confirm;
end

// Assign Outputs of Configuration Registers
assign sample_data = new_sample;
assign fir_coefficient = coefficient_num == 2'd0 ? F0 :
                         coefficient_num == 2'd1 ? F1 :
                         coefficient_num == 2'd2 ? F2 : F3;
assign new_coefficient_set = new_coeff_confirm[0];


/**** DATA READY CONTROLLER ****/
logic nxt_data_ready;

always_comb begin
    nxt_data_ready = data_ready;
    if (delay_wsel_even[0] == 1'b1 && delay_wsel_odd[0] == 1'b1)
        nxt_data_ready = 1;
    else if (modwait == 1)
        nxt_data_ready = 0;
end

always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 0)
        data_ready <= 0;
    else
        data_ready <= nxt_data_ready;
end

/**** HRDATA INTERFACE ****/
wire [7:0] upper, lower;
assign lower = rsel_even == 3'd0 ? status[7:0] :
               rsel_even == 3'd1 ? result[7:0] :
               rsel_even == 3'd2 ? sample_data[7:0] :
               rsel_even == 3'd3 ? F0[7:0] :
               rsel_even == 3'd4 ? F1[7:0] :
               rsel_even == 3'd5 ? F2[7:0] :
               rsel_even == 3'd6 ? F3[7:0] : new_coeff_confirm;
assign upper = rsel_odd  == 3'd0 ? status[15:8] :
               rsel_odd  == 3'd1 ? result[15:8] :
               rsel_odd  == 3'd2 ? sample_data[15:8] :
               rsel_odd  == 3'd3 ? F0[15:8] :
               rsel_odd  == 3'd4 ? F1[15:8] :
               rsel_odd  == 3'd5 ? F2[15:8] :
               rsel_odd  == 3'd6 ? F3[15:8] : 8'd0;

logic [15:0] nxt_hrdata;

always_comb begin
    nxt_hrdata = hrdata;

    if (htrans == NON_SEQ) begin
        if (hsize == 1)
            nxt_hrdata = {upper, lower};
        else if (hsize == 0 && haddr[0] == 0) // Even
            nxt_hrdata = {8'b0, lower};
        else if (hsize == 0 && haddr[0] == 1) // Odd
            nxt_hrdata = {upper, 8'b0};
    end
end

always_ff @ (posedge clk, negedge n_rst) begin
    if (n_rst == 0)
        hrdata <= '0;
    else
        hrdata <= nxt_hrdata;
end

endmodule