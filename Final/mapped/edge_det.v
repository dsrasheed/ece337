/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Dec  5 17:02:15 2020
/////////////////////////////////////////////////////////////


module edge_det ( clk, n_rst, serial_in, edge_detected );
  input clk, n_rst, serial_in;
  output edge_detected;
  wire   prev;

  DFFSR prev_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(prev) );
  XOR2X1 U5 ( .A(serial_in), .B(prev), .Y(edge_detected) );
endmodule

