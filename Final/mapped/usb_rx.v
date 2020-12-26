/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Dec  5 20:51:23 2020
/////////////////////////////////////////////////////////////


module sync_high ( clk, async_in, n_rst, sync_out );
  input clk, async_in, n_rst;
  output sync_out;
  wire   first;

  DFFSR first_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(first) );
  DFFSR second_reg ( .D(first), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out)
         );
endmodule


module sync_low ( clk, async_in, n_rst, sync_out );
  input clk, async_in, n_rst;
  output sync_out;
  wire   first;

  DFFSR first_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(first) );
  DFFSR second_reg ( .D(first), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module edge_det ( clk, n_rst, serial_in, edge_detected );
  input clk, n_rst, serial_in;
  output edge_detected;
  wire   prev;

  DFFSR prev_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(prev) );
  XOR2X1 U4 ( .A(serial_in), .B(prev), .Y(edge_detected) );
endmodule


module flex_counter_NUM_CNT_BITS3 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [2:0] rollover_val;
  output [2:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n15;

  DFFSR \count_out_reg[0]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[2]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U18 ( .A(n26), .B(n27), .C(n28), .Y(n49) );
  OAI21X1 U19 ( .A(n4), .B(n29), .C(rollover_flag), .Y(n28) );
  NAND3X1 U20 ( .A(n30), .B(n31), .C(n4), .Y(n27) );
  XNOR2X1 U21 ( .A(n32), .B(n6), .Y(n30) );
  OAI21X1 U22 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(rollover_val[2]), 
        .Y(n32) );
  NAND3X1 U23 ( .A(n2), .B(n33), .C(n34), .Y(n26) );
  XNOR2X1 U24 ( .A(n7), .B(n35), .Y(n34) );
  XNOR2X1 U25 ( .A(n9), .B(rollover_val[0]), .Y(n35) );
  NAND3X1 U26 ( .A(n9), .B(n10), .C(n15), .Y(n33) );
  OAI21X1 U27 ( .A(n36), .B(n37), .C(n38), .Y(n50) );
  OAI21X1 U28 ( .A(n39), .B(n40), .C(count_out[2]), .Y(n38) );
  NOR2X1 U29 ( .A(count_out[1]), .B(n41), .Y(n39) );
  NAND2X1 U30 ( .A(n4), .B(count_out[1]), .Y(n37) );
  NAND3X1 U31 ( .A(n2), .B(n6), .C(count_out[0]), .Y(n36) );
  OAI21X1 U32 ( .A(n1), .B(n7), .C(n42), .Y(n51) );
  NAND3X1 U33 ( .A(n8), .B(n7), .C(n43), .Y(n42) );
  NOR2X1 U34 ( .A(n29), .B(n44), .Y(n43) );
  OAI21X1 U35 ( .A(count_out[0]), .B(n41), .C(n2), .Y(n40) );
  NAND2X1 U36 ( .A(n45), .B(n8), .Y(n41) );
  OAI21X1 U37 ( .A(n3), .B(n2), .C(n46), .Y(n52) );
  NAND3X1 U38 ( .A(n2), .B(n8), .C(n44), .Y(n46) );
  NAND2X1 U39 ( .A(count_out[0]), .B(n45), .Y(n44) );
  NAND3X1 U40 ( .A(n47), .B(n5), .C(n48), .Y(n45) );
  XNOR2X1 U41 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n48) );
  XNOR2X1 U42 ( .A(count_out[0]), .B(n15), .Y(n31) );
  XNOR2X1 U43 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n47) );
  NOR2X1 U44 ( .A(clear), .B(count_enable), .Y(n29) );
  INVX2 U7 ( .A(n40), .Y(n1) );
  INVX2 U8 ( .A(n29), .Y(n2) );
  INVX2 U9 ( .A(count_out[0]), .Y(n3) );
  INVX2 U10 ( .A(n41), .Y(n4) );
  INVX2 U11 ( .A(n31), .Y(n5) );
  INVX2 U12 ( .A(count_out[2]), .Y(n6) );
  INVX2 U13 ( .A(count_out[1]), .Y(n7) );
  INVX2 U14 ( .A(clear), .Y(n8) );
  INVX2 U15 ( .A(rollover_val[1]), .Y(n9) );
  INVX2 U16 ( .A(rollover_val[2]), .Y(n10) );
  INVX2 U17 ( .A(rollover_val[0]), .Y(n15) );
endmodule


