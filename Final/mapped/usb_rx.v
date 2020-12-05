/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Dec  4 08:11:15 2020
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
  OR2X1 U3 ( .A(bit_stuff_det), .B(d_edge), .Y(_0_net_) );
endmodule


module eop_det ( d_plus_sync, d_minus_sync, eop );
  input d_plus_sync, d_minus_sync;
  output eop;


  NOR2X1 U1 ( .A(d_plus_sync), .B(d_minus_sync), .Y(eop) );
endmodule


module decoder ( clk, n_rst, d_plus_sync, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus_sync, shift_enable, eop;
  output d_orig;
  wire   prev, n4, n2, n3;

  DFFSR prev_reg ( .D(n4), .CLK(clk), .R(1'b1), .S(n_rst), .Q(prev) );
  NAND2X1 U4 ( .A(n2), .B(n3), .Y(n4) );
  MUX2X1 U5 ( .B(prev), .A(d_plus_sync), .S(shift_enable), .Y(n3) );
  INVX1 U6 ( .A(eop), .Y(n2) );
  XNOR2X1 U7 ( .A(d_plus_sync), .B(prev), .Y(d_orig) );
endmodule


module flex_stp_sr_NUM_BITS24_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [23:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n28, n30, n32, n34, n36, n38, n40, n42, n44, n46, n48, n50, n52, n54,
         n56, n58, n60, n62, n64, n66, n68, n70, n72, n74, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24;

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
  INVX1 U2 ( .A(n1), .Y(n74) );
  MUX2X1 U3 ( .B(parallel_out[23]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n72) );
  MUX2X1 U5 ( .B(parallel_out[22]), .A(parallel_out[23]), .S(shift_enable), 
        .Y(n2) );
  INVX1 U6 ( .A(n3), .Y(n70) );
  MUX2X1 U7 ( .B(parallel_out[21]), .A(parallel_out[22]), .S(shift_enable), 
        .Y(n3) );
  INVX1 U8 ( .A(n4), .Y(n68) );
  MUX2X1 U9 ( .B(parallel_out[20]), .A(parallel_out[21]), .S(shift_enable), 
        .Y(n4) );
  INVX1 U10 ( .A(n5), .Y(n66) );
  MUX2X1 U11 ( .B(parallel_out[19]), .A(parallel_out[20]), .S(shift_enable), 
        .Y(n5) );
  INVX1 U12 ( .A(n6), .Y(n64) );
  MUX2X1 U13 ( .B(parallel_out[18]), .A(parallel_out[19]), .S(shift_enable), 
        .Y(n6) );
  INVX1 U14 ( .A(n7), .Y(n62) );
  MUX2X1 U15 ( .B(parallel_out[17]), .A(parallel_out[18]), .S(shift_enable), 
        .Y(n7) );
  INVX1 U16 ( .A(n8), .Y(n60) );
  MUX2X1 U17 ( .B(parallel_out[16]), .A(parallel_out[17]), .S(shift_enable), 
        .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n58) );
  MUX2X1 U19 ( .B(parallel_out[15]), .A(parallel_out[16]), .S(shift_enable), 
        .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n56) );
  MUX2X1 U21 ( .B(parallel_out[14]), .A(parallel_out[15]), .S(shift_enable), 
        .Y(n10) );
  INVX1 U22 ( .A(n11), .Y(n54) );
  MUX2X1 U23 ( .B(parallel_out[13]), .A(parallel_out[14]), .S(shift_enable), 
        .Y(n11) );
  INVX1 U24 ( .A(n12), .Y(n52) );
  MUX2X1 U25 ( .B(parallel_out[12]), .A(parallel_out[13]), .S(shift_enable), 
        .Y(n12) );
  INVX1 U26 ( .A(n13), .Y(n50) );
  MUX2X1 U27 ( .B(parallel_out[11]), .A(parallel_out[12]), .S(shift_enable), 
        .Y(n13) );
  INVX1 U28 ( .A(n14), .Y(n48) );
  MUX2X1 U29 ( .B(parallel_out[10]), .A(parallel_out[11]), .S(shift_enable), 
        .Y(n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(parallel_out[9]), .A(parallel_out[10]), .S(shift_enable), 
        .Y(n15) );
  INVX1 U32 ( .A(n16), .Y(n44) );
  MUX2X1 U33 ( .B(parallel_out[8]), .A(parallel_out[9]), .S(shift_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n42) );
  MUX2X1 U35 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n17) );
  INVX1 U36 ( .A(n18), .Y(n40) );
  MUX2X1 U37 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n18) );
  INVX1 U38 ( .A(n19), .Y(n38) );
  MUX2X1 U39 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n19) );
  INVX1 U40 ( .A(n20), .Y(n36) );
  MUX2X1 U41 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n20) );
  INVX1 U42 ( .A(n21), .Y(n34) );
  MUX2X1 U43 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n21) );
  INVX1 U44 ( .A(n22), .Y(n32) );
  MUX2X1 U45 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n22) );
  INVX1 U46 ( .A(n23), .Y(n30) );
  MUX2X1 U47 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n23) );
  INVX1 U48 ( .A(n24), .Y(n28) );
  MUX2X1 U49 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n24) );
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
  wire   n15, \ctrl[0] , clk_pulse, rollover_1, cnt_en, N43, handler_state,
         _0_net_, n14, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [1:0] nxt_ctrl;

  DFFSR \ctrl_reg[0]  ( .D(nxt_ctrl[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \ctrl[0] ) );
  DFFSR \ctrl_reg[1]  ( .D(nxt_ctrl[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cnt_en) );
  DFFSR handler_state_reg ( .D(n14), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        handler_state) );
  flex_counter_NUM_CNT_BITS4_1 clkdiv ( .clk(clk), .n_rst(n_rst), .clear(n13), 
        .count_enable(cnt_en), .rollover_val({N43, 1'b0, rollover_1, 1'b0}), 
        .rollover_flag(clk_pulse) );
  flex_counter_NUM_CNT_BITS4_0 bitcnt ( .clk(clk), .n_rst(n_rst), .clear(
        _0_net_), .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0}), .rollover_flag(byte_received) );
  BUFX4 U6 ( .A(n15), .Y(shift_enable) );
  NOR2X1 U7 ( .A(handler_state), .B(n5), .Y(n15) );
  AND2X1 U8 ( .A(rcving), .B(n6), .Y(nxt_ctrl[1]) );
  OAI21X1 U9 ( .A(d_edge), .B(n13), .C(n7), .Y(n6) );
  INVX1 U10 ( .A(rollover_1), .Y(n7) );
  XNOR2X1 U11 ( .A(\ctrl[0] ), .B(n13), .Y(rollover_1) );
  OAI21X1 U12 ( .A(n8), .B(n9), .C(n10), .Y(nxt_ctrl[0]) );
  NAND3X1 U13 ( .A(n13), .B(n11), .C(d_edge), .Y(n10) );
  AOI21X1 U14 ( .A(clk_pulse), .B(cnt_en), .C(N43), .Y(n8) );
  INVX1 U15 ( .A(n12), .Y(n14) );
  MUX2X1 U16 ( .B(bit_stuff_det), .A(n5), .S(handler_state), .Y(n12) );
  INVX1 U17 ( .A(clk_pulse), .Y(n5) );
  OR2X1 U18 ( .A(byte_received), .B(n9), .Y(_0_net_) );
  INVX1 U19 ( .A(rcving), .Y(n9) );
  NOR2X1 U20 ( .A(n11), .B(n13), .Y(N43) );
  INVX1 U21 ( .A(cnt_en), .Y(n13) );
  INVX1 U22 ( .A(\ctrl[0] ), .Y(n11) );
