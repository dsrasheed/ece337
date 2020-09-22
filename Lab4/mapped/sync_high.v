/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Sep 21 19:32:44 2020
/////////////////////////////////////////////////////////////


module sync_high ( clk, async_in, n_rst, sync_out );
  input clk, async_in, n_rst;
  output sync_out;
  wire   second, first;

  DFFSR first_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(first) );
  DFFSR second_reg ( .D(first), .CLK(clk), .R(n_rst), .S(1'b1), .Q(second) );
  INVX1 U6 ( .A(second), .Y(sync_out) );
endmodule