module bit_stuff_det ( clk, n_rst, d_edge, shift_enable, bit_stuff_det );
  input clk, n_rst, d_edge, shift_enable;
  output bit_stuff_det;
  wire   _0_net_;

  OR2X1 U3 ( .A(bit_stuff_det), .B(d_edge), .Y(_0_net_) );
  flex_counter_NUM_CNT_BITS3 bit_cnt ( .clk(clk), .n_rst(n_rst), .clear(
        _0_net_), .count_enable(shift_enable), .rollover_val({1'b1, 1'b1, 1'b0}), .rollover_flag(bit_stuff_det) );
endmodule


module eop_det ( d_plus_sync, d_minus_sync, eop );
  input d_plus_sync, d_minus_sync;
  output eop;


  NOR2X1 U1 ( .A(d_plus_sync), .B(d_minus_sync), .Y(eop) );
endmodule


module decoder ( clk, n_rst, d_plus_sync, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus_sync, shift_enable, eop;
  output d_orig;
  wire   prev, n3, n4, n2;

  DFFSR prev_reg ( .D(n4), .CLK(clk), .R(1'b1), .S(n_rst), .Q(prev) );
  OAI21X1 U5 ( .A(shift_enable), .B(n2), .C(n3), .Y(n4) );
  AOI21X1 U6 ( .A(shift_enable), .B(d_plus_sync), .C(eop), .Y(n3) );
  XNOR2X1 U7 ( .A(d_plus_sync), .B(prev), .Y(d_orig) );
  INVX2 U4 ( .A(prev), .Y(n2) );
endmodule


module flex_stp_sr_NUM_BITS24_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [23:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n3, n26, n28, n30, n32, n34, n36, n38, n40, n42, n44, n46, n48, n50,
         n52, n54, n56, n58, n60, n62, n64, n66, n68, n70, n72, n74, n1, n2,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n75, n76, n77, n78, n79, n80;

  DFFSR \Q_reg[23]  ( .D(n74), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[23]) );
  DFFSR \Q_reg[22]  ( .D(n72), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[22]) );
  DFFSR \Q_reg[21]  ( .D(n70), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[21]) );
  DFFSR \Q_reg[20]  ( .D(n68), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[20]) );
  DFFSR \Q_reg[19]  ( .D(n66), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[19]) );
  DFFSR \Q_reg[18]  ( .D(n64), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[18]) );
  DFFSR \Q_reg[17]  ( .D(n62), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[17]) );
  DFFSR \Q_reg[16]  ( .D(n60), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[16]) );
  DFFSR \Q_reg[15]  ( .D(n58), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[15]) );
  DFFSR \Q_reg[14]  ( .D(n56), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[14]) );
  DFFSR \Q_reg[13]  ( .D(n54), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[13]) );
  DFFSR \Q_reg[12]  ( .D(n52), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[12]) );
  DFFSR \Q_reg[11]  ( .D(n50), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[11]) );
  DFFSR \Q_reg[10]  ( .D(n48), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[10]) );
  DFFSR \Q_reg[9]  ( .D(n46), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[9]) );
  DFFSR \Q_reg[8]  ( .D(n44), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \Q_reg[7]  ( .D(n42), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \Q_reg[6]  ( .D(n40), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \Q_reg[5]  ( .D(n38), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \Q_reg[4]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \Q_reg[3]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \Q_reg[2]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \Q_reg[1]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \Q_reg[0]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  OAI21X1 U2 ( .A(n80), .B(n2), .C(n3), .Y(n28) );
  NAND2X1 U3 ( .A(parallel_out[0]), .B(n2), .Y(n3) );
  OAI22X1 U4 ( .A(n2), .B(n79), .C(n1), .D(n80), .Y(n30) );
  OAI22X1 U6 ( .A(n4), .B(n78), .C(shift_enable), .D(n79), .Y(n32) );
  OAI22X1 U8 ( .A(n4), .B(n77), .C(shift_enable), .D(n78), .Y(n34) );
  OAI22X1 U10 ( .A(n4), .B(n76), .C(shift_enable), .D(n77), .Y(n36) );
  OAI22X1 U12 ( .A(n5), .B(n75), .C(shift_enable), .D(n76), .Y(n38) );
  OAI22X1 U14 ( .A(n5), .B(n25), .C(shift_enable), .D(n75), .Y(n40) );
  OAI22X1 U16 ( .A(n5), .B(n24), .C(shift_enable), .D(n25), .Y(n42) );
  OAI22X1 U18 ( .A(n5), .B(n23), .C(shift_enable), .D(n24), .Y(n44) );
  OAI22X1 U20 ( .A(shift_enable), .B(n23), .C(n2), .D(n22), .Y(n46) );
  OAI22X1 U22 ( .A(n5), .B(n21), .C(shift_enable), .D(n22), .Y(n48) );
  OAI22X1 U24 ( .A(n5), .B(n20), .C(shift_enable), .D(n21), .Y(n50) );
  OAI22X1 U26 ( .A(n6), .B(n19), .C(n1), .D(n20), .Y(n52) );
  OAI22X1 U28 ( .A(n6), .B(n18), .C(n1), .D(n19), .Y(n54) );
  OAI22X1 U30 ( .A(n6), .B(n17), .C(n1), .D(n18), .Y(n56) );
  OAI22X1 U32 ( .A(n6), .B(n16), .C(n1), .D(n17), .Y(n58) );
  OAI22X1 U34 ( .A(n6), .B(n15), .C(n1), .D(n16), .Y(n60) );
  OAI22X1 U36 ( .A(n6), .B(n14), .C(n1), .D(n15), .Y(n62) );
  OAI22X1 U38 ( .A(n6), .B(n13), .C(n1), .D(n14), .Y(n64) );
  OAI22X1 U40 ( .A(n7), .B(n12), .C(n1), .D(n13), .Y(n66) );
  OAI22X1 U42 ( .A(n7), .B(n11), .C(n1), .D(n12), .Y(n68) );
  OAI22X1 U44 ( .A(n7), .B(n10), .C(n1), .D(n11), .Y(n70) );
  OAI22X1 U46 ( .A(n5), .B(n9), .C(n1), .D(n10), .Y(n72) );
  OAI21X1 U49 ( .A(n1), .B(n9), .C(n26), .Y(n74) );
  NAND2X1 U50 ( .A(serial_in), .B(n1), .Y(n26) );
  INVX2 U5 ( .A(n4), .Y(n1) );
  BUFX2 U7 ( .A(n8), .Y(n2) );
  BUFX2 U9 ( .A(n8), .Y(n4) );
  BUFX2 U11 ( .A(n8), .Y(n6) );
  BUFX2 U13 ( .A(n8), .Y(n5) );
  BUFX2 U15 ( .A(n8), .Y(n7) );
  INVX2 U17 ( .A(shift_enable), .Y(n8) );
  INVX2 U19 ( .A(parallel_out[23]), .Y(n9) );
  INVX2 U21 ( .A(parallel_out[22]), .Y(n10) );
  INVX2 U23 ( .A(parallel_out[21]), .Y(n11) );
  INVX2 U25 ( .A(parallel_out[20]), .Y(n12) );
  INVX2 U27 ( .A(parallel_out[19]), .Y(n13) );
  INVX2 U29 ( .A(parallel_out[18]), .Y(n14) );
  INVX2 U31 ( .A(parallel_out[17]), .Y(n15) );
  INVX2 U33 ( .A(parallel_out[16]), .Y(n16) );
  INVX2 U35 ( .A(parallel_out[15]), .Y(n17) );
  INVX2 U37 ( .A(parallel_out[14]), .Y(n18) );
  INVX2 U39 ( .A(parallel_out[13]), .Y(n19) );
  INVX2 U41 ( .A(parallel_out[12]), .Y(n20) );
  INVX2 U43 ( .A(parallel_out[11]), .Y(n21) );
  INVX2 U45 ( .A(parallel_out[10]), .Y(n22) );
  INVX2 U47 ( .A(parallel_out[9]), .Y(n23) );
  INVX2 U48 ( .A(parallel_out[8]), .Y(n24) );
  INVX2 U51 ( .A(parallel_out[7]), .Y(n25) );
  INVX2 U76 ( .A(parallel_out[6]), .Y(n75) );
  INVX2 U77 ( .A(parallel_out[5]), .Y(n76) );
  INVX2 U78 ( .A(parallel_out[4]), .Y(n77) );
  INVX2 U79 ( .A(parallel_out[3]), .Y(n78) );
  INVX2 U80 ( .A(parallel_out[2]), .Y(n79) );
  INVX2 U81 ( .A(parallel_out[1]), .Y(n80) );
endmodule


module stp_sr_24_lsb ( clk, n_rst, serial_in, shift_enable, parallel_out );
  output [23:0] parallel_out;
  input clk, n_rst, serial_in, shift_enable;


  flex_stp_sr_NUM_BITS24_SHIFT_MSB0 CORE ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_enable), .serial_in(serial_in), .parallel_out(
        parallel_out) );
endmodule


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n16, n17, n18;

  DFFSR \count_out_reg[0]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(n51), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U17 ( .A(n24), .B(n25), .C(n26), .Y(n50) );
  OAI21X1 U18 ( .A(n27), .B(n28), .C(rollover_flag), .Y(n26) );
  NOR2X1 U19 ( .A(clear), .B(n6), .Y(n27) );
  NAND3X1 U20 ( .A(n29), .B(n30), .C(n31), .Y(n25) );
  XNOR2X1 U21 ( .A(count_out[2]), .B(N7), .Y(n31) );
  XNOR2X1 U22 ( .A(count_out[3]), .B(N8), .Y(n30) );
  XNOR2X1 U23 ( .A(count_out[1]), .B(N6), .Y(n29) );
  NAND3X1 U24 ( .A(n32), .B(n33), .C(n34), .Y(n24) );
  NOR2X1 U25 ( .A(N9), .B(n6), .Y(n34) );
  XNOR2X1 U26 ( .A(count_out[0]), .B(N5), .Y(n32) );
  OAI22X1 U27 ( .A(n10), .B(n18), .C(n35), .D(n36), .Y(n51) );
  XNOR2X1 U28 ( .A(count_out[3]), .B(n37), .Y(n35) );
  NOR2X1 U29 ( .A(n17), .B(n8), .Y(n37) );
  OAI21X1 U30 ( .A(n38), .B(n17), .C(n39), .Y(n52) );
  NAND3X1 U31 ( .A(n40), .B(n17), .C(n7), .Y(n39) );
  AOI21X1 U32 ( .A(n7), .B(n8), .C(n28), .Y(n38) );
  NOR2X1 U33 ( .A(n16), .B(n9), .Y(n40) );
  OAI21X1 U34 ( .A(n41), .B(n16), .C(n42), .Y(n53) );
  NAND3X1 U35 ( .A(count_out[0]), .B(n16), .C(n7), .Y(n42) );
  AOI21X1 U36 ( .A(n7), .B(n9), .C(n28), .Y(n41) );
  NAND2X1 U37 ( .A(n33), .B(n43), .Y(n36) );
  OAI21X1 U38 ( .A(n9), .B(n18), .C(n44), .Y(n54) );
  OAI21X1 U39 ( .A(n6), .B(n9), .C(n33), .Y(n44) );
  NOR2X1 U40 ( .A(n28), .B(clear), .Y(n33) );
  NAND3X1 U41 ( .A(n45), .B(n46), .C(n47), .Y(n43) );
  NOR2X1 U42 ( .A(n48), .B(n49), .Y(n47) );
  XNOR2X1 U43 ( .A(rollover_val[0]), .B(n9), .Y(n49) );
  XNOR2X1 U44 ( .A(rollover_val[3]), .B(n10), .Y(n48) );
  XNOR2X1 U45 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n46) );
  XNOR2X1 U46 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n45) );
  NOR2X1 U47 ( .A(clear), .B(count_enable), .Y(n28) );
  NOR2X1 U8 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n2) );
  AOI21X1 U9 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n2), .Y(n1) );
  NAND2X1 U10 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1 U11 ( .A(n2), .B(n5), .C(n3), .Y(N7) );
  NOR2X1 U12 ( .A(n3), .B(rollover_val[3]), .Y(N9) );
  AOI21X1 U13 ( .A(n3), .B(rollover_val[3]), .C(N9), .Y(n4) );
  INVX2 U14 ( .A(rollover_val[2]), .Y(n5) );
  INVX2 U15 ( .A(rollover_val[0]), .Y(N5) );
  INVX2 U16 ( .A(n4), .Y(N8) );
  INVX2 U48 ( .A(n1), .Y(N6) );
  INVX2 U49 ( .A(n43), .Y(n6) );
  INVX2 U50 ( .A(n36), .Y(n7) );
  INVX2 U51 ( .A(n40), .Y(n8) );
  INVX2 U52 ( .A(count_out[0]), .Y(n9) );
  INVX2 U53 ( .A(count_out[3]), .Y(n10) );
  INVX2 U54 ( .A(count_out[1]), .Y(n16) );
  INVX2 U55 ( .A(count_out[2]), .Y(n17) );
  INVX2 U56 ( .A(n28), .Y(n18) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n16, n17,
         n18, n19, n20, n21, n22, n23, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75;

  DFFSR \count_out_reg[0]  ( .D(n19), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U17 ( .A(n75), .B(n74), .C(n73), .Y(n23) );
  OAI21X1 U18 ( .A(n72), .B(n71), .C(rollover_flag), .Y(n73) );
  NOR2X1 U19 ( .A(clear), .B(n6), .Y(n72) );
  NAND3X1 U20 ( .A(n70), .B(n69), .C(n68), .Y(n74) );
  XNOR2X1 U21 ( .A(count_out[2]), .B(N7), .Y(n68) );
  XNOR2X1 U22 ( .A(count_out[3]), .B(N8), .Y(n69) );
  XNOR2X1 U23 ( .A(count_out[1]), .B(N6), .Y(n70) );
  NAND3X1 U24 ( .A(n67), .B(n66), .C(n65), .Y(n75) );
  NOR2X1 U25 ( .A(N9), .B(n6), .Y(n65) );
  XNOR2X1 U26 ( .A(count_out[0]), .B(N5), .Y(n67) );
  OAI22X1 U27 ( .A(n10), .B(n18), .C(n64), .D(n63), .Y(n22) );
  XNOR2X1 U28 ( .A(count_out[3]), .B(n62), .Y(n64) );
  NOR2X1 U29 ( .A(n17), .B(n8), .Y(n62) );
  OAI21X1 U30 ( .A(n61), .B(n17), .C(n60), .Y(n21) );
  NAND3X1 U31 ( .A(n59), .B(n17), .C(n7), .Y(n60) );
  AOI21X1 U32 ( .A(n7), .B(n8), .C(n71), .Y(n61) );
  NOR2X1 U33 ( .A(n16), .B(n9), .Y(n59) );
  OAI21X1 U34 ( .A(n58), .B(n16), .C(n57), .Y(n20) );
  NAND3X1 U35 ( .A(count_out[0]), .B(n16), .C(n7), .Y(n57) );
  AOI21X1 U36 ( .A(n7), .B(n9), .C(n71), .Y(n58) );
  NAND2X1 U37 ( .A(n66), .B(n56), .Y(n63) );
  OAI21X1 U38 ( .A(n9), .B(n18), .C(n55), .Y(n19) );
  OAI21X1 U39 ( .A(n6), .B(n9), .C(n66), .Y(n55) );
  NOR2X1 U40 ( .A(n71), .B(clear), .Y(n66) );
  NAND3X1 U41 ( .A(n54), .B(n53), .C(n52), .Y(n56) );
  NOR2X1 U42 ( .A(n51), .B(n50), .Y(n52) );
  XNOR2X1 U43 ( .A(rollover_val[0]), .B(n9), .Y(n50) );
  XNOR2X1 U44 ( .A(rollover_val[3]), .B(n10), .Y(n51) );
  XNOR2X1 U45 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n53) );
  XNOR2X1 U46 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n54) );
  NOR2X1 U47 ( .A(clear), .B(count_enable), .Y(n71) );
  NOR2X1 U8 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n2) );
  AOI21X1 U9 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n2), .Y(n1) );
  NAND2X1 U10 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1 U11 ( .A(n2), .B(n5), .C(n3), .Y(N7) );
  NOR2X1 U12 ( .A(n3), .B(rollover_val[3]), .Y(N9) );
  AOI21X1 U13 ( .A(n3), .B(rollover_val[3]), .C(N9), .Y(n4) );
  INVX2 U14 ( .A(rollover_val[2]), .Y(n5) );
  INVX2 U15 ( .A(rollover_val[0]), .Y(N5) );
  INVX2 U16 ( .A(n1), .Y(N6) );
  INVX2 U48 ( .A(n4), .Y(N8) );
  INVX2 U49 ( .A(n56), .Y(n6) );
  INVX2 U50 ( .A(n63), .Y(n7) );
  INVX2 U51 ( .A(n59), .Y(n8) );
  INVX2 U52 ( .A(count_out[0]), .Y(n9) );
  INVX2 U53 ( .A(count_out[3]), .Y(n10) );
  INVX2 U54 ( .A(count_out[1]), .Y(n16) );
  INVX2 U55 ( .A(count_out[2]), .Y(n17) );
  INVX2 U56 ( .A(n71), .Y(n18) );
