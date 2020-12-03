// $Id: $
// File name:   start_bit_det.sv
// Created:     2/5/2013
// Author:      foo
// Lab Section: 99
// Version:     1.0  Initial Design Entry
// Description: start bit detector for UART RX Design

`timescale 1ns / 10ps

module edge_det
(
  input  wire clk,
  input  wire n_rst,
  input  wire serial_in,
  output wire edge_detected
);

  reg old_sample;
  reg new_sample;
  reg sync_phase;
  
  always @ (negedge n_rst, posedge clk)
  begin : REG_LOGIC
    if(1'b0 == n_rst)
    begin
      old_sample  <= 1'b1; // Reset value to idle line value
      new_sample  <= 1'b1; // Reset value to idle line value
      sync_phase  <= 1'b1; // Reset value to idle line value
    end
    else
    begin
      old_sample  <= new_sample;
      new_sample  <= sync_phase;
      sync_phase  <= serial_in;
    end
  end
  
  // Output logic
  assign edge_detected = old_sample ^ new_sample;
  
endmodule
