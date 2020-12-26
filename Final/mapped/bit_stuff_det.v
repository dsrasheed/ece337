/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Dec  5 19:27:42 2020
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BITS3 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [2:0] rollover_val;
  output [2:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n48, n49, n50, n51, n1, n2, n3, n4, n5, n6, n7, n8, n9, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;

  DFFSR \count_out_reg[0]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[2]  ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  MUX2X1 U7 ( .B(n1), .A(n2), .S(n3), .Y(n51) );
  OAI21X1 U8 ( .A(n4), .B(n1), .C(n5), .Y(n2) );
  INVX1 U9 ( .A(clear), .Y(n5) );
  MUX2X1 U10 ( .B(n6), .A(n7), .S(n8), .Y(n50) );
  MUX2X1 U11 ( .B(n9), .A(n14), .S(n15), .Y(n49) );
  INVX1 U12 ( .A(count_out[2]), .Y(n15) );
  OR2X1 U13 ( .A(n7), .B(n8), .Y(n14) );
  NAND3X1 U14 ( .A(count_out[0]), .B(n3), .C(n16), .Y(n7) );
  AOI21X1 U15 ( .A(n16), .B(n8), .C(n17), .Y(n9) );
  INVX1 U16 ( .A(n6), .Y(n17) );
  AOI21X1 U17 ( .A(n1), .B(n16), .C(n18), .Y(n6) );
  INVX1 U18 ( .A(count_out[0]), .Y(n1) );
  OAI21X1 U19 ( .A(n19), .B(n20), .C(n21), .Y(n48) );
  OAI21X1 U20 ( .A(n16), .B(n18), .C(rollover_flag), .Y(n21) );
  NAND2X1 U21 ( .A(n22), .B(n16), .Y(n20) );
  NOR2X1 U22 ( .A(clear), .B(n4), .Y(n16) );
  INVX1 U23 ( .A(n23), .Y(n4) );
  NAND3X1 U24 ( .A(n24), .B(n25), .C(n26), .Y(n23) );
  XNOR2X1 U25 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n26) );
  XNOR2X1 U26 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n25) );
  XNOR2X1 U27 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n24) );
  XNOR2X1 U28 ( .A(count_out[2]), .B(n27), .Y(n22) );
  NOR2X1 U29 ( .A(n28), .B(n29), .Y(n27) );
  INVX1 U30 ( .A(rollover_val[2]), .Y(n29) );
  OAI21X1 U31 ( .A(rollover_val[0]), .B(count_out[0]), .C(n30), .Y(n19) );
  AND2X1 U32 ( .A(n31), .B(n3), .Y(n30) );
  INVX1 U33 ( .A(n18), .Y(n3) );
  NOR2X1 U34 ( .A(count_enable), .B(clear), .Y(n18) );
  OAI21X1 U35 ( .A(n32), .B(n33), .C(n34), .Y(n31) );
  MUX2X1 U36 ( .B(n35), .A(n36), .S(n8), .Y(n34) );
  INVX1 U37 ( .A(count_out[1]), .Y(n8) );
  NOR2X1 U38 ( .A(rollover_val[1]), .B(n37), .Y(n36) );
  AND2X1 U39 ( .A(rollover_val[2]), .B(n28), .Y(n35) );
  NOR2X1 U40 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n28) );
  XNOR2X1 U41 ( .A(n37), .B(count_out[1]), .Y(n33) );
  INVX1 U42 ( .A(rollover_val[0]), .Y(n37) );
  INVX1 U43 ( .A(rollover_val[1]), .Y(n32) );
endmodule


module bit_stuff_det ( clk, n_rst, d_edge, shift_enable, bit_stuff_det );
  input clk, n_rst, d_edge, shift_enable;
  output bit_stuff_det;
  wire   _0_net_;

  flex_counter_NUM_CNT_BITS3 bit_cnt ( .clk(clk), .n_rst(n_rst), .clear(
        _0_net_), .count_enable(shift_enable), .rollover_val({1'b1, 1'b1, 1'b0}), .rollover_flag(bit_stuff_det) );
  OR2X1 U4 ( .A(bit_stuff_det), .B(d_edge), .Y(_0_net_) );
endmodule