endmodule


module timer ( clk, n_rst, rcving, d_edge, bit_stuff_det, shift_enable, 
        byte_received );
  input clk, n_rst, rcving, d_edge, bit_stuff_det;
  output shift_enable, byte_received;
  wire   \ctrl[0] , clk_pulse, rollover_1, cnt_en, N43, handler_state, _0_net_,
         n10, n11, n12, n13, n14, n5, n6, n7, n8, n9, n15;
  wire   [1:0] nxt_ctrl;

  DFFSR \ctrl_reg[0]  ( .D(nxt_ctrl[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \ctrl[0] ) );
  DFFSR \ctrl_reg[1]  ( .D(nxt_ctrl[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cnt_en) );
  DFFSR handler_state_reg ( .D(n14), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        handler_state) );
  AND2X2 U7 ( .A(rcving), .B(n10), .Y(nxt_ctrl[1]) );
  OAI21X1 U14 ( .A(d_edge), .B(n6), .C(n8), .Y(n10) );
  XNOR2X1 U15 ( .A(\ctrl[0] ), .B(n9), .Y(rollover_1) );
  OAI21X1 U16 ( .A(n11), .B(n5), .C(n12), .Y(nxt_ctrl[0]) );
  NAND3X1 U17 ( .A(n7), .B(n9), .C(d_edge), .Y(n12) );
  AOI21X1 U18 ( .A(clk_pulse), .B(cnt_en), .C(N43), .Y(n11) );
  OAI21X1 U19 ( .A(clk_pulse), .B(n15), .C(n13), .Y(n14) );
  NAND2X1 U20 ( .A(bit_stuff_det), .B(n15), .Y(n13) );
  OR2X1 U21 ( .A(byte_received), .B(n5), .Y(_0_net_) );
  NOR2X1 U22 ( .A(n7), .B(n9), .Y(N43) );
  flex_counter_NUM_CNT_BITS4_1 clkdiv ( .clk(clk), .n_rst(n_rst), .clear(n9), 
        .count_enable(cnt_en), .rollover_val({N43, 1'b0, rollover_1, 1'b0}), 
        .rollover_flag(clk_pulse) );
  flex_counter_NUM_CNT_BITS4_0 bitcnt ( .clk(clk), .n_rst(n_rst), .clear(
        _0_net_), .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0}), .rollover_flag(byte_received) );
  AND2X2 U6 ( .A(n15), .B(clk_pulse), .Y(shift_enable) );
  INVX2 U8 ( .A(rcving), .Y(n5) );
  INVX2 U9 ( .A(N43), .Y(n6) );
  INVX2 U10 ( .A(\ctrl[0] ), .Y(n7) );
  INVX2 U11 ( .A(rollover_1), .Y(n8) );
  INVX2 U12 ( .A(cnt_en), .Y(n9) );
  INVX2 U13 ( .A(handler_state), .Y(n15) );
