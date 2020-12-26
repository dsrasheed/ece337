/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Dec  5 19:07:42 2020
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n49, n50, n51, n52, n53, n1, n2, n3, n4, n5, n6, n7, n8, n9, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43;

  DFFSR \count_out_reg[0]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  MUX2X1 U7 ( .B(n1), .A(n2), .S(n3), .Y(n53) );
  OAI21X1 U9 ( .A(n4), .B(n2), .C(n5), .Y(n1) );
  MUX2X1 U10 ( .B(n6), .A(n7), .S(count_out[1]), .Y(n52) );
  NAND2X1 U11 ( .A(n8), .B(count_out[0]), .Y(n6) );
  INVX1 U12 ( .A(n9), .Y(n51) );
  MUX2X1 U13 ( .B(n15), .A(n16), .S(count_out[2]), .Y(n9) );
  MUX2X1 U14 ( .B(n17), .A(n18), .S(count_out[3]), .Y(n50) );
  AOI21X1 U15 ( .A(n8), .B(n19), .C(n16), .Y(n18) );
  OAI21X1 U16 ( .A(count_out[1]), .B(n20), .C(n7), .Y(n16) );
  AOI21X1 U17 ( .A(n2), .B(n8), .C(n3), .Y(n7) );
  INVX1 U18 ( .A(count_out[0]), .Y(n2) );
  NAND2X1 U19 ( .A(n15), .B(count_out[2]), .Y(n17) );
  INVX1 U20 ( .A(n21), .Y(n15) );
  NAND3X1 U21 ( .A(count_out[1]), .B(count_out[0]), .C(n8), .Y(n21) );
  OAI21X1 U22 ( .A(n22), .B(n23), .C(n24), .Y(n49) );
  OAI21X1 U23 ( .A(n25), .B(n3), .C(rollover_flag), .Y(n24) );
  NOR2X1 U24 ( .A(clear), .B(n4), .Y(n25) );
  INVX1 U25 ( .A(n26), .Y(n4) );
  NAND3X1 U26 ( .A(n27), .B(n8), .C(n28), .Y(n23) );
  MUX2X1 U27 ( .B(n29), .A(n30), .S(n31), .Y(n28) );
  NOR2X1 U28 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n30) );
  OAI21X1 U29 ( .A(rollover_val[0]), .B(n32), .C(n33), .Y(n29) );
  INVX1 U30 ( .A(n20), .Y(n8) );
  NAND3X1 U31 ( .A(n34), .B(n5), .C(n26), .Y(n20) );
  NAND3X1 U32 ( .A(n35), .B(n33), .C(n36), .Y(n26) );
  AOI21X1 U33 ( .A(rollover_val[1]), .B(n32), .C(n37), .Y(n36) );
  INVX1 U34 ( .A(n38), .Y(n33) );
  OAI21X1 U35 ( .A(rollover_val[1]), .B(n32), .C(n39), .Y(n38) );
  XNOR2X1 U36 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n35) );
  INVX1 U37 ( .A(clear), .Y(n5) );
  INVX1 U38 ( .A(n3), .Y(n34) );
  NOR2X1 U39 ( .A(count_enable), .B(clear), .Y(n3) );
  XOR2X1 U40 ( .A(n40), .B(count_out[3]), .Y(n27) );
  OAI21X1 U41 ( .A(rollover_val[2]), .B(n41), .C(rollover_val[3]), .Y(n40) );
  INVX1 U42 ( .A(n31), .Y(n41) );
  NAND3X1 U43 ( .A(n37), .B(n42), .C(n43), .Y(n22) );
  OAI21X1 U44 ( .A(n39), .B(n32), .C(n31), .Y(n43) );
  NOR2X1 U45 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n31) );
  XOR2X1 U46 ( .A(n19), .B(rollover_val[2]), .Y(n39) );
  INVX1 U47 ( .A(count_out[2]), .Y(n19) );
  NAND3X1 U48 ( .A(rollover_val[1]), .B(n32), .C(rollover_val[0]), .Y(n42) );
  INVX1 U49 ( .A(count_out[1]), .Y(n32) );
  XOR2X1 U50 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n37) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48;

  DFFSR \count_out_reg[0]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(n47), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  MUX2X1 U7 ( .B(n1), .A(n2), .S(n3), .Y(n44) );
  OAI21X1 U9 ( .A(n4), .B(n2), .C(n5), .Y(n1) );
  MUX2X1 U10 ( .B(n6), .A(n7), .S(count_out[1]), .Y(n45) );
  NAND2X1 U11 ( .A(n8), .B(count_out[0]), .Y(n6) );
  INVX1 U12 ( .A(n9), .Y(n46) );
  MUX2X1 U13 ( .B(n15), .A(n16), .S(count_out[2]), .Y(n9) );
  MUX2X1 U14 ( .B(n17), .A(n18), .S(count_out[3]), .Y(n47) );
  AOI21X1 U15 ( .A(n8), .B(n19), .C(n16), .Y(n18) );
  OAI21X1 U16 ( .A(count_out[1]), .B(n20), .C(n7), .Y(n16) );
  AOI21X1 U17 ( .A(n2), .B(n8), .C(n3), .Y(n7) );
  INVX1 U18 ( .A(count_out[0]), .Y(n2) );
  NAND2X1 U19 ( .A(n15), .B(count_out[2]), .Y(n17) );
  INVX1 U20 ( .A(n21), .Y(n15) );
  NAND3X1 U21 ( .A(count_out[1]), .B(count_out[0]), .C(n8), .Y(n21) );
  OAI21X1 U22 ( .A(n22), .B(n23), .C(n24), .Y(n48) );
  OAI21X1 U23 ( .A(n25), .B(n3), .C(rollover_flag), .Y(n24) );
  NOR2X1 U24 ( .A(clear), .B(n4), .Y(n25) );
  INVX1 U25 ( .A(n26), .Y(n4) );
  NAND3X1 U26 ( .A(n27), .B(n8), .C(n28), .Y(n23) );
  MUX2X1 U27 ( .B(n29), .A(n30), .S(n31), .Y(n28) );
  NOR2X1 U28 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n30) );
  OAI21X1 U29 ( .A(rollover_val[0]), .B(n32), .C(n33), .Y(n29) );
  INVX1 U30 ( .A(n20), .Y(n8) );
  NAND3X1 U31 ( .A(n34), .B(n5), .C(n26), .Y(n20) );
  NAND3X1 U32 ( .A(n35), .B(n33), .C(n36), .Y(n26) );
  AOI21X1 U33 ( .A(rollover_val[1]), .B(n32), .C(n37), .Y(n36) );
  INVX1 U34 ( .A(n38), .Y(n33) );
  OAI21X1 U35 ( .A(rollover_val[1]), .B(n32), .C(n39), .Y(n38) );
  XNOR2X1 U36 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n35) );
  INVX1 U37 ( .A(clear), .Y(n5) );
  INVX1 U38 ( .A(n3), .Y(n34) );
  NOR2X1 U39 ( .A(count_enable), .B(clear), .Y(n3) );
  XOR2X1 U40 ( .A(n40), .B(count_out[3]), .Y(n27) );
  OAI21X1 U41 ( .A(rollover_val[2]), .B(n41), .C(rollover_val[3]), .Y(n40) );
  INVX1 U42 ( .A(n31), .Y(n41) );
  NAND3X1 U43 ( .A(n37), .B(n42), .C(n43), .Y(n22) );
  OAI21X1 U44 ( .A(n39), .B(n32), .C(n31), .Y(n43) );
  NOR2X1 U45 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n31) );
  XOR2X1 U46 ( .A(n19), .B(rollover_val[2]), .Y(n39) );
  INVX1 U47 ( .A(count_out[2]), .Y(n19) );
  NAND3X1 U48 ( .A(rollover_val[1]), .B(n32), .C(rollover_val[0]), .Y(n42) );
  INVX1 U49 ( .A(count_out[1]), .Y(n32) );
  XOR2X1 U50 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n37) );
