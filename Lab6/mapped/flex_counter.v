/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Oct  3 18:40:42 2020
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N18, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83;

  DFFSR \count_out_reg[0]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(N18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI22X1 U40 ( .A(n44), .B(n45), .C(n46), .D(n47), .Y(n43) );
  OAI21X1 U41 ( .A(n48), .B(n45), .C(n49), .Y(n42) );
  MUX2X1 U42 ( .B(n50), .A(n51), .S(n52), .Y(n49) );
  NOR2X1 U43 ( .A(clear), .B(n46), .Y(n51) );
  NOR2X1 U44 ( .A(n47), .B(n53), .Y(n50) );
  OAI21X1 U45 ( .A(n54), .B(n45), .C(n55), .Y(n41) );
  MUX2X1 U46 ( .B(n56), .A(n57), .S(n58), .Y(n55) );
  NOR2X1 U47 ( .A(n47), .B(n59), .Y(n57) );
  AND2X1 U48 ( .A(n60), .B(n59), .Y(n56) );
  INVX1 U49 ( .A(count_out[2]), .Y(n54) );
  OAI22X1 U50 ( .A(n61), .B(n45), .C(n62), .D(n47), .Y(n40) );
  NAND2X1 U51 ( .A(n45), .B(n60), .Y(n47) );
  INVX1 U52 ( .A(clear), .Y(n60) );
  XOR2X1 U53 ( .A(n63), .B(n64), .Y(n62) );
  NOR2X1 U54 ( .A(n58), .B(n59), .Y(n64) );
  NAND2X1 U55 ( .A(n46), .B(n52), .Y(n59) );
  AND2X1 U56 ( .A(count_out[1]), .B(n65), .Y(n52) );
  INVX1 U57 ( .A(n53), .Y(n46) );
  NAND2X1 U58 ( .A(count_out[0]), .B(n65), .Y(n53) );
  NAND2X1 U59 ( .A(count_out[2]), .B(n65), .Y(n58) );
  NAND2X1 U60 ( .A(count_out[3]), .B(n65), .Y(n63) );
  NAND3X1 U61 ( .A(n66), .B(n67), .C(n68), .Y(n65) );
  AOI21X1 U62 ( .A(rollover_val[1]), .B(n48), .C(n69), .Y(n68) );
  XNOR2X1 U63 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n67) );
  XNOR2X1 U64 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n66) );
  OR2X1 U65 ( .A(count_enable), .B(clear), .Y(n45) );
  NOR2X1 U66 ( .A(n70), .B(n71), .Y(N18) );
  NAND2X1 U67 ( .A(n72), .B(n73), .Y(n71) );
  MUX2X1 U68 ( .B(n74), .A(n69), .S(n75), .Y(n73) );
  OAI21X1 U69 ( .A(rollover_val[1]), .B(n48), .C(n76), .Y(n69) );
  NOR2X1 U70 ( .A(rollover_val[3]), .B(rollover_val[2]), .Y(n74) );
  MUX2X1 U71 ( .B(n77), .A(n78), .S(rollover_val[0]), .Y(n72) );
  OAI21X1 U72 ( .A(count_out[1]), .B(n79), .C(n44), .Y(n78) );
  INVX1 U73 ( .A(count_out[0]), .Y(n44) );
  INVX1 U74 ( .A(rollover_val[1]), .Y(n79) );
  OAI21X1 U75 ( .A(n80), .B(n48), .C(count_out[0]), .Y(n77) );
  NAND3X1 U76 ( .A(n81), .B(n82), .C(count_enable), .Y(n70) );
  OAI21X1 U77 ( .A(n76), .B(n48), .C(n80), .Y(n82) );
  INVX1 U78 ( .A(count_out[1]), .Y(n48) );
  XNOR2X1 U79 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n76) );
  XNOR2X1 U80 ( .A(n83), .B(n61), .Y(n81) );
  INVX1 U81 ( .A(count_out[3]), .Y(n61) );
  OAI21X1 U82 ( .A(rollover_val[2]), .B(n75), .C(rollover_val[3]), .Y(n83) );
  INVX1 U83 ( .A(n80), .Y(n75) );
  NOR2X1 U84 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n80) );
endmodule