endmodule


module pid_register ( clk, n_rst, pid_reset, pid_save, pid, rx_packet );
  input [3:0] pid;
  output [3:0] rx_packet;
  input clk, n_rst, pid_reset, pid_save;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n5, n6, n7, n8, n9;

  DFFSR \rx_packet_reg[3]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[3]) );
  DFFSR \rx_packet_reg[2]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[2]) );
  DFFSR \rx_packet_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[1]) );
  DFFSR \rx_packet_reg[0]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[0]) );
  OAI21X1 U12 ( .A(n8), .B(n9), .C(n10), .Y(n14) );
  AOI21X1 U13 ( .A(rx_packet[0]), .B(n9), .C(pid_reset), .Y(n10) );
  OAI21X1 U14 ( .A(n9), .B(n7), .C(n11), .Y(n15) );
  AOI21X1 U15 ( .A(rx_packet[1]), .B(n9), .C(pid_reset), .Y(n11) );
  OAI21X1 U16 ( .A(n9), .B(n6), .C(n12), .Y(n16) );
  AOI21X1 U17 ( .A(rx_packet[2]), .B(n9), .C(pid_reset), .Y(n12) );
  OAI21X1 U18 ( .A(n9), .B(n5), .C(n13), .Y(n17) );
  AOI21X1 U19 ( .A(rx_packet[3]), .B(n9), .C(pid_reset), .Y(n13) );
  INVX2 U7 ( .A(pid[3]), .Y(n5) );
  INVX2 U8 ( .A(pid[2]), .Y(n6) );
  INVX2 U9 ( .A(pid[1]), .Y(n7) );
  INVX2 U10 ( .A(pid[0]), .Y(n8) );
  INVX2 U11 ( .A(pid_save), .Y(n9) );
