/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Sep 26 18:31:42 2020
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [1:0] rollover_val;
  output [1:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36;
  wire   [1:0] next_cnt;

  DFFSR \count_out_reg[0]  ( .D(next_cnt[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_cnt[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR rollover_flag_reg ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U22 ( .A(n23), .B(n24), .Y(N11) );
  XOR2X1 U23 ( .A(rollover_val[1]), .B(next_cnt[1]), .Y(n24) );
  NOR2X1 U24 ( .A(n25), .B(clear), .Y(next_cnt[1]) );
  INVX1 U25 ( .A(n26), .Y(n25) );
  OAI21X1 U26 ( .A(n27), .B(n28), .C(n29), .Y(n26) );
  NAND3X1 U27 ( .A(n30), .B(n28), .C(count_enable), .Y(n29) );
  INVX1 U28 ( .A(n31), .Y(n30) );
  AOI21X1 U29 ( .A(n32), .B(n31), .C(n33), .Y(n27) );
  INVX1 U30 ( .A(count_enable), .Y(n33) );
  XOR2X1 U31 ( .A(rollover_val[0]), .B(next_cnt[0]), .Y(n23) );
  NOR2X1 U32 ( .A(n34), .B(clear), .Y(next_cnt[0]) );
  MUX2X1 U33 ( .B(count_out[0]), .A(n31), .S(count_enable), .Y(n34) );
  NAND2X1 U34 ( .A(count_out[0]), .B(n32), .Y(n31) );
  NAND2X1 U35 ( .A(n35), .B(n36), .Y(n32) );
  XNOR2X1 U36 ( .A(count_out[0]), .B(rollover_val[0]), .Y(n36) );
  XOR2X1 U37 ( .A(n28), .B(rollover_val[1]), .Y(n35) );
  INVX1 U38 ( .A(count_out[1]), .Y(n28) );
endmodule