endmodule


module pid_register ( clk, n_rst, pid_reset, pid_save, pid, rx_packet );
  input [3:0] pid;
  output [3:0] rx_packet;
  input clk, n_rst, pid_reset, pid_save;
  wire   n14, n15, n16, n17, n5, n6, n7, n8, n9;

  DFFSR \rx_packet_reg[3]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[3]) );
  DFFSR \rx_packet_reg[2]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[2]) );
  DFFSR \rx_packet_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[1]) );
  DFFSR \rx_packet_reg[0]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[0]) );
  NAND2X1 U7 ( .A(n5), .B(n6), .Y(n17) );
  MUX2X1 U8 ( .B(rx_packet[3]), .A(pid[3]), .S(pid_save), .Y(n5) );
  NAND2X1 U9 ( .A(n7), .B(n6), .Y(n16) );
  MUX2X1 U10 ( .B(rx_packet[2]), .A(pid[2]), .S(pid_save), .Y(n7) );
  NAND2X1 U11 ( .A(n8), .B(n6), .Y(n15) );
  MUX2X1 U12 ( .B(rx_packet[1]), .A(pid[1]), .S(pid_save), .Y(n8) );
  NAND2X1 U13 ( .A(n9), .B(n6), .Y(n14) );
  INVX1 U14 ( .A(pid_reset), .Y(n6) );
  MUX2X1 U15 ( .B(rx_packet[0]), .A(pid[0]), .S(pid_save), .Y(n9) );
