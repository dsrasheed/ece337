/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Dec  4 02:34:25 2020
/////////////////////////////////////////////////////////////


module decoder ( clk, n_rst, d_plus_sync, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus_sync, shift_enable, eop;
  output d_orig;
  wire   prev, n4, n6, n7;

  DFFSR prev_reg ( .D(n4), .CLK(clk), .R(1'b1), .S(n_rst), .Q(prev) );
  NAND2X1 U8 ( .A(n6), .B(n7), .Y(n4) );
  MUX2X1 U9 ( .B(prev), .A(d_plus_sync), .S(shift_enable), .Y(n7) );
  INVX1 U10 ( .A(eop), .Y(n6) );
  XNOR2X1 U11 ( .A(d_plus_sync), .B(prev), .Y(d_orig) );
endmodule