endmodule


module rcu ( clk, n_rst, d_edge, eop, shift_enable, byte_received, rcv_data, 
        pid_reset, pid_save, rcving, r_error, w_enable );
  input [7:0] rcv_data;
  input clk, n_rst, d_edge, eop, shift_enable, byte_received;
  output pid_reset, pid_save, rcving, r_error, w_enable;
  wire   n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n136;
  wire   [4:0] state;

  DFFSR \state_reg[0]  ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(n133), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(n132), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(n134), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  AND2X2 U8 ( .A(n54), .B(n81), .Y(n67) );
  AND2X2 U9 ( .A(n102), .B(n85), .Y(n100) );
  AND2X2 U10 ( .A(n99), .B(n114), .Y(n54) );
  AND2X2 U11 ( .A(n9), .B(n68), .Y(n119) );
  OAI21X1 U42 ( .A(state[4]), .B(n34), .C(n37), .Y(rcving) );
  AOI22X1 U43 ( .A(n38), .B(n25), .C(n39), .D(n6), .Y(n37) );
  NOR2X1 U44 ( .A(state[3]), .B(state[2]), .Y(n38) );
  NOR2X1 U45 ( .A(n40), .B(n41), .Y(r_error) );
  OR2X1 U46 ( .A(n42), .B(state[4]), .Y(n41) );
  NOR2X1 U47 ( .A(n34), .B(n43), .Y(pid_save) );
  NAND2X1 U48 ( .A(n39), .B(n44), .Y(n43) );
  OR2X1 U49 ( .A(n45), .B(n46), .Y(n131) );
  OAI21X1 U50 ( .A(n47), .B(n48), .C(n49), .Y(n46) );
  OAI21X1 U51 ( .A(n50), .B(n51), .C(state[4]), .Y(n49) );
  OAI21X1 U52 ( .A(n20), .B(n9), .C(n36), .Y(n45) );
  OR2X1 U53 ( .A(n52), .B(n53), .Y(n132) );
  OAI22X1 U54 ( .A(n7), .B(n34), .C(n11), .D(n34), .Y(n53) );
  OAI21X1 U55 ( .A(n54), .B(n9), .C(n55), .Y(n52) );
  AOI22X1 U56 ( .A(n13), .B(n10), .C(n10), .D(n56), .Y(n55) );
  OAI21X1 U57 ( .A(n17), .B(n57), .C(n58), .Y(n56) );
  OR2X1 U58 ( .A(n59), .B(rcv_data[4]), .Y(n57) );
  OAI21X1 U59 ( .A(n7), .B(n31), .C(n60), .Y(n133) );
  OAI21X1 U60 ( .A(n61), .B(n62), .C(n7), .Y(n60) );
  OR2X1 U61 ( .A(n63), .B(n64), .Y(n62) );
  OAI21X1 U62 ( .A(n11), .B(n31), .C(n65), .Y(n64) );
  OAI22X1 U63 ( .A(n12), .B(n66), .C(n67), .D(n68), .Y(n63) );
  OR2X1 U64 ( .A(n69), .B(n70), .Y(n61) );
  OAI22X1 U65 ( .A(n48), .B(n71), .C(n22), .D(n72), .Y(n70) );
  OAI21X1 U66 ( .A(n73), .B(n74), .C(byte_received), .Y(n72) );
  NAND3X1 U67 ( .A(rcv_data[7]), .B(n17), .C(n75), .Y(n74) );
  NOR2X1 U68 ( .A(rcv_data[2]), .B(rcv_data[1]), .Y(n75) );
  NAND3X1 U69 ( .A(n16), .B(n15), .C(n76), .Y(n73) );
  NOR2X1 U70 ( .A(rcv_data[4]), .B(rcv_data[3]), .Y(n76) );
  OAI21X1 U71 ( .A(n35), .B(n40), .C(n77), .Y(n69) );
  OAI21X1 U72 ( .A(n7), .B(n35), .C(n78), .Y(n134) );
  OAI21X1 U73 ( .A(n79), .B(n80), .C(n7), .Y(n78) );
  NAND3X1 U74 ( .A(n65), .B(n19), .C(n67), .Y(n80) );
  NOR2X1 U75 ( .A(n83), .B(n84), .Y(n65) );
  OAI22X1 U76 ( .A(n85), .B(n86), .C(n87), .D(n68), .Y(n83) );
  OAI21X1 U77 ( .A(n9), .B(n22), .C(n88), .Y(n79) );
  AOI22X1 U78 ( .A(n89), .B(n10), .C(n6), .D(n50), .Y(n88) );
  NAND3X1 U79 ( .A(n27), .B(byte_received), .C(n86), .Y(n66) );
  NOR2X1 U80 ( .A(n15), .B(rcv_data[2]), .Y(n86) );
  NOR2X1 U81 ( .A(n12), .B(n13), .Y(n89) );
  NAND3X1 U82 ( .A(n14), .B(n17), .C(rcv_data[4]), .Y(n90) );
  NAND3X1 U83 ( .A(n91), .B(n16), .C(rcv_data[1]), .Y(n59) );
  NAND3X1 U84 ( .A(n92), .B(n91), .C(n93), .Y(n58) );
  NOR2X1 U85 ( .A(n17), .B(n16), .Y(n93) );
  XOR2X1 U86 ( .A(rcv_data[3]), .B(rcv_data[7]), .Y(n91) );
  NOR2X1 U87 ( .A(rcv_data[4]), .B(rcv_data[1]), .Y(n92) );
  OAI21X1 U88 ( .A(n7), .B(n23), .C(n94), .Y(n135) );
  OAI21X1 U89 ( .A(n95), .B(n96), .C(n7), .Y(n94) );
  OR2X1 U90 ( .A(n97), .B(n98), .Y(n96) );
  OAI21X1 U91 ( .A(n68), .B(n99), .C(n8), .Y(n98) );
  OAI21X1 U92 ( .A(n100), .B(n68), .C(n101), .Y(n84) );
  AOI21X1 U93 ( .A(n32), .B(n39), .C(n26), .Y(n101) );
  OAI21X1 U94 ( .A(n11), .B(n23), .C(n103), .Y(n97) );
  AOI22X1 U95 ( .A(n104), .B(n39), .C(eop), .D(n82), .Y(n103) );
  OAI22X1 U96 ( .A(byte_received), .B(n22), .C(n105), .D(n106), .Y(n50) );
  NAND3X1 U97 ( .A(n20), .B(n54), .C(n107), .Y(n106) );
  NOR2X1 U98 ( .A(n108), .B(n82), .Y(n107) );
  NAND3X1 U99 ( .A(n22), .B(n36), .C(n109), .Y(n105) );
  NOR2X1 U100 ( .A(n18), .B(n27), .Y(n109) );
  NOR2X1 U101 ( .A(n110), .B(n23), .Y(pid_reset) );
  OR2X1 U102 ( .A(n111), .B(n112), .Y(n95) );
  NAND3X1 U103 ( .A(n113), .B(n114), .C(n115), .Y(n112) );
  NAND3X1 U104 ( .A(n87), .B(n36), .C(n81), .Y(n111) );
  NAND3X1 U105 ( .A(state[0]), .B(n30), .C(n6), .Y(n36) );
  NAND3X1 U106 ( .A(n116), .B(n117), .C(n118), .Y(n51) );
  AOI21X1 U107 ( .A(n119), .B(n120), .C(n121), .Y(n118) );
  AOI21X1 U108 ( .A(n21), .B(n115), .C(d_edge), .Y(n121) );
  OR2X1 U109 ( .A(n110), .B(state[0]), .Y(n115) );
  NAND3X1 U110 ( .A(n35), .B(n31), .C(n122), .Y(n110) );
  NOR2X1 U111 ( .A(state[4]), .B(state[3]), .Y(n122) );
  OAI21X1 U112 ( .A(n40), .B(n123), .C(n113), .Y(n108) );
  NAND2X1 U113 ( .A(n124), .B(n33), .Y(n113) );
  NAND2X1 U114 ( .A(n39), .B(n35), .Y(n123) );
  NAND3X1 U115 ( .A(n54), .B(n85), .C(n20), .Y(n120) );
  NAND3X1 U116 ( .A(n87), .B(n102), .C(n81), .Y(n125) );
  NAND3X1 U117 ( .A(state[4]), .B(n23), .C(n126), .Y(n81) );
  NAND2X1 U118 ( .A(n124), .B(n32), .Y(n102) );
  NAND3X1 U119 ( .A(state[3]), .B(n6), .C(state[2]), .Y(n127) );
  NAND2X1 U120 ( .A(n42), .B(n30), .Y(n87) );
  NOR2X1 U121 ( .A(n6), .B(state[0]), .Y(n42) );
  NAND2X1 U122 ( .A(n126), .B(n39), .Y(n85) );
  NAND3X1 U123 ( .A(state[3]), .B(n39), .C(n29), .Y(n114) );
  NAND3X1 U124 ( .A(n124), .B(n31), .C(n104), .Y(n99) );
  NAND2X1 U125 ( .A(eop), .B(n9), .Y(n68) );
  NAND3X1 U126 ( .A(n48), .B(n136), .C(n82), .Y(n117) );
  NAND2X1 U127 ( .A(n47), .B(n71), .Y(n82) );
  NAND2X1 U128 ( .A(n124), .B(n28), .Y(n71) );
  AOI22X1 U129 ( .A(state[3]), .B(n29), .C(state[2]), .D(n104), .Y(n128) );
  NOR2X1 U130 ( .A(n34), .B(n6), .Y(n104) );
  NAND3X1 U131 ( .A(n30), .B(n35), .C(state[0]), .Y(n47) );
  NAND3X1 U132 ( .A(n31), .B(n34), .C(state[4]), .Y(n129) );
  NAND2X1 U133 ( .A(shift_enable), .B(n136), .Y(n48) );
  OAI21X1 U134 ( .A(n18), .B(n26), .C(n136), .Y(n116) );
  NAND3X1 U135 ( .A(n39), .B(n6), .C(n33), .Y(n130) );
  NAND2X1 U136 ( .A(state[2]), .B(n34), .Y(n40) );
  NOR2X1 U137 ( .A(state[4]), .B(state[0]), .Y(n39) );
  NAND2X1 U138 ( .A(n126), .B(n124), .Y(n77) );
  NOR2X1 U139 ( .A(n23), .B(state[4]), .Y(n124) );
  NOR2X1 U140 ( .A(n44), .B(state[3]), .Y(n126) );
  NAND2X1 U141 ( .A(n6), .B(n31), .Y(n44) );
  BUFX2 U12 ( .A(state[1]), .Y(n6) );
  INVX2 U13 ( .A(n51), .Y(n7) );
  INVX2 U14 ( .A(n84), .Y(n8) );
  INVX2 U15 ( .A(byte_received), .Y(n9) );
  INVX2 U16 ( .A(n66), .Y(n10) );
  INVX2 U17 ( .A(n50), .Y(n11) );
  INVX2 U18 ( .A(n58), .Y(n12) );
  INVX2 U19 ( .A(n90), .Y(n13) );
  INVX2 U20 ( .A(n59), .Y(n14) );
  INVX2 U21 ( .A(rcv_data[6]), .Y(n15) );
  INVX2 U22 ( .A(rcv_data[5]), .Y(n16) );
  INVX2 U23 ( .A(rcv_data[0]), .Y(n17) );
  INVX2 U24 ( .A(n77), .Y(n18) );
  INVX2 U25 ( .A(n82), .Y(n19) );
  INVX2 U26 ( .A(n125), .Y(n20) );
  INVX2 U27 ( .A(n108), .Y(n21) );
  INVX2 U28 ( .A(pid_reset), .Y(n22) );
  INVX2 U29 ( .A(state[0]), .Y(n23) );
  INVX2 U30 ( .A(n36), .Y(w_enable) );
  INVX2 U31 ( .A(n39), .Y(n25) );
  INVX2 U32 ( .A(n130), .Y(n26) );
  INVX2 U33 ( .A(n85), .Y(n27) );
  INVX2 U34 ( .A(n128), .Y(n28) );
  INVX2 U35 ( .A(n44), .Y(n29) );
  INVX2 U36 ( .A(n129), .Y(n30) );
  INVX2 U37 ( .A(state[2]), .Y(n31) );
  INVX2 U38 ( .A(n127), .Y(n32) );
  INVX2 U39 ( .A(n40), .Y(n33) );
  INVX2 U40 ( .A(state[3]), .Y(n34) );
  INVX2 U41 ( .A(n6), .Y(n35) );
  INVX2 U142 ( .A(eop), .Y(n136) );
