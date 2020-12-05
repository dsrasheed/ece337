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

  reg prev;
  
  always @ (negedge n_rst, posedge clk)
  begin : REG_LOGIC
    if(1'b0 == n_rst)
    begin
      prev  <= 1'b1;
    end
    else
    begin
      prev  <= serial_in;
    end
  end
  
  // Output logic
  assign edge_detected = serial_in ^ prev;
  
endmodule
