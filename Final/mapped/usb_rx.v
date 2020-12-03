/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Dec  2 18:31:53 2020
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
  wire   old_sample, new_sample, sync_phase;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  XOR2X1 U6 ( .A(old_sample), .B(new_sample), .Y(edge_detected) );
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
  wire   n14, \ctrl[0] , clk_pulse, rollover_1, cnt_en, handler_state, _0_net_,
         n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [1:0] nxt_ctrl;

  DFFSR \ctrl_reg[0]  ( .D(nxt_ctrl[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \ctrl[0] ) );
  DFFSR \ctrl_reg[1]  ( .D(nxt_ctrl[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cnt_en) );
  DFFSR handler_state_reg ( .D(1'b1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        handler_state) );
  flex_counter_NUM_CNT_BITS4_1 clkdiv ( .clk(clk), .n_rst(n_rst), .clear(n13), 
        .count_enable(cnt_en), .rollover_val({n12, 1'b0, rollover_1, 1'b0}), 
        .rollover_flag(clk_pulse) );
  flex_counter_NUM_CNT_BITS4_0 bitcnt ( .clk(clk), .n_rst(n_rst), .clear(
        _0_net_), .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0}), .rollover_flag(byte_received) );
  BUFX4 U6 ( .A(n14), .Y(shift_enable) );
  NOR2X1 U7 ( .A(handler_state), .B(n5), .Y(n14) );
  INVX1 U8 ( .A(clk_pulse), .Y(n5) );
  AND2X1 U9 ( .A(rcving), .B(n6), .Y(nxt_ctrl[1]) );
  OAI21X1 U10 ( .A(d_edge), .B(n13), .C(n7), .Y(n6) );
  INVX1 U11 ( .A(rollover_1), .Y(n7) );
  XNOR2X1 U12 ( .A(\ctrl[0] ), .B(n13), .Y(rollover_1) );
  OAI21X1 U13 ( .A(n8), .B(n9), .C(n10), .Y(nxt_ctrl[0]) );
  NAND3X1 U14 ( .A(n13), .B(n11), .C(d_edge), .Y(n10) );
  AOI21X1 U15 ( .A(clk_pulse), .B(cnt_en), .C(n12), .Y(n8) );
  NOR2X1 U16 ( .A(n11), .B(n13), .Y(n12) );
  INVX1 U17 ( .A(\ctrl[0] ), .Y(n11) );
  INVX1 U18 ( .A(cnt_en), .Y(n13) );
  AND2X1 U19 ( .A(byte_received), .B(n9), .Y(_0_net_) );
  INVX1 U20 ( .A(rcving), .Y(n9) );
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
  input [23:0] rcv_data;
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
         n122, n123, n124;
  wire   [4:0] state;

  DFFSR \state_reg[0]  ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(n133), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(n132), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(n134), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  OAI21X1 U8 ( .A(n6), .B(n7), .C(n8), .Y(rcving) );
  MUX2X1 U9 ( .B(n9), .A(n10), .S(state[3]), .Y(n8) );
  NOR2X1 U10 ( .A(state[2]), .B(n11), .Y(n9) );
  NOR2X1 U11 ( .A(n12), .B(n13), .Y(r_error) );
  OAI21X1 U12 ( .A(n14), .B(n15), .C(n16), .Y(n13) );
  NOR2X1 U13 ( .A(state[4]), .B(n7), .Y(n14) );
  NOR2X1 U14 ( .A(n6), .B(n17), .Y(pid_save) );
  OR2X1 U15 ( .A(n16), .B(n18), .Y(n17) );
  INVX1 U16 ( .A(n19), .Y(w_enable) );
  OAI21X1 U17 ( .A(n20), .B(n21), .C(n22), .Y(n135) );
  OAI21X1 U18 ( .A(n23), .B(n24), .C(n25), .Y(n22) );
  OR2X1 U19 ( .A(n26), .B(n27), .Y(n24) );
  OAI21X1 U20 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  OAI22X1 U21 ( .A(n31), .B(n32), .C(state[3]), .D(n33), .Y(n26) );
  NAND3X1 U22 ( .A(n34), .B(n35), .C(n36), .Y(n23) );
  NOR2X1 U23 ( .A(n37), .B(n38), .Y(n36) );
  NAND2X1 U24 ( .A(n39), .B(n19), .Y(n38) );
  INVX1 U25 ( .A(n40), .Y(n37) );
  OAI21X1 U26 ( .A(n41), .B(n42), .C(n11), .Y(n34) );
  OAI21X1 U27 ( .A(n20), .B(n7), .C(n43), .Y(n134) );
  OAI21X1 U28 ( .A(n44), .B(n45), .C(n25), .Y(n43) );
  NAND3X1 U29 ( .A(n46), .B(n28), .C(n47), .Y(n45) );
  NAND2X1 U30 ( .A(n48), .B(n30), .Y(n44) );
  INVX1 U31 ( .A(n49), .Y(n30) );
  AOI22X1 U32 ( .A(n50), .B(n51), .C(byte_received), .D(pid_reset), .Y(n48) );
  OAI21X1 U33 ( .A(n20), .B(n12), .C(n52), .Y(n133) );
  AOI22X1 U34 ( .A(n53), .B(n54), .C(n25), .D(n55), .Y(n52) );
  NAND3X1 U35 ( .A(n56), .B(n47), .C(n57), .Y(n55) );
  NOR2X1 U36 ( .A(n58), .B(n59), .Y(n57) );
  OAI22X1 U37 ( .A(n60), .B(n61), .C(n46), .D(n31), .Y(n59) );
  AND2X1 U38 ( .A(n62), .B(n40), .Y(n46) );
  OAI21X1 U39 ( .A(n63), .B(n64), .C(pid_reset), .Y(n61) );
  NAND3X1 U40 ( .A(n65), .B(n66), .C(n67), .Y(n64) );
  INVX1 U41 ( .A(n68), .Y(n67) );
  INVX1 U42 ( .A(rcv_data[18]), .Y(n66) );
  NAND3X1 U43 ( .A(n69), .B(n70), .C(n71), .Y(n63) );
  INVX1 U44 ( .A(rcv_data[19]), .Y(n71) );
  INVX1 U45 ( .A(rcv_data[23]), .Y(n70) );
  OAI21X1 U46 ( .A(eop), .B(n72), .C(n73), .Y(n58) );
  INVX1 U47 ( .A(n74), .Y(n47) );
  OAI22X1 U48 ( .A(n31), .B(n39), .C(n75), .D(n76), .Y(n74) );
  AOI21X1 U49 ( .A(n51), .B(n77), .C(n49), .Y(n56) );
  OAI21X1 U50 ( .A(n12), .B(n78), .C(n79), .Y(n49) );
  INVX1 U51 ( .A(n80), .Y(n79) );
  AOI21X1 U52 ( .A(n81), .B(n76), .C(n31), .Y(n80) );
  NAND2X1 U53 ( .A(state[1]), .B(n11), .Y(n78) );
  NOR2X1 U54 ( .A(eop), .B(n82), .Y(n53) );
  OAI21X1 U55 ( .A(n62), .B(n60), .C(n83), .Y(n132) );
  AOI22X1 U56 ( .A(n51), .B(n84), .C(state[3]), .D(n85), .Y(n83) );
  OAI21X1 U57 ( .A(n68), .B(n86), .C(n50), .Y(n84) );
  NOR2X1 U58 ( .A(n87), .B(n88), .Y(n50) );
  INVX1 U59 ( .A(n77), .Y(n88) );
  NAND3X1 U60 ( .A(n89), .B(n90), .C(n91), .Y(n77) );
  AND2X1 U61 ( .A(rcv_data[16]), .B(rcv_data[21]), .Y(n91) );
  NOR2X1 U62 ( .A(rcv_data[20]), .B(rcv_data[17]), .Y(n89) );
  INVX1 U63 ( .A(n92), .Y(n87) );
  NAND3X1 U64 ( .A(n93), .B(n90), .C(n94), .Y(n92) );
  NOR2X1 U65 ( .A(n65), .B(n95), .Y(n94) );
  INVX1 U66 ( .A(rcv_data[17]), .Y(n65) );
  NOR2X1 U67 ( .A(rcv_data[21]), .B(rcv_data[16]), .Y(n93) );
  NAND2X1 U68 ( .A(rcv_data[17]), .B(n90), .Y(n86) );
  XOR2X1 U69 ( .A(rcv_data[19]), .B(rcv_data[23]), .Y(n90) );
  NAND3X1 U70 ( .A(n95), .B(n96), .C(rcv_data[16]), .Y(n68) );
  INVX1 U71 ( .A(rcv_data[21]), .Y(n96) );
  INVX1 U72 ( .A(rcv_data[20]), .Y(n95) );
  INVX1 U73 ( .A(n97), .Y(n51) );
  NAND3X1 U74 ( .A(n75), .B(n98), .C(byte_received), .Y(n97) );
  INVX1 U75 ( .A(n76), .Y(n98) );
  NOR2X1 U76 ( .A(n69), .B(rcv_data[18]), .Y(n75) );
  INVX1 U77 ( .A(rcv_data[22]), .Y(n69) );
  OR2X1 U78 ( .A(n99), .B(n100), .Y(n131) );
  OAI22X1 U79 ( .A(n101), .B(n60), .C(n20), .D(n10), .Y(n100) );
  INVX1 U80 ( .A(n85), .Y(n20) );
  NAND2X1 U81 ( .A(n102), .B(n25), .Y(n85) );
  INVX1 U82 ( .A(n103), .Y(n25) );
  NAND3X1 U83 ( .A(n104), .B(n105), .C(n106), .Y(n103) );
  AOI22X1 U84 ( .A(n107), .B(n29), .C(n108), .D(n109), .Y(n106) );
  INVX1 U85 ( .A(d_edge), .Y(n109) );
  INVX1 U86 ( .A(n110), .Y(n108) );
  OAI21X1 U87 ( .A(shift_enable), .B(n28), .C(n73), .Y(n107) );
  INVX1 U88 ( .A(n111), .Y(n28) );
  NAND3X1 U89 ( .A(n11), .B(n16), .C(n112), .Y(n105) );
  MUX2X1 U90 ( .B(d_edge), .A(n113), .S(state[1]), .Y(n112) );
  NAND2X1 U91 ( .A(state[2]), .B(n29), .Y(n113) );
  INVX1 U92 ( .A(eop), .Y(n29) );
  NAND3X1 U93 ( .A(n31), .B(n60), .C(n114), .Y(n104) );
  NAND2X1 U94 ( .A(eop), .B(n60), .Y(n31) );
  MUX2X1 U95 ( .B(n115), .A(n60), .S(pid_reset), .Y(n102) );
  NOR2X1 U96 ( .A(n116), .B(n117), .Y(pid_reset) );
  NOR2X1 U97 ( .A(n118), .B(n119), .Y(n115) );
  OR2X1 U98 ( .A(n114), .B(n111), .Y(n119) );
  OAI21X1 U99 ( .A(n82), .B(n33), .C(n120), .Y(n111) );
  AND2X1 U100 ( .A(n121), .B(n72), .Y(n120) );
  NAND3X1 U101 ( .A(n15), .B(state[3]), .C(n18), .Y(n72) );
  NAND3X1 U102 ( .A(n101), .B(n76), .C(n62), .Y(n114) );
  AND2X1 U103 ( .A(n32), .B(n35), .Y(n62) );
  NAND3X1 U104 ( .A(n11), .B(state[3]), .C(n18), .Y(n35) );
  NAND3X1 U105 ( .A(n15), .B(n12), .C(n42), .Y(n32) );
  INVX1 U106 ( .A(n82), .Y(n42) );
  NAND2X1 U107 ( .A(state[3]), .B(n7), .Y(n82) );
  NAND2X1 U108 ( .A(n122), .B(n11), .Y(n76) );
  INVX1 U109 ( .A(n6), .Y(n11) );
  NAND3X1 U110 ( .A(n19), .B(n110), .C(n73), .Y(n118) );
  NAND2X1 U111 ( .A(n122), .B(n15), .Y(n73) );
  NAND3X1 U112 ( .A(n123), .B(n16), .C(state[2]), .Y(n110) );
  OAI21X1 U113 ( .A(state[1]), .B(n6), .C(n116), .Y(n123) );
  NAND2X1 U114 ( .A(n21), .B(n10), .Y(n6) );
  INVX1 U115 ( .A(byte_received), .Y(n60) );
  INVX1 U116 ( .A(n124), .Y(n101) );
  NAND3X1 U117 ( .A(n39), .B(n81), .C(n40), .Y(n124) );
  NAND3X1 U118 ( .A(n122), .B(n21), .C(state[4]), .Y(n40) );
  NAND3X1 U119 ( .A(state[1]), .B(state[3]), .C(n54), .Y(n81) );
  INVX1 U120 ( .A(n33), .Y(n54) );
  NAND2X1 U121 ( .A(n15), .B(state[2]), .Y(n33) );
  INVX1 U122 ( .A(n116), .Y(n15) );
  NAND2X1 U123 ( .A(state[0]), .B(n10), .Y(n116) );
  INVX1 U124 ( .A(state[4]), .Y(n10) );
  NAND3X1 U125 ( .A(n41), .B(n21), .C(state[4]), .Y(n39) );
  INVX1 U126 ( .A(state[0]), .Y(n21) );
  OAI21X1 U127 ( .A(eop), .B(n121), .C(n19), .Y(n99) );
  NAND3X1 U128 ( .A(n122), .B(state[0]), .C(state[4]), .Y(n19) );
  AND2X1 U129 ( .A(n18), .B(n16), .Y(n122) );
  NOR2X1 U130 ( .A(n7), .B(state[2]), .Y(n18) );
  NAND3X1 U131 ( .A(n41), .B(state[0]), .C(state[4]), .Y(n121) );
  INVX1 U132 ( .A(n117), .Y(n41) );
  NAND3X1 U133 ( .A(n12), .B(n16), .C(n7), .Y(n117) );
  INVX1 U134 ( .A(state[1]), .Y(n7) );
  INVX1 U135 ( .A(state[3]), .Y(n16) );
  INVX1 U136 ( .A(state[2]), .Y(n12) );
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
        {rcv_data, endpoint, address, packet_data}), .pid_reset(pid_reset), 
        .pid_save(pid_save), .rcving(rcving), .r_error(r_error), .w_enable(
        w_enable) );
endmodule