endmodule


module usb_rx ( clk, n_rst, d_plus, d_minus, rx_packet, address, endpoint, 
        packet_data, w_enable, rcving, r_error );
  output [3:0] rx_packet;
  output [6:0] address;
  output [3:0] endpoint;
  output [7:0] packet_data;
  input clk, n_rst, d_plus, d_minus;
  output w_enable, rcving, r_error;
  wire   d_plus_sync, d_minus_sync, d_edge, shift_enable, bit_stuff_det, eop,
         d_orig, byte_received, pid_reset, pid_save;
  wire   [23:19] rcv_data;

  sync_high sync_plus ( .clk(clk), .async_in(d_plus), .n_rst(n_rst), 
        .sync_out(d_plus_sync) );
  sync_low sync_minus ( .clk(clk), .async_in(d_minus), .n_rst(n_rst), 
        .sync_out(d_minus_sync) );
  edge_det edge_detector ( .clk(clk), .n_rst(n_rst), .serial_in(d_plus_sync), 
        .edge_detected(d_edge) );
  bit_stuff_det bit_stuff_detector ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), 
        .shift_enable(shift_enable), .bit_stuff_det(bit_stuff_det) );
  eop_det eop_detector ( .d_plus_sync(d_plus_sync), .d_minus_sync(d_minus_sync), .eop(eop) );
  decoder decode ( .clk(clk), .n_rst(n_rst), .d_plus_sync(d_plus_sync), 
        .shift_enable(shift_enable), .eop(eop), .d_orig(d_orig) );
  stp_sr_24_lsb sr ( .clk(clk), .n_rst(n_rst), .serial_in(d_orig), 
        .shift_enable(shift_enable), .parallel_out({rcv_data, endpoint, 
        address, packet_data}) );
  timer t ( .clk(clk), .n_rst(n_rst), .rcving(rcving), .d_edge(d_edge), 
        .bit_stuff_det(bit_stuff_det), .shift_enable(shift_enable), 
        .byte_received(byte_received) );
  pid_register pid ( .clk(clk), .n_rst(n_rst), .pid_reset(pid_reset), 
        .pid_save(pid_save), .pid({rcv_data[19], endpoint[3:1]}), .rx_packet(
        rx_packet) );
  rcu ctrl ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), 
        .shift_enable(shift_enable), .byte_received(byte_received), .rcv_data(
        {rcv_data, endpoint[3:1]}), .pid_reset(pid_reset), .pid_save(pid_save), 
        .rcving(rcving), .r_error(r_error), .w_enable(w_enable) );
endmodule