endmodule


module timer ( clk, n_rst, rcving, d_edge, bit_stuff_det, shift_enable, 
        byte_received );
  input clk, n_rst, rcving, d_edge, bit_stuff_det;
  output shift_enable, byte_received;
  wire   \ctrl[0] , clk_pulse, rollover_1, cnt_en, N43, handler_state, _0_net_,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23;
  wire   [1:0] nxt_ctrl;

  DFFSR \ctrl_reg[0]  ( .D(nxt_ctrl[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \ctrl[0] ) );
  DFFSR \ctrl_reg[1]  ( .D(nxt_ctrl[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cnt_en) );
  DFFSR handler_state_reg ( .D(n14), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        handler_state) );
  flex_counter_NUM_CNT_BITS4_1 clkdiv ( .clk(clk), .n_rst(n_rst), .clear(n23), 
        .count_enable(cnt_en), .rollover_val({N43, 1'b0, rollover_1, 1'b0}), 
        .rollover_flag(clk_pulse) );
  flex_counter_NUM_CNT_BITS4_0 bitcnt ( .clk(clk), .n_rst(n_rst), .clear(
        _0_net_), .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0}), .rollover_flag(byte_received) );
  NOR2X1 U23 ( .A(handler_state), .B(n15), .Y(shift_enable) );
  AND2X1 U24 ( .A(rcving), .B(n16), .Y(nxt_ctrl[1]) );
  OAI21X1 U25 ( .A(d_edge), .B(n23), .C(n17), .Y(n16) );
  INVX1 U26 ( .A(rollover_1), .Y(n17) );
  XNOR2X1 U27 ( .A(\ctrl[0] ), .B(n23), .Y(rollover_1) );
  OAI21X1 U28 ( .A(n18), .B(n19), .C(n20), .Y(nxt_ctrl[0]) );
  NAND3X1 U29 ( .A(n23), .B(n21), .C(d_edge), .Y(n20) );
  AOI21X1 U30 ( .A(clk_pulse), .B(cnt_en), .C(N43), .Y(n18) );
  INVX1 U31 ( .A(n22), .Y(n14) );
  MUX2X1 U32 ( .B(bit_stuff_det), .A(n15), .S(handler_state), .Y(n22) );
  INVX1 U33 ( .A(clk_pulse), .Y(n15) );
  OR2X1 U34 ( .A(byte_received), .B(n19), .Y(_0_net_) );
  INVX1 U35 ( .A(rcving), .Y(n19) );
  NOR2X1 U36 ( .A(n21), .B(n23), .Y(N43) );
  INVX1 U37 ( .A(cnt_en), .Y(n23) );
  INVX1 U38 ( .A(\ctrl[0] ), .Y(n21) );
endmodule

