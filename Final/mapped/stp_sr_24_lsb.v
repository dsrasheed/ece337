/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Dec  5 19:21:45 2020
/////////////////////////////////////////////////////////////


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