endmodule


module rcu ( clk, n_rst, d_edge, eop, shift_enable, byte_received, rcv_data, 
        pid_reset, pid_save, rcving, r_error, w_enable );
  input [7:0] rcv_data;
  input clk, n_rst, d_edge, eop, shift_enable, byte_received;
  output pid_reset, pid_save, rcving, r_error, w_enable;
  wire   n131, n132, n133, n134, n135, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130;
  wire   [4:0] state;

  DFFSR \state_reg[0]  ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(n133), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(n132), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(n134), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  OAI21X1 U8 ( .A(n6), .B(n7), .C(n8), .Y(rcving) );
  MUX2X1 U9 ( .B(n9), .A(n10), .S(state[3]), .Y(n8) );
  NOR2X1 U10 ( .A(state[2]), .B(n11), .Y(n9) );
  OAI21X1 U11 ( .A(state[4]), .B(n12), .C(n13), .Y(r_error) );
  NOR2X1 U12 ( .A(n6), .B(n14), .Y(pid_save) );
  OR2X1 U13 ( .A(n15), .B(n16), .Y(n14) );
  INVX1 U14 ( .A(n17), .Y(w_enable) );
  OAI21X1 U15 ( .A(n18), .B(n19), .C(n20), .Y(n135) );
  OAI21X1 U16 ( .A(n21), .B(n22), .C(n23), .Y(n20) );
  OR2X1 U17 ( .A(n24), .B(n25), .Y(n22) );
  OAI21X1 U18 ( .A(n6), .B(n26), .C(n27), .Y(n25) );
  OAI21X1 U19 ( .A(n28), .B(n29), .C(n30), .Y(n24) );
  AOI21X1 U20 ( .A(n31), .B(n32), .C(n33), .Y(n30) );
  NAND3X1 U21 ( .A(n34), .B(n17), .C(n35), .Y(n21) );
  NOR2X1 U22 ( .A(n36), .B(n37), .Y(n35) );
  AND2X1 U23 ( .A(n38), .B(n13), .Y(n34) );
  OAI21X1 U24 ( .A(n18), .B(n7), .C(n39), .Y(n134) );
  OAI21X1 U25 ( .A(n40), .B(n41), .C(n23), .Y(n39) );
  NAND3X1 U26 ( .A(n42), .B(n28), .C(n43), .Y(n41) );
  INVX1 U27 ( .A(n44), .Y(n42) );
  NAND2X1 U28 ( .A(n45), .B(n27), .Y(n40) );
  AOI22X1 U29 ( .A(n46), .B(n47), .C(byte_received), .D(pid_reset), .Y(n45) );
  OAI21X1 U30 ( .A(n18), .B(n48), .C(n49), .Y(n133) );
  AOI22X1 U31 ( .A(n50), .B(n29), .C(n23), .D(n51), .Y(n49) );
  NAND3X1 U32 ( .A(n52), .B(n53), .C(n54), .Y(n51) );
  NOR2X1 U33 ( .A(n55), .B(n56), .Y(n54) );
  NAND2X1 U34 ( .A(n43), .B(n27), .Y(n56) );
  INVX1 U35 ( .A(n57), .Y(n27) );
  OAI21X1 U36 ( .A(n6), .B(n58), .C(n59), .Y(n57) );
  NOR2X1 U37 ( .A(n60), .B(n61), .Y(n59) );
  INVX1 U38 ( .A(n62), .Y(n60) );
  OAI21X1 U39 ( .A(n63), .B(n64), .C(n32), .Y(n62) );
  AOI22X1 U40 ( .A(n32), .B(n36), .C(n65), .D(n64), .Y(n43) );
  OAI22X1 U41 ( .A(n66), .B(n67), .C(n68), .D(n69), .Y(n55) );
  OAI21X1 U42 ( .A(n70), .B(n71), .C(pid_reset), .Y(n69) );
  NAND3X1 U43 ( .A(rcv_data[7]), .B(n72), .C(n73), .Y(n71) );
  NOR2X1 U44 ( .A(rcv_data[2]), .B(rcv_data[1]), .Y(n73) );
  NAND3X1 U45 ( .A(n74), .B(n75), .C(n76), .Y(n70) );
  NOR2X1 U46 ( .A(rcv_data[6]), .B(rcv_data[5]), .Y(n76) );
  INVX1 U47 ( .A(rcv_data[3]), .Y(n74) );
  AND2X1 U48 ( .A(n12), .B(n77), .Y(n53) );
  AOI22X1 U49 ( .A(n78), .B(n29), .C(n32), .D(n44), .Y(n52) );
  NAND2X1 U50 ( .A(n79), .B(n80), .Y(n44) );
  INVX1 U51 ( .A(n81), .Y(n78) );
  INVX1 U52 ( .A(n82), .Y(n50) );
  OAI21X1 U53 ( .A(n79), .B(n68), .C(n83), .Y(n132) );
  AOI22X1 U54 ( .A(n47), .B(n84), .C(state[3]), .D(n85), .Y(n83) );
  OAI21X1 U55 ( .A(n86), .B(n87), .C(n46), .Y(n84) );
  NOR2X1 U56 ( .A(n88), .B(n66), .Y(n46) );
  INVX1 U57 ( .A(n89), .Y(n66) );
  NAND3X1 U58 ( .A(n90), .B(n91), .C(n92), .Y(n89) );
  NOR2X1 U59 ( .A(n72), .B(n93), .Y(n92) );
  INVX1 U60 ( .A(rcv_data[0]), .Y(n72) );
  NOR2X1 U61 ( .A(rcv_data[4]), .B(rcv_data[1]), .Y(n90) );
  INVX1 U62 ( .A(n94), .Y(n88) );
  NAND3X1 U63 ( .A(n95), .B(n91), .C(n96), .Y(n94) );
  AND2X1 U64 ( .A(rcv_data[1]), .B(rcv_data[4]), .Y(n96) );
  NOR2X1 U65 ( .A(rcv_data[5]), .B(rcv_data[0]), .Y(n95) );
  NAND2X1 U66 ( .A(rcv_data[0]), .B(rcv_data[1]), .Y(n87) );
  NAND3X1 U67 ( .A(n75), .B(n93), .C(n91), .Y(n86) );
  XOR2X1 U68 ( .A(rcv_data[3]), .B(rcv_data[7]), .Y(n91) );
  INVX1 U69 ( .A(rcv_data[5]), .Y(n93) );
  INVX1 U70 ( .A(rcv_data[4]), .Y(n75) );
  INVX1 U71 ( .A(n67), .Y(n47) );
  NAND3X1 U72 ( .A(n97), .B(n64), .C(byte_received), .Y(n67) );
  INVX1 U73 ( .A(n98), .Y(n64) );
  INVX1 U74 ( .A(n65), .Y(n97) );
  NAND2X1 U75 ( .A(rcv_data[6]), .B(n99), .Y(n65) );
  INVX1 U76 ( .A(rcv_data[2]), .Y(n99) );
  OR2X1 U77 ( .A(n100), .B(n101), .Y(n131) );
  OAI22X1 U78 ( .A(n102), .B(n68), .C(n18), .D(n10), .Y(n101) );
  INVX1 U79 ( .A(n85), .Y(n18) );
  NAND2X1 U80 ( .A(n103), .B(n23), .Y(n85) );
  AOI21X1 U81 ( .A(n29), .B(n104), .C(n105), .Y(n23) );
  INVX1 U82 ( .A(n106), .Y(n105) );
  AOI21X1 U83 ( .A(n107), .B(n108), .C(n109), .Y(n106) );
  AOI21X1 U84 ( .A(n110), .B(n38), .C(d_edge), .Y(n109) );
  NAND2X1 U85 ( .A(n111), .B(n11), .Y(n38) );
  NOR2X1 U86 ( .A(byte_received), .B(n32), .Y(n107) );
  NOR2X1 U87 ( .A(n29), .B(byte_received), .Y(n32) );
  OAI21X1 U88 ( .A(shift_enable), .B(n28), .C(n112), .Y(n104) );
  NOR2X1 U89 ( .A(n61), .B(n113), .Y(n112) );
  INVX1 U90 ( .A(n77), .Y(n113) );
  NOR2X1 U91 ( .A(n12), .B(n6), .Y(n61) );
  NAND2X1 U92 ( .A(n114), .B(state[1]), .Y(n12) );
  INVX1 U93 ( .A(n115), .Y(n28) );
  INVX1 U94 ( .A(eop), .Y(n29) );
  MUX2X1 U95 ( .B(n116), .A(n68), .S(pid_reset), .Y(n103) );
  NOR2X1 U96 ( .A(n117), .B(n118), .Y(pid_reset) );
  NOR2X1 U97 ( .A(n119), .B(n120), .Y(n116) );
  OR2X1 U98 ( .A(n108), .B(n115), .Y(n120) );
  NAND3X1 U99 ( .A(n81), .B(n121), .C(n82), .Y(n115) );
  NAND3X1 U100 ( .A(n122), .B(state[2]), .C(n123), .Y(n82) );
  NAND3X1 U101 ( .A(n122), .B(state[3]), .C(n16), .Y(n81) );
  NAND3X1 U102 ( .A(n102), .B(n98), .C(n79), .Y(n108) );
  NOR2X1 U103 ( .A(n31), .B(n33), .Y(n79) );
  INVX1 U104 ( .A(n124), .Y(n33) );
  NAND3X1 U105 ( .A(n11), .B(state[3]), .C(n16), .Y(n124) );
  INVX1 U106 ( .A(n125), .Y(n31) );
  NAND3X1 U107 ( .A(n122), .B(n48), .C(n123), .Y(n125) );
  INVX1 U108 ( .A(n26), .Y(n123) );
  NAND2X1 U109 ( .A(state[3]), .B(n7), .Y(n26) );
  NAND2X1 U110 ( .A(n126), .B(n11), .Y(n98) );
  NAND3X1 U111 ( .A(n77), .B(n17), .C(n110), .Y(n119) );
  INVX1 U112 ( .A(n127), .Y(n110) );
  OAI21X1 U113 ( .A(n128), .B(n129), .C(n13), .Y(n127) );
  NAND2X1 U114 ( .A(n122), .B(n114), .Y(n13) );
  INVX1 U115 ( .A(n128), .Y(n114) );
  NAND2X1 U116 ( .A(n11), .B(n7), .Y(n129) );
  INVX1 U117 ( .A(n6), .Y(n11) );
  NAND2X1 U118 ( .A(n19), .B(n10), .Y(n6) );
  NAND2X1 U119 ( .A(state[2]), .B(n15), .Y(n128) );
  NAND2X1 U120 ( .A(n126), .B(n122), .Y(n77) );
  INVX1 U121 ( .A(n118), .Y(n122) );
  INVX1 U122 ( .A(byte_received), .Y(n68) );
  NOR3X1 U123 ( .A(n36), .B(n63), .C(n37), .Y(n102) );
  INVX1 U124 ( .A(n80), .Y(n37) );
  NAND3X1 U125 ( .A(n126), .B(n19), .C(state[4]), .Y(n80) );
  NOR2X1 U126 ( .A(n58), .B(n118), .Y(n63) );
  NAND2X1 U127 ( .A(state[0]), .B(n10), .Y(n118) );
  INVX1 U128 ( .A(state[4]), .Y(n10) );
  NAND3X1 U129 ( .A(state[1]), .B(state[3]), .C(state[2]), .Y(n58) );
  INVX1 U130 ( .A(n130), .Y(n36) );
  NAND3X1 U131 ( .A(n111), .B(n19), .C(state[4]), .Y(n130) );
  INVX1 U132 ( .A(state[0]), .Y(n19) );
  OAI21X1 U133 ( .A(eop), .B(n121), .C(n17), .Y(n100) );
  NAND3X1 U134 ( .A(n126), .B(state[0]), .C(state[4]), .Y(n17) );
  AND2X1 U135 ( .A(n16), .B(n15), .Y(n126) );
  NOR2X1 U136 ( .A(n7), .B(state[2]), .Y(n16) );
  NAND3X1 U137 ( .A(n111), .B(state[0]), .C(state[4]), .Y(n121) );
  INVX1 U138 ( .A(n117), .Y(n111) );
  NAND3X1 U139 ( .A(n48), .B(n15), .C(n7), .Y(n117) );
  INVX1 U140 ( .A(state[1]), .Y(n7) );
  INVX1 U141 ( .A(state[3]), .Y(n15) );
  INVX1 U142 ( .A(state[2]), .Y(n48) );
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

