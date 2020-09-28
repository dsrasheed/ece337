/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Sep 27 14:33:03 2020
/////////////////////////////////////////////////////////////


module flex_stp_sr ( clk, n_rst, shift_enable, serial_in, parallel_out );
  output [3:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n8, n10, n12, n14, n1, n2, n3, n4;

  DFFSR \Q_reg[0]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \Q_reg[1]  ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \Q_reg[2]  ( .D(n10), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \Q_reg[3]  ( .D(n8), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  INVX1 U2 ( .A(n1), .Y(n8) );
  MUX2X1 U3 ( .B(parallel_out[3]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n14) );
  MUX2X1 U5 ( .B(parallel_out[0]), .A(serial_in), .S(shift_enable), .Y(n2) );
  INVX1 U6 ( .A(n3), .Y(n12) );
  MUX2X1 U7 ( .B(parallel_out[1]), .A(parallel_out[0]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n10) );
  MUX2X1 U9 ( .B(parallel_out[2]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n4) );
endmodule


module stp_sr_4_msb ( clk, n_rst, serial_in, shift_enable, parallel_out );
  output [3:0] parallel_out;
  input clk, n_rst, serial_in, shift_enable;


  flex_stp_sr CORE ( .clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), 
        .serial_in(serial_in), .parallel_out(parallel_out) );
endmodule

