/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Sep 28 00:53:53 2020
/////////////////////////////////////////////////////////////


module moore ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26;
  wire   [2:0] next_state;
  wire   [2:0] state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  INVX1 U21 ( .A(n16), .Y(o) );
  NOR2X1 U22 ( .A(n17), .B(n18), .Y(next_state[2]) );
  OAI21X1 U23 ( .A(n19), .B(n16), .C(n20), .Y(next_state[1]) );
  MUX2X1 U24 ( .B(n21), .A(n22), .S(state[1]), .Y(n20) );
  NOR2X1 U25 ( .A(state[2]), .B(state[0]), .Y(n22) );
  INVX1 U26 ( .A(n17), .Y(n21) );
  NAND3X1 U27 ( .A(i), .B(n23), .C(state[0]), .Y(n17) );
  NAND3X1 U28 ( .A(n24), .B(n18), .C(state[2]), .Y(n16) );
  INVX1 U29 ( .A(state[1]), .Y(n18) );
  NOR2X1 U30 ( .A(n25), .B(n26), .Y(next_state[0]) );
  NAND2X1 U31 ( .A(n24), .B(n23), .Y(n26) );
  INVX1 U32 ( .A(state[2]), .Y(n23) );
  INVX1 U33 ( .A(state[0]), .Y(n24) );
  XOR2X1 U34 ( .A(n19), .B(state[1]), .Y(n25) );
  INVX1 U35 ( .A(i), .Y(n19) );
endmodule

