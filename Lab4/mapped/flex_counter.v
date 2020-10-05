/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Oct  4 11:22:01 2020
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91;

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
  MUX2X1 U48 ( .B(n54), .A(n55), .S(n56), .Y(n53) );
  OAI21X1 U49 ( .A(n57), .B(n55), .C(n58), .Y(n54) );
  MUX2X1 U50 ( .B(n59), .A(n60), .S(count_out[1]), .Y(n52) );
  NAND2X1 U51 ( .A(n61), .B(count_out[0]), .Y(n59) );
  INVX1 U52 ( .A(n62), .Y(n51) );
  MUX2X1 U53 ( .B(n63), .A(n64), .S(count_out[2]), .Y(n62) );
  MUX2X1 U54 ( .B(n65), .A(n66), .S(count_out[3]), .Y(n50) );
  AOI21X1 U55 ( .A(n61), .B(n67), .C(n64), .Y(n66) );
  OAI21X1 U56 ( .A(count_out[1]), .B(n68), .C(n60), .Y(n64) );
  AOI21X1 U57 ( .A(n55), .B(n61), .C(n56), .Y(n60) );
  INVX1 U58 ( .A(count_out[0]), .Y(n55) );
  NAND2X1 U59 ( .A(n63), .B(count_out[2]), .Y(n65) );
  INVX1 U60 ( .A(n69), .Y(n63) );
  NAND3X1 U61 ( .A(count_out[1]), .B(count_out[0]), .C(n61), .Y(n69) );
  OAI21X1 U62 ( .A(n70), .B(n71), .C(n72), .Y(n49) );
  OAI21X1 U63 ( .A(n73), .B(n56), .C(rollover_flag), .Y(n72) );
  NOR2X1 U64 ( .A(clear), .B(n57), .Y(n73) );
  INVX1 U65 ( .A(n74), .Y(n57) );
  NAND3X1 U66 ( .A(n75), .B(n61), .C(n76), .Y(n71) );
  MUX2X1 U67 ( .B(n77), .A(n78), .S(n79), .Y(n76) );
  NOR2X1 U68 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n78) );
  OAI21X1 U69 ( .A(rollover_val[0]), .B(n80), .C(n81), .Y(n77) );
  INVX1 U70 ( .A(n68), .Y(n61) );
  NAND3X1 U71 ( .A(n82), .B(n58), .C(n74), .Y(n68) );
  NAND3X1 U72 ( .A(n83), .B(n81), .C(n84), .Y(n74) );
  AOI21X1 U73 ( .A(rollover_val[1]), .B(n80), .C(n85), .Y(n84) );
  INVX1 U74 ( .A(n86), .Y(n81) );
  OAI21X1 U75 ( .A(rollover_val[1]), .B(n80), .C(n87), .Y(n86) );
  XNOR2X1 U76 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n83) );
  INVX1 U77 ( .A(clear), .Y(n58) );
  INVX1 U78 ( .A(n56), .Y(n82) );
  NOR2X1 U79 ( .A(count_enable), .B(clear), .Y(n56) );
  XOR2X1 U80 ( .A(n88), .B(count_out[3]), .Y(n75) );
  OAI21X1 U81 ( .A(rollover_val[2]), .B(n89), .C(rollover_val[3]), .Y(n88) );
  INVX1 U82 ( .A(n79), .Y(n89) );
  NAND3X1 U83 ( .A(n85), .B(n90), .C(n91), .Y(n70) );
  OAI21X1 U84 ( .A(n87), .B(n80), .C(n79), .Y(n91) );
  NOR2X1 U85 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n79) );
  XOR2X1 U86 ( .A(n67), .B(rollover_val[2]), .Y(n87) );
  INVX1 U87 ( .A(count_out[2]), .Y(n67) );
  NAND3X1 U88 ( .A(rollover_val[1]), .B(n80), .C(rollover_val[0]), .Y(n90) );
  INVX1 U89 ( .A(count_out[1]), .Y(n80) );
  XOR2X1 U90 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n85) );
endmodule

