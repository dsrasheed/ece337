/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Oct 11 17:24:06 2020
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, async_in, n_rst, sync_out );
  input clk, async_in, n_rst;
  output sync_out;
  wire   first;

  DFFSR first_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(first) );
  DFFSR second_reg ( .D(first), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module sync_low_0 ( clk, async_in, n_rst, sync_out );
  input clk, async_in, n_rst;
  output sync_out;
  wire   first;

  DFFSR first_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(first) );
  DFFSR second_reg ( .D(first), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, err, modwait, 
        op, src1, src2, dest );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, err, modwait;
  wire   n167, nxt_mod, n128, n129, n130, n131, n132, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n33, n34, n35, n36, n37, n38, cnt_up,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163;
  wire   [4:0] state;
  assign src1[3] = cnt_up;

  DFFSR \state_reg[0]  ( .D(n132), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[3]  ( .D(n130), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[4]  ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  DFFSR \state_reg[2]  ( .D(n129), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(n128), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR modwait_reg ( .D(nxt_mod), .CLK(clk), .R(n_rst), .S(1'b1), .Q(modwait)
         );
  INVX4 U9 ( .A(state[4]), .Y(n113) );
  INVX2 U10 ( .A(n34), .Y(n35) );
  INVX1 U11 ( .A(n55), .Y(n7) );
  INVX1 U12 ( .A(n55), .Y(n12) );
  INVX2 U13 ( .A(n167), .Y(n31) );
  INVX1 U14 ( .A(n140), .Y(n8) );
  INVX2 U15 ( .A(n44), .Y(n45) );
  INVX2 U16 ( .A(state[1]), .Y(n44) );
  AND2X2 U17 ( .A(state[3]), .B(n35), .Y(n9) );
  AND2X2 U18 ( .A(n115), .B(n114), .Y(n10) );
  INVX4 U19 ( .A(n31), .Y(src1[2]) );
  BUFX2 U20 ( .A(state[2]), .Y(n11) );
  INVX1 U21 ( .A(state[2]), .Y(n43) );
  BUFX2 U22 ( .A(n138), .Y(n13) );
  INVX1 U23 ( .A(overflow), .Y(n14) );
  INVX1 U24 ( .A(n14), .Y(n15) );
  INVX1 U25 ( .A(n117), .Y(n121) );
  INVX2 U26 ( .A(n19), .Y(n16) );
  INVX1 U27 ( .A(n44), .Y(n17) );
  INVX2 U28 ( .A(n43), .Y(n18) );
  INVX2 U29 ( .A(n50), .Y(n30) );
  BUFX2 U30 ( .A(overflow), .Y(n19) );
  AND2X1 U31 ( .A(n22), .B(n20), .Y(n41) );
  INVX1 U32 ( .A(n113), .Y(n20) );
  OR2X1 U33 ( .A(n106), .B(n23), .Y(n21) );
  NAND2X1 U34 ( .A(n21), .B(n105), .Y(n129) );
  INVX1 U35 ( .A(n151), .Y(n68) );
  INVX1 U36 ( .A(n27), .Y(n22) );
  INVX2 U37 ( .A(n22), .Y(n23) );
  INVX1 U38 ( .A(n48), .Y(n24) );
  INVX1 U39 ( .A(n17), .Y(n25) );
  INVX1 U40 ( .A(n135), .Y(n136) );
  INVX1 U41 ( .A(n126), .Y(n133) );
  AND2X2 U42 ( .A(n34), .B(n48), .Y(n26) );
  INVX1 U43 ( .A(n26), .Y(n98) );
  INVX2 U44 ( .A(n11), .Y(n27) );
  INVX2 U45 ( .A(n127), .Y(n28) );
  INVX1 U46 ( .A(n25), .Y(n29) );
  OR2X2 U47 ( .A(n38), .B(n147), .Y(src2[1]) );
  INVX1 U48 ( .A(n147), .Y(n154) );
  INVX1 U49 ( .A(n35), .Y(n88) );
  INVX1 U50 ( .A(n55), .Y(n33) );
  INVX2 U51 ( .A(state[0]), .Y(n34) );
  INVX2 U52 ( .A(n94), .Y(n36) );
  BUFX2 U53 ( .A(n30), .Y(n37) );
  NAND2X1 U54 ( .A(n46), .B(n151), .Y(n38) );
  AND2X2 U55 ( .A(n139), .B(n135), .Y(n46) );
  AND2X1 U56 ( .A(n33), .B(n26), .Y(cnt_up) );
  AND2X2 U57 ( .A(n35), .B(n48), .Y(n40) );
  INVX2 U58 ( .A(n46), .Y(src2[2]) );
  INVX1 U59 ( .A(n82), .Y(n99) );
  INVX1 U60 ( .A(n93), .Y(n94) );
  AND2X2 U61 ( .A(n9), .B(n7), .Y(n42) );
  INVX1 U62 ( .A(n42), .Y(n127) );
  INVX1 U63 ( .A(n139), .Y(n140) );
  NAND3X1 U64 ( .A(n113), .B(n44), .C(n11), .Y(n97) );
  INVX2 U65 ( .A(n97), .Y(n53) );
  INVX2 U66 ( .A(state[3]), .Y(n48) );
  NAND2X1 U67 ( .A(n53), .B(n40), .Y(n117) );
  NAND3X1 U68 ( .A(n113), .B(n45), .C(n18), .Y(n47) );
  INVX2 U69 ( .A(n47), .Y(n62) );
  NAND2X1 U70 ( .A(n26), .B(n62), .Y(n138) );
  NAND2X1 U71 ( .A(n53), .B(n9), .Y(n126) );
  NAND3X1 U72 ( .A(n117), .B(n138), .C(n126), .Y(n167) );
  NAND3X1 U73 ( .A(n20), .B(n23), .C(n48), .Y(n49) );
  INVX2 U74 ( .A(n49), .Y(n54) );
  NAND2X1 U75 ( .A(n54), .B(n88), .Y(n153) );
  INVX2 U76 ( .A(n153), .Y(n116) );
  NAND3X1 U77 ( .A(n113), .B(n43), .C(n44), .Y(n50) );
  NAND2X1 U78 ( .A(n40), .B(n37), .Y(n114) );
  NAND2X1 U79 ( .A(n62), .B(n9), .Y(n162) );
  NAND2X1 U80 ( .A(n37), .B(n26), .Y(n108) );
  NAND3X1 U81 ( .A(n114), .B(n162), .C(n108), .Y(n51) );
  INVX2 U82 ( .A(n51), .Y(n158) );
  NAND2X1 U83 ( .A(state[3]), .B(n34), .Y(n52) );
  INVX2 U84 ( .A(n52), .Y(n58) );
  NAND2X1 U85 ( .A(n53), .B(n58), .Y(n82) );
  NAND2X1 U86 ( .A(n30), .B(n58), .Y(n83) );
  NAND3X1 U87 ( .A(n158), .B(n82), .C(n83), .Y(n65) );
  NAND3X1 U88 ( .A(n40), .B(n25), .C(n41), .Y(n71) );
  NAND2X1 U89 ( .A(n35), .B(n54), .Y(n92) );
  NAND2X1 U90 ( .A(n71), .B(n92), .Y(n148) );
  INVX2 U91 ( .A(n148), .Y(n152) );
  NAND3X1 U92 ( .A(n113), .B(n45), .C(n27), .Y(n55) );
  NAND2X1 U93 ( .A(n40), .B(n33), .Y(n143) );
  NAND2X1 U94 ( .A(n58), .B(n62), .Y(n151) );
  NAND3X1 U95 ( .A(n143), .B(n151), .C(n117), .Y(n61) );
  NAND2X1 U96 ( .A(n41), .B(n26), .Y(n150) );
  INVX2 U97 ( .A(n150), .Y(n122) );
  NAND2X1 U98 ( .A(n122), .B(n25), .Y(n115) );
  AND2X2 U99 ( .A(n115), .B(n13), .Y(n57) );
  XOR2X1 U100 ( .A(n18), .B(n17), .Y(n56) );
  NAND3X1 U101 ( .A(n26), .B(n56), .C(n113), .Y(n142) );
  NAND3X1 U102 ( .A(n153), .B(n57), .C(n142), .Y(n86) );
  INVX2 U103 ( .A(n86), .Y(n59) );
  NAND2X1 U104 ( .A(n12), .B(n58), .Y(n93) );
  NAND3X1 U105 ( .A(n59), .B(n93), .C(n150), .Y(n60) );
  OR2X1 U106 ( .A(n61), .B(n60), .Y(op[0]) );
  INVX2 U107 ( .A(op[0]), .Y(n63) );
  NAND2X1 U108 ( .A(n30), .B(n9), .Y(n139) );
  NAND2X1 U109 ( .A(n40), .B(n62), .Y(n135) );
  NAND3X1 U110 ( .A(n127), .B(n46), .C(n126), .Y(n84) );
  INVX2 U111 ( .A(n84), .Y(n125) );
  NAND3X1 U112 ( .A(n152), .B(n63), .C(n125), .Y(n64) );
  OR2X1 U113 ( .A(n65), .B(n64), .Y(n107) );
  AOI21X1 U114 ( .A(n108), .B(n162), .C(dr), .Y(n67) );
  NAND2X1 U115 ( .A(lc), .B(n162), .Y(n66) );
  OAI21X1 U116 ( .A(n67), .B(n148), .C(n66), .Y(n111) );
  NAND2X1 U117 ( .A(n107), .B(n111), .Y(n87) );
  OAI21X1 U118 ( .A(n116), .B(n87), .C(n29), .Y(n80) );
  OAI21X1 U119 ( .A(n99), .B(n68), .C(n15), .Y(n69) );
  AND2X2 U120 ( .A(n69), .B(n8), .Y(n70) );
  OAI21X1 U121 ( .A(n29), .B(n92), .C(n70), .Y(n78) );
  INVX2 U122 ( .A(overflow), .Y(n146) );
  INVX2 U123 ( .A(n71), .Y(n72) );
  NOR2X1 U124 ( .A(src1[2]), .B(n72), .Y(n73) );
  OAI21X1 U125 ( .A(n146), .B(n83), .C(n73), .Y(n74) );
  INVX2 U126 ( .A(n74), .Y(n101) );
  INVX2 U127 ( .A(n114), .Y(n75) );
  NOR2X1 U128 ( .A(cnt_up), .B(n75), .Y(n76) );
  NAND3X1 U129 ( .A(n101), .B(n36), .C(n76), .Y(n77) );
  OAI21X1 U130 ( .A(n78), .B(n77), .C(n111), .Y(n79) );
  NAND2X1 U131 ( .A(n80), .B(n79), .Y(n128) );
  OAI22X1 U132 ( .A(dr), .B(n114), .C(n151), .D(n146), .Y(n81) );
  INVX2 U133 ( .A(n81), .Y(n102) );
  NAND3X1 U134 ( .A(n83), .B(n93), .C(n82), .Y(n147) );
  AOI21X1 U135 ( .A(n24), .B(n87), .C(n84), .Y(n85) );
  NAND3X1 U136 ( .A(n102), .B(n154), .C(n85), .Y(n130) );
  NOR2X1 U137 ( .A(n147), .B(n86), .Y(n91) );
  INVX2 U138 ( .A(n108), .Y(n149) );
  INVX2 U139 ( .A(n87), .Y(n106) );
  OAI21X1 U140 ( .A(n106), .B(n88), .C(n162), .Y(n89) );
  AOI21X1 U141 ( .A(dr), .B(n149), .C(n89), .Y(n90) );
  NAND3X1 U142 ( .A(n91), .B(n102), .C(n90), .Y(n132) );
  INVX2 U143 ( .A(n92), .Y(n95) );
  AOI22X1 U144 ( .A(n95), .B(n29), .C(n94), .D(n19), .Y(n96) );
  NAND3X1 U145 ( .A(n143), .B(n127), .C(n96), .Y(n104) );
  OAI21X1 U146 ( .A(n98), .B(n97), .C(n115), .Y(n120) );
  NOR2X1 U147 ( .A(n99), .B(n120), .Y(n100) );
  NAND3X1 U148 ( .A(n102), .B(n101), .C(n100), .Y(n103) );
  OAI21X1 U149 ( .A(n104), .B(n103), .C(n111), .Y(n105) );
  OAI21X1 U150 ( .A(dr), .B(n108), .C(n107), .Y(n110) );
  NAND3X1 U151 ( .A(n153), .B(n115), .C(n152), .Y(n109) );
  NOR2X1 U152 ( .A(n110), .B(n109), .Y(n112) );
  MUX2X1 U153 ( .B(n113), .A(n112), .S(n111), .Y(n131) );
  NAND2X1 U154 ( .A(n116), .B(n25), .Y(n163) );
  INVX2 U155 ( .A(n143), .Y(n118) );
  NOR2X1 U156 ( .A(n118), .B(n121), .Y(n119) );
  NAND3X1 U157 ( .A(n10), .B(n163), .C(n119), .Y(dest[0]) );
  INVX2 U158 ( .A(n120), .Y(n124) );
  NOR2X1 U159 ( .A(n122), .B(n121), .Y(n123) );
  NAND3X1 U160 ( .A(n124), .B(n125), .C(n123), .Y(dest[1]) );
  NAND3X1 U161 ( .A(n10), .B(n13), .C(n150), .Y(dest[2]) );
  NAND2X1 U162 ( .A(n125), .B(n153), .Y(dest[3]) );
  NAND2X1 U163 ( .A(n139), .B(n126), .Y(src2[0]) );
  NOR2X1 U164 ( .A(n133), .B(n28), .Y(n134) );
  NAND3X1 U165 ( .A(n154), .B(n151), .C(n134), .Y(src2[3]) );
  NOR2X1 U166 ( .A(n136), .B(n42), .Y(n137) );
  NAND3X1 U167 ( .A(n138), .B(n142), .C(n137), .Y(src1[0]) );
  NOR2X1 U168 ( .A(n42), .B(n140), .Y(n141) );
  NAND3X1 U169 ( .A(n143), .B(n142), .C(n141), .Y(src1[1]) );
  INVX2 U170 ( .A(dest[3]), .Y(n144) );
  NAND3X1 U171 ( .A(n10), .B(n144), .C(n150), .Y(op[1]) );
  INVX2 U172 ( .A(src2[3]), .Y(n145) );
  NAND2X1 U173 ( .A(n46), .B(n145), .Y(op[2]) );
  NAND2X1 U174 ( .A(n147), .B(n16), .Y(n161) );
  OAI21X1 U175 ( .A(n149), .B(n148), .C(lc), .Y(n160) );
  NAND2X1 U176 ( .A(n151), .B(n150), .Y(n156) );
  NAND3X1 U177 ( .A(n154), .B(n153), .C(n152), .Y(n155) );
  NOR2X1 U178 ( .A(n156), .B(n155), .Y(n157) );
  OAI21X1 U179 ( .A(dr), .B(n158), .C(n157), .Y(n159) );
  NAND3X1 U180 ( .A(n161), .B(n160), .C(n159), .Y(nxt_mod) );
  INVX2 U181 ( .A(n162), .Y(err) );
  INVX2 U182 ( .A(n163), .Y(clear) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n94, n95, n96, n97, n98, n99, n100;

  DFFSR \count_out_reg[0]  ( .D(n93), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n92), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n91), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n90), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR rollover_flag_reg ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U15 ( .A(n45), .B(n66), .Y(n56) );
  AOI22X1 U29 ( .A(rollover_flag), .B(n36), .C(n37), .D(n38), .Y(n35) );
  NOR2X1 U30 ( .A(n39), .B(n40), .Y(n38) );
  NAND3X1 U31 ( .A(n41), .B(n42), .C(n43), .Y(n40) );
  XOR2X1 U32 ( .A(n95), .B(N10), .Y(n43) );
  XOR2X1 U33 ( .A(n99), .B(N14), .Y(n42) );
  XOR2X1 U34 ( .A(n98), .B(N13), .Y(n41) );
  NAND3X1 U35 ( .A(n44), .B(n45), .C(n46), .Y(n39) );
  NOR2X1 U36 ( .A(N15), .B(n30), .Y(n46) );
  XOR2X1 U37 ( .A(n97), .B(N12), .Y(n44) );
  NOR2X1 U38 ( .A(n47), .B(n48), .Y(n37) );
  NAND3X1 U39 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  XOR2X1 U40 ( .A(n31), .B(N5), .Y(n51) );
  XOR2X1 U41 ( .A(n33), .B(N7), .Y(n50) );
  XOR2X1 U42 ( .A(n32), .B(N6), .Y(n49) );
  NAND3X1 U43 ( .A(n52), .B(n53), .C(n54), .Y(n47) );
  XOR2X1 U44 ( .A(n96), .B(N11), .Y(n54) );
  XOR2X1 U45 ( .A(n34), .B(N8), .Y(n53) );
  XOR2X1 U46 ( .A(n94), .B(N9), .Y(n52) );
  OAI21X1 U47 ( .A(clear), .B(n30), .C(n100), .Y(n36) );
  OAI21X1 U48 ( .A(n99), .B(n100), .C(n55), .Y(n84) );
  NAND2X1 U49 ( .A(N29), .B(n56), .Y(n55) );
  OAI21X1 U50 ( .A(n98), .B(n100), .C(n57), .Y(n85) );
  NAND2X1 U51 ( .A(N28), .B(n56), .Y(n57) );
  OAI21X1 U52 ( .A(n97), .B(n100), .C(n58), .Y(n86) );
  NAND2X1 U53 ( .A(N27), .B(n56), .Y(n58) );
  OAI21X1 U54 ( .A(n96), .B(n100), .C(n59), .Y(n87) );
  NAND2X1 U55 ( .A(N26), .B(n56), .Y(n59) );
  OAI21X1 U56 ( .A(n95), .B(n100), .C(n60), .Y(n88) );
  NAND2X1 U57 ( .A(N25), .B(n56), .Y(n60) );
  OAI21X1 U58 ( .A(n94), .B(n100), .C(n61), .Y(n89) );
  NAND2X1 U59 ( .A(N24), .B(n56), .Y(n61) );
  OAI21X1 U60 ( .A(n34), .B(n100), .C(n62), .Y(n90) );
  NAND2X1 U61 ( .A(N23), .B(n56), .Y(n62) );
  OAI21X1 U62 ( .A(n33), .B(n100), .C(n63), .Y(n91) );
  NAND2X1 U63 ( .A(N22), .B(n56), .Y(n63) );
  OAI21X1 U64 ( .A(n32), .B(n100), .C(n64), .Y(n92) );
  NAND2X1 U65 ( .A(N21), .B(n56), .Y(n64) );
  OAI21X1 U66 ( .A(n31), .B(n100), .C(n65), .Y(n93) );
  AOI22X1 U67 ( .A(n30), .B(n45), .C(N20), .D(n56), .Y(n65) );
  NOR2X1 U68 ( .A(n67), .B(clear), .Y(n45) );
  NAND2X1 U69 ( .A(n68), .B(n69), .Y(n66) );
  NOR2X1 U70 ( .A(n70), .B(n71), .Y(n69) );
  NAND2X1 U71 ( .A(n72), .B(n73), .Y(n71) );
  XOR2X1 U72 ( .A(n99), .B(rollover_val[9]), .Y(n73) );
  XOR2X1 U73 ( .A(n96), .B(rollover_val[6]), .Y(n72) );
  NAND3X1 U74 ( .A(n74), .B(n75), .C(n76), .Y(n70) );
  XOR2X1 U75 ( .A(n34), .B(rollover_val[3]), .Y(n76) );
  XOR2X1 U76 ( .A(n97), .B(rollover_val[7]), .Y(n75) );
  XOR2X1 U77 ( .A(n98), .B(rollover_val[8]), .Y(n74) );
  NOR2X1 U78 ( .A(n77), .B(n78), .Y(n68) );
  NAND2X1 U79 ( .A(n79), .B(n80), .Y(n78) );
  XOR2X1 U80 ( .A(n32), .B(rollover_val[1]), .Y(n80) );
  XOR2X1 U81 ( .A(n31), .B(rollover_val[0]), .Y(n79) );
  NAND3X1 U82 ( .A(n81), .B(n82), .C(n83), .Y(n77) );
  XOR2X1 U83 ( .A(n33), .B(rollover_val[2]), .Y(n83) );
  XOR2X1 U84 ( .A(n94), .B(rollover_val[4]), .Y(n82) );
  XOR2X1 U85 ( .A(n95), .B(rollover_val[5]), .Y(n81) );
  NOR2X1 U86 ( .A(clear), .B(count_enable), .Y(n67) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 r305 ( .A(count_out), .SUM({N29, N28, 
        N27, N26, N25, N24, N23, N22, N21, N20}) );
  INVX2 U9 ( .A(n67), .Y(n100) );
  NOR2X1 U16 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n2) );
  NAND2X1 U17 ( .A(n2), .B(n26), .Y(n3) );
  NOR2X1 U18 ( .A(n3), .B(rollover_val[3]), .Y(n5) );
  NAND2X1 U19 ( .A(n5), .B(n25), .Y(n6) );
  NOR2X1 U20 ( .A(n6), .B(rollover_val[5]), .Y(n8) );
  NAND2X1 U21 ( .A(n8), .B(n28), .Y(n9) );
  NOR2X1 U22 ( .A(n9), .B(rollover_val[7]), .Y(n22) );
  NAND2X1 U23 ( .A(n22), .B(n27), .Y(n23) );
  NOR2X1 U24 ( .A(n23), .B(rollover_val[9]), .Y(N15) );
  AOI21X1 U25 ( .A(rollover_val[0]), .B(rollover_val[1]), .C(n2), .Y(n1) );
  OAI21X1 U26 ( .A(n2), .B(n26), .C(n3), .Y(N7) );
  AOI21X1 U27 ( .A(n3), .B(rollover_val[3]), .C(n5), .Y(n4) );
  OAI21X1 U28 ( .A(n5), .B(n25), .C(n6), .Y(N9) );
  AOI21X1 U87 ( .A(n6), .B(rollover_val[5]), .C(n8), .Y(n7) );
  OAI21X1 U88 ( .A(n8), .B(n28), .C(n9), .Y(N11) );
  AOI21X1 U89 ( .A(n9), .B(rollover_val[7]), .C(n22), .Y(n10) );
  OAI21X1 U90 ( .A(n22), .B(n27), .C(n23), .Y(N13) );
  AOI21X1 U91 ( .A(n23), .B(rollover_val[9]), .C(N15), .Y(n24) );
  INVX2 U92 ( .A(rollover_val[4]), .Y(n25) );
  INVX2 U93 ( .A(rollover_val[2]), .Y(n26) );
  INVX2 U94 ( .A(rollover_val[0]), .Y(N5) );
  INVX2 U95 ( .A(n1), .Y(N6) );
  INVX2 U96 ( .A(rollover_val[8]), .Y(n27) );
  INVX2 U97 ( .A(rollover_val[6]), .Y(n28) );
  INVX2 U98 ( .A(n7), .Y(N10) );
  INVX2 U99 ( .A(n10), .Y(N12) );
  INVX2 U100 ( .A(n24), .Y(N14) );
  INVX2 U101 ( .A(n4), .Y(N8) );
  INVX2 U102 ( .A(n35), .Y(n29) );
  INVX2 U103 ( .A(n66), .Y(n30) );
  INVX2 U104 ( .A(count_out[0]), .Y(n31) );
  INVX2 U105 ( .A(count_out[1]), .Y(n32) );
  INVX2 U106 ( .A(count_out[2]), .Y(n33) );
  INVX2 U107 ( .A(count_out[3]), .Y(n34) );
  INVX2 U108 ( .A(count_out[4]), .Y(n94) );
  INVX2 U109 ( .A(count_out[5]), .Y(n95) );
  INVX2 U110 ( .A(count_out[6]), .Y(n96) );
  INVX2 U111 ( .A(count_out[7]), .Y(n97) );
  INVX2 U112 ( .A(count_out[8]), .Y(n98) );
  INVX2 U113 ( .A(count_out[9]), .Y(n99) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 count ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n27, n29, n30, n31, n32, n33, n35,
         n37, n38, n39, n40, n41, n43, n45, n46, n47, n48, n49, n51, n53, n54,
         n55, n56, n57, n59, n61, n62, n63, n64, n65, n67, n69, n70, n71, n72,
         n74, n76, n78, n80, n82, n84, n86, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n105, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193;

  XNOR2X1 U5 ( .A(n22), .B(n1), .Y(DIFF[14]) );
  AOI21X1 U6 ( .A(n22), .B(n174), .C(n19), .Y(n17) );
  NAND2X1 U9 ( .A(n21), .B(n174), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(n90), .Y(n21) );
  XOR2X1 U13 ( .A(n176), .B(n2), .Y(DIFF[13]) );
  OAI21X1 U14 ( .A(n25), .B(n23), .C(n24), .Y(n22) );
  NAND2X1 U15 ( .A(n24), .B(n76), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(n91), .Y(n23) );
  NAND2X1 U18 ( .A(A[13]), .B(n91), .Y(n24) );
  XNOR2X1 U19 ( .A(n167), .B(n3), .Y(DIFF[12]) );
  AOI21X1 U20 ( .A(n193), .B(n30), .C(n27), .Y(n25) );
  NAND2X1 U23 ( .A(n29), .B(n193), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(n92), .Y(n29) );
  XOR2X1 U27 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  OAI21X1 U28 ( .A(n33), .B(n31), .C(n32), .Y(n30) );
  NAND2X1 U29 ( .A(n32), .B(n78), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(n93), .Y(n31) );
  NAND2X1 U32 ( .A(A[11]), .B(n93), .Y(n32) );
  AOI21X1 U34 ( .A(n190), .B(n38), .C(n35), .Y(n33) );
  NAND2X1 U37 ( .A(n37), .B(n190), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(n94), .Y(n37) );
  XOR2X1 U41 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  OAI21X1 U42 ( .A(n41), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U43 ( .A(n40), .B(n80), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(n95), .Y(n39) );
  NAND2X1 U46 ( .A(A[9]), .B(n95), .Y(n40) );
  XNOR2X1 U47 ( .A(n46), .B(n7), .Y(DIFF[8]) );
  AOI21X1 U48 ( .A(n192), .B(n46), .C(n43), .Y(n41) );
  NAND2X1 U51 ( .A(n45), .B(n192), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(n96), .Y(n45) );
  XOR2X1 U55 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  OAI21X1 U56 ( .A(n49), .B(n47), .C(n48), .Y(n46) );
  NAND2X1 U57 ( .A(n48), .B(n82), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(n97), .Y(n47) );
  NAND2X1 U60 ( .A(A[7]), .B(n97), .Y(n48) );
  XNOR2X1 U61 ( .A(n54), .B(n9), .Y(DIFF[6]) );
  AOI21X1 U62 ( .A(n191), .B(n54), .C(n51), .Y(n49) );
  NAND2X1 U65 ( .A(n53), .B(n191), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(n98), .Y(n53) );
  XOR2X1 U69 ( .A(n57), .B(n10), .Y(DIFF[5]) );
  OAI21X1 U70 ( .A(n57), .B(n55), .C(n56), .Y(n54) );
  NAND2X1 U71 ( .A(n56), .B(n84), .Y(n10) );
  NOR2X1 U73 ( .A(A[5]), .B(n99), .Y(n55) );
  NAND2X1 U74 ( .A(A[5]), .B(n99), .Y(n56) );
  AOI21X1 U76 ( .A(n189), .B(n62), .C(n59), .Y(n57) );
  NAND2X1 U79 ( .A(n61), .B(n189), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(n100), .Y(n61) );
  OAI21X1 U84 ( .A(n65), .B(n63), .C(n64), .Y(n62) );
  NAND2X1 U85 ( .A(n64), .B(n86), .Y(n12) );
  NOR2X1 U87 ( .A(A[3]), .B(n101), .Y(n63) );
  NAND2X1 U88 ( .A(A[3]), .B(n101), .Y(n64) );
  AOI21X1 U90 ( .A(n173), .B(n164), .C(n67), .Y(n65) );
  NAND2X1 U93 ( .A(n69), .B(n173), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(n102), .Y(n69) );
  XOR2X1 U97 ( .A(n14), .B(n171), .Y(DIFF[1]) );
  OAI21X1 U98 ( .A(n71), .B(n171), .C(n72), .Y(n70) );
  NAND2X1 U99 ( .A(n72), .B(n88), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(n103), .Y(n71) );
  NAND2X1 U102 ( .A(A[1]), .B(n103), .Y(n72) );
  XNOR2X1 U103 ( .A(n177), .B(A[0]), .Y(DIFF[0]) );
  BUFX2 U125 ( .A(n172), .Y(n171) );
  OAI21X1 U126 ( .A(n71), .B(n171), .C(n72), .Y(n164) );
  BUFX2 U127 ( .A(n62), .Y(n165) );
  BUFX2 U128 ( .A(n38), .Y(n166) );
  BUFX2 U129 ( .A(n30), .Y(n167) );
  NAND2X1 U130 ( .A(n74), .B(n89), .Y(n168) );
  NAND2X1 U131 ( .A(n74), .B(A[15]), .Y(n169) );
  NAND2X1 U132 ( .A(n89), .B(A[15]), .Y(n170) );
  NAND3X1 U133 ( .A(n169), .B(n168), .C(n170), .Y(n184) );
  INVX2 U134 ( .A(n17), .Y(n74) );
  INVX2 U135 ( .A(B[0]), .Y(n177) );
  NOR2X1 U136 ( .A(A[0]), .B(n177), .Y(n172) );
  OR2X2 U137 ( .A(A[2]), .B(n102), .Y(n173) );
  OR2X2 U138 ( .A(A[14]), .B(n90), .Y(n174) );
  INVX1 U139 ( .A(B[5]), .Y(n99) );
  INVX1 U140 ( .A(n25), .Y(n175) );
  INVX2 U141 ( .A(n175), .Y(n176) );
  INVX1 U142 ( .A(n71), .Y(n88) );
  INVX1 U143 ( .A(n65), .Y(n178) );
  INVX2 U144 ( .A(n178), .Y(n179) );
  INVX1 U145 ( .A(B[8]), .Y(n96) );
  INVX1 U146 ( .A(B[3]), .Y(n101) );
  INVX1 U147 ( .A(B[7]), .Y(n97) );
  INVX1 U148 ( .A(B[13]), .Y(n91) );
  INVX1 U149 ( .A(B[11]), .Y(n93) );
  XOR2X1 U150 ( .A(n89), .B(A[15]), .Y(n180) );
  XOR2X1 U151 ( .A(n74), .B(n180), .Y(DIFF[15]) );
  NAND2X1 U152 ( .A(n74), .B(n89), .Y(n181) );
  NAND2X1 U153 ( .A(n74), .B(A[15]), .Y(n182) );
  NAND2X1 U154 ( .A(n89), .B(A[15]), .Y(n183) );
  NAND3X1 U155 ( .A(n182), .B(n181), .C(n183), .Y(n16) );
  INVX1 U156 ( .A(B[10]), .Y(n94) );
  XOR2X1 U157 ( .A(B[16]), .B(n105), .Y(n185) );
  XOR2X1 U158 ( .A(n184), .B(n185), .Y(DIFF[16]) );
  NAND2X1 U159 ( .A(n16), .B(B[16]), .Y(n186) );
  NAND2X1 U160 ( .A(n16), .B(n105), .Y(n187) );
  NAND2X1 U161 ( .A(B[16]), .B(n105), .Y(n188) );
  NAND3X1 U162 ( .A(n187), .B(n186), .C(n188), .Y(n15) );
  INVX1 U163 ( .A(n63), .Y(n86) );
  XNOR2X1 U164 ( .A(n166), .B(n5), .Y(DIFF[10]) );
  XNOR2X1 U165 ( .A(n165), .B(n11), .Y(DIFF[4]) );
  XOR2X1 U166 ( .A(n179), .B(n12), .Y(DIFF[3]) );
  XNOR2X1 U167 ( .A(n70), .B(n13), .Y(DIFF[2]) );
  OR2X2 U168 ( .A(A[6]), .B(n98), .Y(n191) );
  OR2X2 U169 ( .A(A[8]), .B(n96), .Y(n192) );
  OR2X2 U170 ( .A(A[4]), .B(n100), .Y(n189) );
  OR2X2 U171 ( .A(A[12]), .B(n92), .Y(n193) );
  OR2X1 U172 ( .A(A[10]), .B(n94), .Y(n190) );
  INVX1 U173 ( .A(B[2]), .Y(n102) );
  INVX1 U174 ( .A(B[6]), .Y(n98) );
  INVX1 U175 ( .A(B[1]), .Y(n103) );
  INVX2 U176 ( .A(B[9]), .Y(n95) );
  INVX2 U177 ( .A(B[12]), .Y(n92) );
  INVX2 U178 ( .A(B[14]), .Y(n90) );
  INVX2 U179 ( .A(B[15]), .Y(n89) );
  INVX2 U180 ( .A(n55), .Y(n84) );
  INVX2 U181 ( .A(n47), .Y(n82) );
  INVX2 U182 ( .A(n39), .Y(n80) );
  INVX2 U183 ( .A(n31), .Y(n78) );
  INVX2 U184 ( .A(n23), .Y(n76) );
  INVX2 U185 ( .A(n69), .Y(n67) );
  INVX2 U186 ( .A(n61), .Y(n59) );
  INVX2 U187 ( .A(n53), .Y(n51) );
  INVX2 U188 ( .A(n45), .Y(n43) );
  INVX2 U189 ( .A(n37), .Y(n35) );
  INVX2 U190 ( .A(n29), .Y(n27) );
  INVX2 U191 ( .A(n21), .Y(n19) );
  INVX2 U192 ( .A(A[17]), .Y(n105) );
  INVX2 U193 ( .A(B[4]), .Y(n100) );
  INVX2 U194 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n90, n92, n93, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172;

  FAX1 U2 ( .A(n93), .B(n92), .C(n17), .YC(n16), .YS(SUM[16]) );
  FAX1 U3 ( .A(B[15]), .B(A[15]), .C(n76), .YC(n17), .YS(SUM[15]) );
  AOI21X1 U6 ( .A(n171), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n171), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(B[14]), .Y(n22) );
  XOR2X1 U13 ( .A(n26), .B(n2), .Y(SUM[13]) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(B[13]), .B(A[13]), .Y(n24) );
  NAND2X1 U18 ( .A(B[13]), .B(A[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n163), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n170), .B(n31), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n170), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(B[12]), .Y(n30) );
  XOR2X1 U27 ( .A(n158), .B(n4), .Y(SUM[11]) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(B[11]), .B(A[11]), .Y(n32) );
  NAND2X1 U32 ( .A(B[11]), .B(A[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n159), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n169), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n169), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(B[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n42), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(B[9]), .B(A[9]), .Y(n40) );
  NAND2X1 U46 ( .A(B[9]), .B(A[9]), .Y(n41) );
  XNOR2X1 U47 ( .A(n157), .B(n7), .Y(SUM[8]) );
  AOI21X1 U48 ( .A(n166), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n166), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(B[8]), .Y(n46) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(B[7]), .B(A[7]), .Y(n48) );
  NAND2X1 U60 ( .A(B[7]), .B(A[7]), .Y(n49) );
  XNOR2X1 U61 ( .A(n164), .B(n9), .Y(SUM[6]) );
  AOI21X1 U62 ( .A(n167), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n167), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(B[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n58), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(B[5]), .B(A[5]), .Y(n56) );
  NAND2X1 U74 ( .A(B[5]), .B(A[5]), .Y(n57) );
  XNOR2X1 U75 ( .A(n155), .B(n11), .Y(SUM[4]) );
  AOI21X1 U76 ( .A(n165), .B(n63), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n165), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(B[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n66), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(B[3]), .B(A[3]), .Y(n64) );
  NAND2X1 U88 ( .A(B[3]), .B(A[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n160), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n168), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n168), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(B[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n161), .B(n14), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n90), .Y(n14) );
  NOR2X1 U101 ( .A(B[1]), .B(A[1]), .Y(n72) );
  NAND2X1 U102 ( .A(B[1]), .B(A[1]), .Y(n73) );
  NAND2X1 U107 ( .A(A[0]), .B(B[0]), .Y(n75) );
  OR2X1 U113 ( .A(A[8]), .B(B[8]), .Y(n166) );
  OR2X2 U114 ( .A(A[0]), .B(B[0]), .Y(n172) );
  AND2X2 U115 ( .A(n161), .B(n172), .Y(SUM[0]) );
  BUFX2 U116 ( .A(n23), .Y(n153) );
  INVX1 U117 ( .A(n63), .Y(n154) );
  INVX2 U118 ( .A(n154), .Y(n155) );
  INVX1 U119 ( .A(n47), .Y(n156) );
  INVX2 U120 ( .A(n156), .Y(n157) );
  BUFX2 U121 ( .A(n34), .Y(n158) );
  BUFX2 U122 ( .A(n39), .Y(n159) );
  BUFX2 U123 ( .A(n71), .Y(n160) );
  BUFX2 U124 ( .A(n75), .Y(n161) );
  INVX1 U125 ( .A(n72), .Y(n90) );
  INVX1 U126 ( .A(n31), .Y(n162) );
  INVX2 U127 ( .A(n162), .Y(n163) );
  BUFX2 U128 ( .A(n55), .Y(n164) );
  OR2X2 U129 ( .A(A[2]), .B(B[2]), .Y(n168) );
  XNOR2X1 U130 ( .A(n153), .B(n1), .Y(SUM[14]) );
  XOR2X1 U131 ( .A(n50), .B(n8), .Y(SUM[7]) );
  OR2X2 U132 ( .A(A[6]), .B(B[6]), .Y(n167) );
  OR2X1 U133 ( .A(A[4]), .B(B[4]), .Y(n165) );
  OR2X1 U134 ( .A(A[10]), .B(B[10]), .Y(n169) );
  OR2X1 U135 ( .A(A[12]), .B(B[12]), .Y(n170) );
  OR2X1 U136 ( .A(A[14]), .B(B[14]), .Y(n171) );
  INVX2 U137 ( .A(A[17]), .Y(n93) );
  INVX2 U138 ( .A(B[17]), .Y(n92) );
  INVX2 U139 ( .A(n64), .Y(n88) );
  INVX2 U140 ( .A(n56), .Y(n86) );
  INVX2 U141 ( .A(n48), .Y(n84) );
  INVX2 U142 ( .A(n40), .Y(n82) );
  INVX2 U143 ( .A(n32), .Y(n80) );
  INVX2 U144 ( .A(n24), .Y(n78) );
  INVX2 U145 ( .A(n18), .Y(n76) );
  INVX2 U146 ( .A(n70), .Y(n68) );
  INVX2 U147 ( .A(n62), .Y(n60) );
  INVX2 U148 ( .A(n54), .Y(n52) );
  INVX2 U149 ( .A(n46), .Y(n44) );
  INVX2 U150 ( .A(n38), .Y(n36) );
  INVX2 U151 ( .A(n30), .Y(n28) );
  INVX2 U152 ( .A(n22), .Y(n20) );
  INVX2 U153 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n12, n13, n16, n18, n19, n24, n25, n31, n37, n42, n46,
         n48, n49, n51, n52, n53, n55, n58, n59, n60, n61, n62, n64, n65, n66,
         n67, n68, n69, n70, n72, n73, n74, n75, n77, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n109, n111,
         n112, n113, n114, n115, n116, n120, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n133, n134, n135, n136, n137, n140, n142,
         n144, n145, n146, n147, n148, n149, n151, n154, n155, n156, n159,
         n160, n161, n162, n163, n164, n165, n166, n169, n170, n171, n172,
         n173, n174, n177, n178, n179, n181, n182, n183, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n197, n198, n199, n200,
         n201, n202, n205, n206, n207, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n248,
         n249, n250, n251, n256, n257, n258, n259, n264, n265, n266, n267,
         n275, n279, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n545, n548, n551,
         n554, n557, n560, n563, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n736, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n768, n769, n770, n771, n772, n773, n774,
         n775, n776, n777, n778, n779, n780, n781, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874,
         n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885,
         n886, n887, n888, n889, n890, n891, n893, n896, n897, n898, n900,
         n917, n918, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053,
         n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063,
         n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073,
         n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083,
         n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093,
         n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103,
         n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113,
         n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123,
         n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133,
         n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143,
         n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153,
         n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163,
         n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173,
         n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353,
         n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  XOR2X1 U59 ( .A(n86), .B(n55), .Y(product[45]) );
  AOI21X1 U60 ( .A(n1312), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1033), .B(n1231), .Y(n74) );
  OAI21X1 U62 ( .A(n1230), .B(n1033), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NAND2X1 U71 ( .A(n85), .B(n275), .Y(n55) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  AOI21X1 U76 ( .A(n1312), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1232), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1229), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  AOI21X1 U88 ( .A(n1312), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1232), .Y(n96) );
  OAI21X1 U90 ( .A(n1230), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n137), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1204), .B(n1031), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1204), .C(n109), .Y(n107) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1312), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1232), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1228), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1031), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1031), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1031), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1312), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1232), .Y(n124) );
  OAI21X1 U124 ( .A(n1230), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n137), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  XOR2X1 U135 ( .A(n145), .B(n60), .Y(product[40]) );
  AOI21X1 U136 ( .A(n1312), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1163), .B(n1232), .Y(n135) );
  OAI21X1 U138 ( .A(n1229), .B(n1163), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1203), .B(n281), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1203), .C(n142), .Y(n140) );
  NAND2X1 U145 ( .A(n144), .B(n1203), .Y(n60) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1312), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1231), .Y(n146) );
  OAI21X1 U152 ( .A(n1228), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n281), .Y(n61) );
  NOR2X1 U159 ( .A(n339), .B(n330), .Y(n148) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  XOR2X1 U161 ( .A(n163), .B(n62), .Y(product[38]) );
  AOI21X1 U162 ( .A(n1312), .B(n155), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n1082), .B(n169), .C(n162), .Y(n160) );
  NAND2X1 U169 ( .A(n162), .B(n282), .Y(n62) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  AOI21X1 U174 ( .A(n164), .B(n1312), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1198), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1198), .C(n169), .Y(n165) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n171), .B(n1312), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n1172), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n362), .B(n373), .Y(n177) );
  NAND2X1 U194 ( .A(n362), .B(n373), .Y(n178) );
  XNOR2X1 U195 ( .A(n1312), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1312), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n194), .B(n189), .Y(n187) );
  OAI21X1 U208 ( .A(n189), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n194), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n194), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n1077), .B(n212), .C(n1036), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n1014), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n1007), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1200), .B(n1207), .Y(n223) );
  AOI21X1 U258 ( .A(n1200), .B(n1206), .C(n1201), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1205), .B(n248), .C(n1208), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1210), .C(n1212), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1211), .C(n1213), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1215), .B(n1030), .C(n1034), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n601), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n574), .B(n305), .C(n585), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n603), .B(n619), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n575), .B(n319), .C(n587), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n621), .C(n637), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n576), .B(n337), .C(n605), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n344), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U334 ( .A(n355), .B(n346), .C(n353), .YC(n341), .YS(n342) );
  FAX1 U335 ( .A(n591), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n655), .YC(n345), .YS(n346) );
  FAX1 U338 ( .A(n354), .B(n352), .C(n363), .YC(n349), .YS(n350) );
  FAX1 U340 ( .A(n371), .B(n1000), .C(n358), .YC(n353), .YS(n354) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n1100), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U348 ( .A(n609), .B(n673), .C(n657), .YC(n369), .YS(n370) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U352 ( .A(n395), .B(n384), .C(n382), .YC(n377), .YS(n378) );
  FAX1 U354 ( .A(n658), .B(n610), .C(n642), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n386), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U357 ( .A(n392), .B(n403), .C(n390), .YC(n387), .YS(n388) );
  FAX1 U358 ( .A(n407), .B(n394), .C(n405), .YC(n389), .YS(n390) );
  FAX1 U361 ( .A(n659), .B(n611), .C(n1107), .YC(n395), .YS(n396) );
  FAX1 U363 ( .A(n579), .B(n595), .C(n643), .YC(n399), .YS(n400) );
  FAX1 U366 ( .A(n1250), .B(n410), .C(n412), .YC(n405), .YS(n406) );
  FAX1 U369 ( .A(n628), .B(n596), .C(n676), .YC(n411), .YS(n412) );
  FAX1 U370 ( .A(n1108), .B(n580), .C(n692), .YC(n413), .YS(n414) );
  FAX1 U374 ( .A(n428), .B(n441), .C(n437), .YC(n421), .YS(n422) );
  FAX1 U378 ( .A(n434), .B(n445), .C(n432), .YC(n429), .YS(n430) );
  FAX1 U379 ( .A(n449), .B(n436), .C(n447), .YC(n431), .YS(n432) );
  FAX1 U383 ( .A(n614), .B(n630), .C(n694), .YC(n439), .YS(n440) );
  FAX1 U385 ( .A(n448), .B(n1090), .C(n446), .YC(n443), .YS(n444) );
  FAX1 U387 ( .A(n1226), .B(n465), .C(n454), .YC(n447), .YS(n448) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n468), .B(n464), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U394 ( .A(n477), .B(n475), .C(n466), .YC(n461), .YS(n462) );
  FAX1 U395 ( .A(n696), .B(n680), .C(n1029), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n712), .B(n648), .C(n664), .YC(n465), .YS(n466) );
  FAX1 U399 ( .A(n476), .B(n478), .C(n485), .YC(n471), .YS(n472) );
  FAX1 U400 ( .A(n480), .B(n998), .C(n487), .YC(n473), .YS(n474) );
  FAX1 U402 ( .A(n649), .B(n713), .C(n617), .YC(n477), .YS(n478) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U406 ( .A(n698), .B(n499), .C(n497), .YC(n485), .YS(n486) );
  FAX1 U407 ( .A(n714), .B(n666), .C(n682), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n650), .B(n618), .C(n634), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n715), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U412 ( .A(n667), .B(n699), .C(n635), .YC(n497), .YS(n498) );
  HAX1 U413 ( .A(n651), .B(n683), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n716), .B(n684), .C(n700), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n652), .B(n636), .C(n668), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n717), .B(n685), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n669), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n718), .B(n702), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n670), .B(n654), .C(n686), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n703), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n687), .B(n719), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n720), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n688), .B(n672), .C(n704), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n706), .B(n690), .C(n722), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1341), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n1339), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n1337), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n1335), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n1333), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n1331), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n1329), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n1327), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1325), .Y(n577) );
  NOR2X1 U444 ( .A(n918), .B(n736), .Y(n578) );
  OAI22X1 U466 ( .A(n918), .B(n1197), .C(n1116), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1113), .C(n1098), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1310), .B(n742), .C(n1308), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1098), .B(n743), .C(n1113), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1308), .B(n743), .C(n1310), .D(n744), .Y(n587) );
  OAI22X1 U473 ( .A(n1310), .B(n745), .C(n1308), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1116), .B(n745), .C(n1197), .D(n746), .Y(n589) );
  OAI22X1 U475 ( .A(n1098), .B(n747), .C(n1113), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1113), .B(n747), .C(n1098), .D(n748), .Y(n591) );
  OAI22X1 U477 ( .A(n1310), .B(n749), .C(n1308), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1308), .B(n749), .C(n1310), .D(n750), .Y(n593) );
  OAI22X1 U479 ( .A(n1197), .B(n751), .C(n1308), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n1308), .B(n751), .C(n1134), .D(n752), .Y(n595) );
  OAI22X1 U481 ( .A(n1134), .B(n753), .C(n1116), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n754), .B(n1134), .C(n1116), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1308), .B(n754), .C(n1197), .D(n755), .Y(n598) );
  OAI22X1 U484 ( .A(n1308), .B(n755), .C(n1310), .D(n756), .Y(n599) );
  AND2X1 U485 ( .A(n1347), .B(n1307), .Y(n600) );
  XNOR2X1 U487 ( .A(n1342), .B(n1345), .Y(n741) );
  XNOR2X1 U488 ( .A(n1340), .B(n1345), .Y(n742) );
  XNOR2X1 U489 ( .A(n1338), .B(n1345), .Y(n743) );
  XNOR2X1 U490 ( .A(n1336), .B(n1345), .Y(n744) );
  XNOR2X1 U491 ( .A(n1334), .B(n1345), .Y(n745) );
  XNOR2X1 U492 ( .A(n1332), .B(n1345), .Y(n746) );
  XNOR2X1 U493 ( .A(n1330), .B(n1345), .Y(n747) );
  XNOR2X1 U494 ( .A(n1328), .B(n1097), .Y(n748) );
  XNOR2X1 U495 ( .A(n1326), .B(n1344), .Y(n749) );
  XNOR2X1 U496 ( .A(n1324), .B(n1097), .Y(n750) );
  XNOR2X1 U497 ( .A(n1322), .B(n1344), .Y(n751) );
  XNOR2X1 U498 ( .A(n1344), .B(n1320), .Y(n752) );
  XNOR2X1 U499 ( .A(n1318), .B(n1344), .Y(n753) );
  XNOR2X1 U500 ( .A(n1316), .B(n1344), .Y(n754) );
  XNOR2X1 U501 ( .A(n1314), .B(n1344), .Y(n755) );
  XNOR2X1 U502 ( .A(n995), .B(n1097), .Y(n756) );
  OAI22X1 U505 ( .A(n1067), .B(n1128), .C(n1137), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1067), .B(n1137), .C(n1128), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1128), .B(n759), .C(n1137), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1128), .B(n760), .C(n1137), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1137), .B(n760), .C(n1306), .D(n761), .Y(n605) );
  OAI22X1 U512 ( .A(n1128), .B(n762), .C(n1137), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1137), .B(n762), .C(n1128), .D(n763), .Y(n607) );
  OAI22X1 U514 ( .A(n1128), .B(n764), .C(n1137), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1137), .B(n764), .C(n1306), .D(n765), .Y(n609) );
  OAI22X1 U516 ( .A(n1306), .B(n766), .C(n1137), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1083), .B(n766), .C(n1305), .D(n767), .Y(n611) );
  OAI22X1 U518 ( .A(n1305), .B(n768), .C(n1137), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1137), .B(n768), .C(n1306), .D(n769), .Y(n613) );
  OAI22X1 U520 ( .A(n1306), .B(n770), .C(n1083), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n771), .B(n1306), .C(n1137), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1137), .B(n771), .C(n1128), .D(n772), .Y(n616) );
  OAI22X1 U523 ( .A(n1137), .B(n772), .C(n1306), .D(n773), .Y(n617) );
  XNOR2X1 U526 ( .A(n1342), .B(n1362), .Y(n758) );
  XNOR2X1 U527 ( .A(n1340), .B(n1362), .Y(n759) );
  XNOR2X1 U528 ( .A(n1338), .B(n1362), .Y(n760) );
  XNOR2X1 U529 ( .A(n1336), .B(n1361), .Y(n761) );
  XNOR2X1 U530 ( .A(n1334), .B(n1361), .Y(n762) );
  XNOR2X1 U531 ( .A(n1332), .B(n1361), .Y(n763) );
  XNOR2X1 U532 ( .A(n1330), .B(n1361), .Y(n764) );
  XNOR2X1 U533 ( .A(n1328), .B(n1361), .Y(n765) );
  XNOR2X1 U534 ( .A(n1326), .B(n1361), .Y(n766) );
  XNOR2X1 U535 ( .A(n1324), .B(n1361), .Y(n767) );
  XNOR2X1 U536 ( .A(n1322), .B(n1361), .Y(n768) );
  XNOR2X1 U537 ( .A(n1320), .B(n1361), .Y(n769) );
  XNOR2X1 U538 ( .A(n1318), .B(n1361), .Y(n770) );
  XNOR2X1 U539 ( .A(n1316), .B(n1361), .Y(n771) );
  XNOR2X1 U540 ( .A(n1314), .B(n1361), .Y(n772) );
  XNOR2X1 U541 ( .A(n996), .B(n1361), .Y(n773) );
  OAI22X1 U544 ( .A(n1125), .B(n1302), .C(n1224), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1125), .B(n1300), .C(n1234), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1302), .B(n776), .C(n1300), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1234), .B(n777), .C(n1223), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1224), .B(n777), .C(n1302), .D(n778), .Y(n623) );
  OAI22X1 U551 ( .A(n1302), .B(n779), .C(n1300), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1300), .B(n779), .C(n1234), .D(n780), .Y(n625) );
  OAI22X1 U553 ( .A(n1234), .B(n781), .C(n1223), .D(n780), .Y(n626) );
  OAI22X1 U556 ( .A(n1300), .B(n783), .C(n1302), .D(n784), .Y(n629) );
  OAI22X1 U557 ( .A(n1301), .B(n785), .C(n1300), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1223), .B(n785), .C(n786), .D(n1091), .Y(n631) );
  OAI22X1 U559 ( .A(n1302), .B(n787), .C(n1223), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n788), .B(n1301), .C(n1300), .D(n787), .Y(n633) );
  OAI22X1 U561 ( .A(n1300), .B(n788), .C(n1302), .D(n789), .Y(n634) );
  OAI22X1 U562 ( .A(n1224), .B(n789), .C(n1301), .D(n790), .Y(n635) );
  AND2X1 U563 ( .A(n1347), .B(n1221), .Y(n636) );
  XNOR2X1 U565 ( .A(n1342), .B(n1132), .Y(n775) );
  XNOR2X1 U566 ( .A(n1340), .B(n1133), .Y(n776) );
  XNOR2X1 U567 ( .A(n1338), .B(n1177), .Y(n777) );
  XNOR2X1 U568 ( .A(n1336), .B(n1133), .Y(n778) );
  XNOR2X1 U569 ( .A(n1334), .B(n1132), .Y(n779) );
  XNOR2X1 U570 ( .A(n1332), .B(n1133), .Y(n780) );
  XNOR2X1 U571 ( .A(n1330), .B(n1359), .Y(n781) );
  XNOR2X1 U574 ( .A(n1324), .B(n1359), .Y(n784) );
  XNOR2X1 U575 ( .A(n1322), .B(n1359), .Y(n785) );
  XNOR2X1 U576 ( .A(n1320), .B(n1359), .Y(n786) );
  XNOR2X1 U577 ( .A(n1318), .B(n1177), .Y(n787) );
  XNOR2X1 U578 ( .A(n1316), .B(n1133), .Y(n788) );
  XNOR2X1 U579 ( .A(n1314), .B(n1359), .Y(n789) );
  XNOR2X1 U580 ( .A(n995), .B(n1133), .Y(n790) );
  OAI22X1 U583 ( .A(n1358), .B(n1214), .C(n1296), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1358), .B(n1296), .C(n1214), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1298), .B(n793), .C(n1296), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1214), .B(n794), .C(n1296), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1296), .B(n794), .C(n1214), .D(n795), .Y(n641) );
  OAI22X1 U590 ( .A(n1214), .B(n796), .C(n1296), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n1297), .B(n796), .C(n1298), .D(n797), .Y(n643) );
  OAI22X1 U592 ( .A(n1214), .B(n798), .C(n1296), .D(n797), .Y(n644) );
  OAI22X1 U594 ( .A(n1298), .B(n800), .C(n1296), .D(n799), .Y(n646) );
  OAI22X1 U595 ( .A(n1297), .B(n800), .C(n1214), .D(n801), .Y(n647) );
  OAI22X1 U596 ( .A(n1214), .B(n802), .C(n1297), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1296), .B(n802), .C(n1214), .D(n803), .Y(n649) );
  OAI22X1 U598 ( .A(n1298), .B(n804), .C(n1297), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n805), .B(n1214), .C(n1296), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1296), .B(n805), .C(n1298), .D(n806), .Y(n652) );
  OAI22X1 U601 ( .A(n1296), .B(n806), .C(n1298), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1347), .B(n1295), .Y(n654) );
  XNOR2X1 U604 ( .A(n1342), .B(n1130), .Y(n792) );
  XNOR2X1 U605 ( .A(n1340), .B(n1130), .Y(n793) );
  XNOR2X1 U606 ( .A(n1338), .B(n1130), .Y(n794) );
  XNOR2X1 U607 ( .A(n1336), .B(n1357), .Y(n795) );
  XNOR2X1 U608 ( .A(n1334), .B(n1357), .Y(n796) );
  XNOR2X1 U609 ( .A(n1332), .B(n1357), .Y(n797) );
  XNOR2X1 U610 ( .A(n1330), .B(n1357), .Y(n798) );
  XNOR2X1 U611 ( .A(n1328), .B(n1357), .Y(n799) );
  XNOR2X1 U612 ( .A(n1326), .B(n1357), .Y(n800) );
  XNOR2X1 U613 ( .A(n1324), .B(n1357), .Y(n801) );
  XNOR2X1 U614 ( .A(n1322), .B(n1357), .Y(n802) );
  XNOR2X1 U615 ( .A(n1320), .B(n1357), .Y(n803) );
  XNOR2X1 U616 ( .A(n1318), .B(n1357), .Y(n804) );
  XNOR2X1 U617 ( .A(n1316), .B(n1357), .Y(n805) );
  XNOR2X1 U618 ( .A(n1314), .B(n1357), .Y(n806) );
  XNOR2X1 U619 ( .A(n996), .B(n1357), .Y(n807) );
  OAI22X1 U622 ( .A(n1251), .B(n1274), .C(n1110), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1251), .B(n1292), .C(n1272), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1272), .B(n810), .C(n1293), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n811), .B(n1272), .C(n1110), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n1110), .B(n811), .C(n1272), .D(n812), .Y(n659) );
  OAI22X1 U629 ( .A(n1274), .B(n813), .C(n1293), .D(n812), .Y(n660) );
  OAI22X1 U630 ( .A(n1293), .B(n813), .C(n1274), .D(n814), .Y(n661) );
  OAI22X1 U632 ( .A(n1110), .B(n815), .C(n1273), .D(n816), .Y(n663) );
  OAI22X1 U633 ( .A(n1273), .B(n817), .C(n1110), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1293), .B(n817), .C(n1273), .D(n818), .Y(n665) );
  OAI22X1 U635 ( .A(n1274), .B(n819), .C(n1293), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1110), .B(n819), .C(n1274), .D(n820), .Y(n667) );
  OAI22X1 U637 ( .A(n1274), .B(n821), .C(n1110), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n822), .B(n1274), .C(n1293), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1293), .B(n822), .C(n1274), .D(n823), .Y(n670) );
  OAI22X1 U640 ( .A(n1110), .B(n823), .C(n1274), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1347), .B(n1109), .Y(n672) );
  XNOR2X1 U643 ( .A(n1342), .B(n1087), .Y(n809) );
  XNOR2X1 U644 ( .A(n1340), .B(n1088), .Y(n810) );
  XNOR2X1 U646 ( .A(n1336), .B(n1088), .Y(n812) );
  XNOR2X1 U647 ( .A(n1334), .B(n1087), .Y(n813) );
  XNOR2X1 U649 ( .A(n1330), .B(n1087), .Y(n815) );
  XNOR2X1 U650 ( .A(n1328), .B(n1087), .Y(n816) );
  XNOR2X1 U651 ( .A(n1114), .B(n1088), .Y(n817) );
  XNOR2X1 U652 ( .A(n1324), .B(n1088), .Y(n818) );
  XNOR2X1 U653 ( .A(n1322), .B(n1087), .Y(n819) );
  XNOR2X1 U654 ( .A(n1320), .B(n1088), .Y(n820) );
  XNOR2X1 U655 ( .A(n1318), .B(n1088), .Y(n821) );
  XNOR2X1 U656 ( .A(n1316), .B(n1088), .Y(n822) );
  XNOR2X1 U657 ( .A(n1314), .B(n1088), .Y(n823) );
  XNOR2X1 U658 ( .A(n996), .B(n1087), .Y(n824) );
  OAI22X1 U661 ( .A(n1129), .B(n1290), .C(n1288), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1129), .B(n1288), .C(n1290), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1290), .B(n827), .C(n1288), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1291), .B(n828), .C(n1288), .D(n827), .Y(n676) );
  OAI22X1 U667 ( .A(n1288), .B(n828), .C(n1291), .D(n829), .Y(n677) );
  OAI22X1 U668 ( .A(n830), .B(n1290), .C(n1288), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n1288), .B(n830), .C(n1290), .D(n831), .Y(n679) );
  OAI22X1 U670 ( .A(n1290), .B(n832), .C(n1288), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1288), .B(n832), .C(n1290), .D(n833), .Y(n681) );
  OAI22X1 U672 ( .A(n1290), .B(n834), .C(n1288), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1288), .B(n834), .C(n1290), .D(n835), .Y(n683) );
  OAI22X1 U674 ( .A(n1290), .B(n836), .C(n1288), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1288), .B(n836), .C(n1290), .D(n837), .Y(n685) );
  OAI22X1 U676 ( .A(n1290), .B(n838), .C(n1288), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n839), .B(n1290), .C(n1288), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1288), .B(n839), .C(n1290), .D(n840), .Y(n688) );
  OAI22X1 U679 ( .A(n1288), .B(n840), .C(n1290), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1347), .B(n1287), .Y(n690) );
  XNOR2X1 U682 ( .A(n1342), .B(n1355), .Y(n826) );
  XNOR2X1 U683 ( .A(n1340), .B(n1355), .Y(n827) );
  XNOR2X1 U684 ( .A(n1338), .B(n1355), .Y(n828) );
  XNOR2X1 U685 ( .A(n1336), .B(n1354), .Y(n829) );
  XNOR2X1 U686 ( .A(n1334), .B(n1354), .Y(n830) );
  XNOR2X1 U687 ( .A(n1332), .B(n1354), .Y(n831) );
  XNOR2X1 U688 ( .A(n1330), .B(n1354), .Y(n832) );
  XNOR2X1 U689 ( .A(n1328), .B(n1354), .Y(n833) );
  XNOR2X1 U690 ( .A(n1326), .B(n1354), .Y(n834) );
  XNOR2X1 U691 ( .A(n1324), .B(n1354), .Y(n835) );
  XNOR2X1 U692 ( .A(n1322), .B(n1354), .Y(n836) );
  XNOR2X1 U693 ( .A(n1320), .B(n1354), .Y(n837) );
  XNOR2X1 U694 ( .A(n1318), .B(n1354), .Y(n838) );
  XNOR2X1 U695 ( .A(n1316), .B(n1354), .Y(n839) );
  XNOR2X1 U696 ( .A(n1314), .B(n1354), .Y(n840) );
  XNOR2X1 U697 ( .A(n996), .B(n1354), .Y(n841) );
  OAI22X1 U700 ( .A(n1353), .B(n1105), .C(n1193), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1353), .B(n1191), .C(n843), .D(n12), .Y(n692) );
  OAI22X1 U704 ( .A(n1286), .B(n844), .C(n1193), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n1286), .B(n845), .C(n1192), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1191), .B(n845), .C(n1286), .D(n846), .Y(n695) );
  OAI22X1 U707 ( .A(n1286), .B(n847), .C(n1193), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1193), .B(n847), .C(n1286), .D(n848), .Y(n697) );
  OAI22X1 U709 ( .A(n1105), .B(n849), .C(n1193), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1193), .B(n849), .C(n1286), .D(n850), .Y(n699) );
  OAI22X1 U711 ( .A(n1286), .B(n851), .C(n1192), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1192), .B(n851), .C(n1286), .D(n852), .Y(n701) );
  OAI22X1 U713 ( .A(n1105), .B(n853), .C(n1193), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n1193), .B(n853), .C(n1105), .D(n854), .Y(n703) );
  OAI22X1 U715 ( .A(n1286), .B(n855), .C(n1193), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n856), .B(n1105), .C(n1192), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1192), .B(n856), .C(n1105), .D(n857), .Y(n706) );
  OAI22X1 U718 ( .A(n1192), .B(n857), .C(n1105), .D(n858), .Y(n707) );
  XNOR2X1 U722 ( .A(n1340), .B(n1235), .Y(n844) );
  XNOR2X1 U723 ( .A(n1338), .B(n1235), .Y(n845) );
  XNOR2X1 U724 ( .A(n1336), .B(n1351), .Y(n846) );
  XNOR2X1 U725 ( .A(n1334), .B(n1351), .Y(n847) );
  XNOR2X1 U726 ( .A(n1332), .B(n1351), .Y(n848) );
  XNOR2X1 U727 ( .A(n1330), .B(n1351), .Y(n849) );
  XNOR2X1 U728 ( .A(n1328), .B(n1351), .Y(n850) );
  XNOR2X1 U729 ( .A(n1114), .B(n1351), .Y(n851) );
  XNOR2X1 U730 ( .A(n1324), .B(n1351), .Y(n852) );
  XNOR2X1 U731 ( .A(n1322), .B(n1352), .Y(n853) );
  XNOR2X1 U732 ( .A(n1320), .B(n1351), .Y(n854) );
  XNOR2X1 U733 ( .A(n1318), .B(n1351), .Y(n855) );
  XNOR2X1 U734 ( .A(n1316), .B(n1351), .Y(n856) );
  XNOR2X1 U735 ( .A(n1314), .B(n1351), .Y(n857) );
  XNOR2X1 U736 ( .A(n996), .B(n1352), .Y(n858) );
  OAI22X1 U739 ( .A(n1096), .B(n1275), .C(n1282), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n1282), .B(n1096), .C(n1284), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1284), .B(n861), .C(n1282), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1284), .B(n862), .C(n1282), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1282), .B(n862), .C(n1275), .D(n863), .Y(n713) );
  OAI22X1 U746 ( .A(n1284), .B(n864), .C(n1282), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1282), .B(n864), .C(n1284), .D(n865), .Y(n715) );
  OAI22X1 U748 ( .A(n1275), .B(n866), .C(n1282), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1282), .B(n866), .C(n1284), .D(n867), .Y(n717) );
  OAI22X1 U750 ( .A(n1275), .B(n868), .C(n1282), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1282), .B(n868), .C(n1275), .D(n869), .Y(n719) );
  OAI22X1 U752 ( .A(n1284), .B(n870), .C(n1282), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1282), .B(n870), .C(n1284), .D(n871), .Y(n721) );
  OAI22X1 U754 ( .A(n1275), .B(n872), .C(n1282), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1284), .B(n873), .C(n1282), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1282), .B(n873), .C(n1275), .D(n874), .Y(n724) );
  OAI22X1 U757 ( .A(n1282), .B(n874), .C(n1284), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n1342), .B(n1349), .Y(n860) );
  XNOR2X1 U759 ( .A(n1340), .B(n1349), .Y(n861) );
  XNOR2X1 U760 ( .A(n1338), .B(n1349), .Y(n862) );
  XNOR2X1 U761 ( .A(n1336), .B(n1349), .Y(n863) );
  XNOR2X1 U762 ( .A(n1334), .B(n1349), .Y(n864) );
  XNOR2X1 U763 ( .A(n1332), .B(n1349), .Y(n865) );
  XNOR2X1 U764 ( .A(n1330), .B(n1349), .Y(n866) );
  XNOR2X1 U765 ( .A(n1328), .B(n1349), .Y(n867) );
  XNOR2X1 U766 ( .A(n1114), .B(n1349), .Y(n868) );
  XNOR2X1 U767 ( .A(n1324), .B(n1349), .Y(n869) );
  XNOR2X1 U768 ( .A(n1322), .B(n1349), .Y(n870) );
  XNOR2X1 U769 ( .A(n1320), .B(n1349), .Y(n871) );
  XNOR2X1 U770 ( .A(n1318), .B(n1349), .Y(n872) );
  XNOR2X1 U771 ( .A(n1316), .B(n1349), .Y(n873) );
  XNOR2X1 U772 ( .A(n1314), .B(n1349), .Y(n874) );
  XNOR2X1 U773 ( .A(n996), .B(n1349), .Y(n875) );
  NAND2X1 U801 ( .A(n46), .B(n893), .Y(n48) );
  XNOR2X1 U803 ( .A(n37), .B(a[29]), .Y(n46) );
  XOR2X1 U811 ( .A(n1112), .B(a[23]), .Y(n896) );
  NAND2X1 U813 ( .A(n1135), .B(n897), .Y(n24) );
  NAND2X1 U816 ( .A(n898), .B(n16), .Y(n18) );
  NAND2X1 U822 ( .A(n917), .B(n900), .Y(n6) );
  INVX4 U828 ( .A(n563), .Y(n1107) );
  BUFX4 U829 ( .A(n1352), .Y(n1235) );
  INVX8 U830 ( .A(n1106), .Y(n1214) );
  BUFX2 U831 ( .A(n1346), .Y(n995) );
  BUFX4 U832 ( .A(n1346), .Y(n996) );
  INVX2 U833 ( .A(n1348), .Y(n1346) );
  BUFX2 U834 ( .A(n24), .Y(n1272) );
  INVX4 U835 ( .A(n42), .Y(n1304) );
  INVX2 U836 ( .A(n489), .Y(n997) );
  INVX4 U837 ( .A(n997), .Y(n998) );
  INVX2 U838 ( .A(n369), .Y(n999) );
  INVX4 U839 ( .A(n999), .Y(n1000) );
  INVX4 U840 ( .A(n1292), .Y(n1109) );
  INVX8 U841 ( .A(n1345), .Y(n918) );
  INVX8 U842 ( .A(n1127), .Y(n1128) );
  BUFX4 U843 ( .A(n1286), .Y(n1105) );
  INVX8 U844 ( .A(n1086), .Y(n1088) );
  INVX8 U845 ( .A(n1317), .Y(n1318) );
  INVX8 U846 ( .A(n1321), .Y(n1322) );
  INVX4 U847 ( .A(n884), .Y(n1327) );
  BUFX4 U848 ( .A(n411), .Y(n1001) );
  BUFX4 U849 ( .A(n431), .Y(n1002) );
  INVX8 U850 ( .A(n1323), .Y(n1324) );
  INVX4 U851 ( .A(n886), .Y(n1323) );
  INVX4 U852 ( .A(n1331), .Y(n1332) );
  INVX8 U853 ( .A(n1287), .Y(n1288) );
  INVX4 U854 ( .A(n1333), .Y(n1334) );
  INVX4 U855 ( .A(n1335), .Y(n1336) );
  INVX8 U856 ( .A(n1337), .Y(n1338) );
  INVX4 U857 ( .A(n879), .Y(n1337) );
  INVX8 U858 ( .A(n1339), .Y(n1340) );
  INVX4 U859 ( .A(n878), .Y(n1339) );
  INVX2 U860 ( .A(n541), .Y(n1343) );
  BUFX2 U861 ( .A(n413), .Y(n1068) );
  INVX2 U862 ( .A(n1304), .Y(n1305) );
  INVX2 U863 ( .A(n1353), .Y(n1352) );
  INVX2 U864 ( .A(n1094), .Y(n1355) );
  INVX4 U865 ( .A(n31), .Y(n1360) );
  INVX4 U866 ( .A(n37), .Y(n1363) );
  INVX4 U867 ( .A(n1343), .Y(n1344) );
  INVX2 U868 ( .A(n24), .Y(n1294) );
  BUFX2 U869 ( .A(n435), .Y(n1227) );
  INVX2 U870 ( .A(n1065), .Y(n580) );
  INVX2 U871 ( .A(n887), .Y(n1321) );
  INVX4 U872 ( .A(n1319), .Y(n1320) );
  INVX2 U873 ( .A(n1354), .Y(n1129) );
  INVX2 U874 ( .A(n1236), .Y(n1298) );
  INVX2 U875 ( .A(n1249), .Y(n1250) );
  INVX2 U876 ( .A(n1023), .Y(n1024) );
  INVX2 U877 ( .A(n1307), .Y(n1308) );
  XOR2X1 U878 ( .A(n677), .B(n661), .Y(n1003) );
  XOR2X1 U879 ( .A(n629), .B(n1003), .Y(n424) );
  NAND2X1 U880 ( .A(n629), .B(n677), .Y(n1004) );
  NAND2X1 U881 ( .A(n629), .B(n661), .Y(n1005) );
  NAND2X1 U882 ( .A(n677), .B(n661), .Y(n1006) );
  NAND3X1 U883 ( .A(n1005), .B(n1004), .C(n1006), .Y(n423) );
  NOR2X1 U884 ( .A(n457), .B(n444), .Y(n1007) );
  BUFX2 U885 ( .A(n1099), .Y(n1008) );
  INVX1 U886 ( .A(n100), .Y(n98) );
  INVX2 U887 ( .A(n1289), .Y(n1291) );
  INVX4 U888 ( .A(n19), .Y(n1086) );
  INVX8 U889 ( .A(n1086), .Y(n1087) );
  INVX8 U890 ( .A(n1136), .Y(n1137) );
  BUFX4 U891 ( .A(n1064), .Y(n1193) );
  INVX4 U892 ( .A(n1294), .Y(n1273) );
  OR2X1 U893 ( .A(n1273), .B(n815), .Y(n1185) );
  XOR2X1 U894 ( .A(n631), .B(n565), .Y(n1009) );
  XOR2X1 U895 ( .A(n1009), .B(n695), .Y(n452) );
  NAND2X1 U896 ( .A(n695), .B(n631), .Y(n1010) );
  NAND2X1 U897 ( .A(n695), .B(n565), .Y(n1011) );
  NAND2X1 U898 ( .A(n631), .B(n565), .Y(n1012) );
  NAND3X1 U899 ( .A(n1011), .B(n1010), .C(n1012), .Y(n451) );
  INVX2 U900 ( .A(a[15]), .Y(n917) );
  INVX1 U901 ( .A(n416), .Y(n1013) );
  INVX1 U902 ( .A(n1013), .Y(n1014) );
  XOR2X1 U903 ( .A(n1038), .B(n1024), .Y(n1015) );
  XOR2X1 U904 ( .A(n1015), .B(n398), .Y(n392) );
  NAND2X1 U905 ( .A(n1038), .B(n1024), .Y(n1016) );
  NAND2X1 U906 ( .A(n1038), .B(n398), .Y(n1017) );
  NAND2X1 U907 ( .A(n1024), .B(n398), .Y(n1018) );
  NAND3X1 U908 ( .A(n1016), .B(n1017), .C(n1018), .Y(n391) );
  XOR2X1 U909 ( .A(n393), .B(n380), .Y(n1019) );
  XOR2X1 U910 ( .A(n1019), .B(n391), .Y(n376) );
  NAND2X1 U911 ( .A(n393), .B(n380), .Y(n1020) );
  NAND2X1 U912 ( .A(n393), .B(n391), .Y(n1021) );
  NAND2X1 U913 ( .A(n380), .B(n391), .Y(n1022) );
  NAND3X1 U914 ( .A(n1020), .B(n1021), .C(n1022), .Y(n375) );
  INVX2 U915 ( .A(n396), .Y(n1023) );
  INVX8 U916 ( .A(n1), .Y(n1350) );
  AND2X2 U917 ( .A(n1347), .B(n1219), .Y(n708) );
  XOR2X1 U918 ( .A(n440), .B(n442), .Y(n1025) );
  XOR2X1 U919 ( .A(n438), .B(n1025), .Y(n434) );
  NAND2X1 U920 ( .A(n438), .B(n440), .Y(n1026) );
  NAND2X1 U921 ( .A(n438), .B(n442), .Y(n1027) );
  NAND2X1 U922 ( .A(n440), .B(n442), .Y(n1028) );
  NAND3X1 U923 ( .A(n1027), .B(n1026), .C(n1028), .Y(n433) );
  AND2X2 U924 ( .A(n633), .B(n681), .Y(n1029) );
  INVX1 U925 ( .A(n1221), .Y(n1224) );
  OR2X2 U926 ( .A(n724), .B(n708), .Y(n1030) );
  OR2X2 U927 ( .A(n308), .B(n313), .Y(n1031) );
  AND2X2 U928 ( .A(n615), .B(n663), .Y(n1032) );
  INVX4 U929 ( .A(n1107), .Y(n1108) );
  OR2X2 U930 ( .A(n1163), .B(n80), .Y(n1033) );
  INVX2 U931 ( .A(n881), .Y(n1333) );
  INVX2 U932 ( .A(n889), .Y(n1317) );
  INVX4 U933 ( .A(n1329), .Y(n1330) );
  INVX2 U934 ( .A(n880), .Y(n1335) );
  INVX2 U935 ( .A(n917), .Y(n1281) );
  INVX2 U936 ( .A(n882), .Y(n1331) );
  AND2X2 U937 ( .A(n724), .B(n708), .Y(n1034) );
  OR2X2 U938 ( .A(n292), .B(n293), .Y(n1035) );
  INVX4 U939 ( .A(n1341), .Y(n1342) );
  INVX2 U940 ( .A(n877), .Y(n1341) );
  INVX2 U941 ( .A(n202), .Y(n1036) );
  INVX2 U942 ( .A(n400), .Y(n1037) );
  INVX2 U943 ( .A(n1037), .Y(n1038) );
  INVX2 U944 ( .A(n1295), .Y(n1297) );
  XOR2X1 U945 ( .A(n645), .B(n613), .Y(n1039) );
  XOR2X1 U946 ( .A(n1039), .B(n693), .Y(n426) );
  NAND2X1 U947 ( .A(n645), .B(n613), .Y(n1040) );
  NAND2X1 U948 ( .A(n645), .B(n693), .Y(n1041) );
  NAND2X1 U949 ( .A(n613), .B(n693), .Y(n1042) );
  NAND3X1 U950 ( .A(n1040), .B(n1041), .C(n1042), .Y(n425) );
  XOR2X1 U951 ( .A(n427), .B(n414), .Y(n1043) );
  XOR2X1 U952 ( .A(n1043), .B(n425), .Y(n408) );
  NAND2X1 U953 ( .A(n427), .B(n414), .Y(n1044) );
  NAND2X1 U954 ( .A(n427), .B(n425), .Y(n1045) );
  NAND2X1 U955 ( .A(n414), .B(n425), .Y(n1046) );
  NAND3X1 U956 ( .A(n1044), .B(n1045), .C(n1046), .Y(n407) );
  NOR2X1 U957 ( .A(n1297), .B(n798), .Y(n1047) );
  NOR2X1 U958 ( .A(n1214), .B(n799), .Y(n1048) );
  OR2X2 U959 ( .A(n1047), .B(n1048), .Y(n645) );
  XNOR2X1 U960 ( .A(n7), .B(a[17]), .Y(n1217) );
  INVX2 U961 ( .A(a[17]), .Y(n1194) );
  XNOR2X1 U962 ( .A(n95), .B(n1049), .Y(product[44]) );
  AND2X2 U963 ( .A(n94), .B(n91), .Y(n1049) );
  OR2X2 U964 ( .A(n996), .B(n1096), .Y(n876) );
  OR2X2 U965 ( .A(n996), .B(n1129), .Y(n842) );
  OR2X2 U966 ( .A(n996), .B(n1358), .Y(n808) );
  OR2X2 U967 ( .A(n996), .B(n1353), .Y(n859) );
  OR2X2 U968 ( .A(n996), .B(n1251), .Y(n825) );
  INVX1 U969 ( .A(n1322), .Y(n736) );
  INVX8 U970 ( .A(n1085), .Y(n1302) );
  XOR2X1 U971 ( .A(n660), .B(n612), .Y(n1050) );
  XOR2X1 U972 ( .A(n1050), .B(n644), .Y(n410) );
  NAND2X1 U973 ( .A(n1058), .B(n612), .Y(n1051) );
  NAND2X1 U974 ( .A(n1058), .B(n644), .Y(n1052) );
  NAND2X1 U975 ( .A(n612), .B(n644), .Y(n1053) );
  NAND3X1 U976 ( .A(n1051), .B(n1052), .C(n1053), .Y(n409) );
  XOR2X1 U977 ( .A(n1068), .B(n1001), .Y(n1054) );
  XOR2X1 U978 ( .A(n1054), .B(n409), .Y(n394) );
  NAND2X1 U979 ( .A(n1068), .B(n1001), .Y(n1055) );
  NAND2X1 U980 ( .A(n1068), .B(n409), .Y(n1056) );
  NAND2X1 U981 ( .A(n1001), .B(n409), .Y(n1057) );
  NAND3X1 U982 ( .A(n1055), .B(n1056), .C(n1057), .Y(n393) );
  BUFX2 U983 ( .A(n660), .Y(n1058) );
  BUFX2 U984 ( .A(a[27]), .Y(n1059) );
  INVX4 U985 ( .A(n541), .Y(n1115) );
  XNOR2X1 U986 ( .A(n112), .B(n1060), .Y(product[43]) );
  AND2X2 U987 ( .A(n111), .B(n1204), .Y(n1060) );
  AND2X1 U988 ( .A(n1195), .B(n1196), .Y(n1064) );
  INVX2 U989 ( .A(n1360), .Y(n1133) );
  AND2X2 U990 ( .A(n1347), .B(n1136), .Y(n618) );
  INVX2 U991 ( .A(n1132), .Y(n1125) );
  OR2X2 U992 ( .A(n996), .B(n1125), .Y(n791) );
  INVX2 U993 ( .A(n1131), .Y(n1283) );
  XOR2X1 U994 ( .A(n1327), .B(n1360), .Y(n1061) );
  INVX4 U995 ( .A(n1327), .Y(n1328) );
  INVX4 U996 ( .A(n1360), .Y(n1359) );
  XOR2X1 U997 ( .A(n1326), .B(n1359), .Y(n1062) );
  INVX2 U998 ( .A(n1062), .Y(n783) );
  INVX8 U999 ( .A(n1353), .Y(n1351) );
  XNOR2X1 U1000 ( .A(n170), .B(n1063), .Y(product[37]) );
  AND2X2 U1001 ( .A(n169), .B(n283), .Y(n1063) );
  INVX4 U1002 ( .A(n1069), .Y(n579) );
  INVX1 U1003 ( .A(n1237), .Y(n1301) );
  XNOR2X1 U1004 ( .A(n1337), .B(n1086), .Y(n811) );
  NAND2X1 U1005 ( .A(n1345), .B(n1316), .Y(n1065) );
  XNOR2X1 U1006 ( .A(n1066), .B(n418), .Y(n416) );
  XNOR2X1 U1007 ( .A(n420), .B(n1002), .Y(n1066) );
  AND2X1 U1008 ( .A(n1345), .B(n1320), .Y(n385) );
  AND2X1 U1009 ( .A(n1345), .B(n1314), .Y(n581) );
  INVX2 U1010 ( .A(n1361), .Y(n1067) );
  INVX1 U1011 ( .A(n1363), .Y(n1362) );
  INVX4 U1012 ( .A(n1092), .Y(n1097) );
  INVX1 U1013 ( .A(n128), .Y(n126) );
  OR2X2 U1014 ( .A(n918), .B(n1317), .Y(n1069) );
  XOR2X1 U1015 ( .A(n1225), .B(n1227), .Y(n1070) );
  XOR2X1 U1016 ( .A(n1070), .B(n433), .Y(n418) );
  NAND2X1 U1017 ( .A(n1225), .B(n1227), .Y(n1071) );
  NAND2X1 U1018 ( .A(n1225), .B(n433), .Y(n1072) );
  NAND2X1 U1019 ( .A(n1227), .B(n433), .Y(n1073) );
  NAND3X1 U1020 ( .A(n1071), .B(n1072), .C(n1073), .Y(n417) );
  NAND2X1 U1021 ( .A(n420), .B(n1002), .Y(n1074) );
  NAND2X1 U1022 ( .A(n420), .B(n418), .Y(n1075) );
  NAND2X1 U1023 ( .A(n1002), .B(n418), .Y(n1076) );
  NAND3X1 U1024 ( .A(n1074), .B(n1075), .C(n1076), .Y(n415) );
  INVX2 U1025 ( .A(n201), .Y(n1077) );
  XOR2X1 U1026 ( .A(n581), .B(n1108), .Y(n1078) );
  XOR2X1 U1027 ( .A(n597), .B(n1078), .Y(n428) );
  NAND2X1 U1028 ( .A(n597), .B(n581), .Y(n1079) );
  NAND2X1 U1029 ( .A(n597), .B(n1108), .Y(n1080) );
  NAND2X1 U1030 ( .A(n581), .B(n1108), .Y(n1081) );
  NAND3X1 U1031 ( .A(n1080), .B(n1079), .C(n1081), .Y(n427) );
  NOR2X1 U1032 ( .A(n340), .B(n349), .Y(n1082) );
  XNOR2X1 U1033 ( .A(n1359), .B(n1059), .Y(n1083) );
  XOR2X1 U1034 ( .A(n1341), .B(n1351), .Y(n843) );
  NAND2X1 U1035 ( .A(n1348), .B(n1345), .Y(n757) );
  INVX2 U1036 ( .A(n1199), .Y(n1084) );
  INVX4 U1037 ( .A(n1084), .Y(n1085) );
  XOR2X1 U1038 ( .A(n633), .B(n681), .Y(n480) );
  INVX1 U1039 ( .A(n1237), .Y(n1234) );
  INVX2 U1040 ( .A(a[29]), .Y(n1233) );
  INVX2 U1041 ( .A(n459), .Y(n1089) );
  INVX4 U1042 ( .A(n1089), .Y(n1090) );
  INVX1 U1043 ( .A(n1237), .Y(n1091) );
  BUFX2 U1044 ( .A(n1343), .Y(n1092) );
  XNOR2X1 U1045 ( .A(n19), .B(a[23]), .Y(n1218) );
  XOR2X1 U1046 ( .A(n1095), .B(n31), .Y(n1260) );
  XNOR2X1 U1047 ( .A(n662), .B(n1093), .Y(n438) );
  XNOR2X1 U1048 ( .A(n678), .B(n646), .Y(n1093) );
  INVX2 U1049 ( .A(n13), .Y(n1094) );
  INVX2 U1050 ( .A(n13), .Y(n1356) );
  INVX2 U1051 ( .A(a[25]), .Y(n1095) );
  BUFX2 U1052 ( .A(n1350), .Y(n1096) );
  XOR2X1 U1053 ( .A(n31), .B(a[27]), .Y(n1220) );
  XNOR2X1 U1054 ( .A(n7), .B(a[19]), .Y(n16) );
  INVX4 U1055 ( .A(n1281), .Y(n1282) );
  XNOR2X1 U1056 ( .A(n541), .B(n1233), .Y(n893) );
  BUFX2 U1057 ( .A(n1197), .Y(n1098) );
  INVX2 U1058 ( .A(n1309), .Y(n1197) );
  INVX2 U1059 ( .A(n890), .Y(n1315) );
  INVX8 U1060 ( .A(n1315), .Y(n1316) );
  XOR2X1 U1061 ( .A(a[21]), .B(n13), .Y(n1099) );
  INVX2 U1062 ( .A(n1325), .Y(n1114) );
  XNOR2X1 U1063 ( .A(n1356), .B(a[19]), .Y(n898) );
  OR2X2 U1064 ( .A(n918), .B(n1323), .Y(n1100) );
  INVX1 U1065 ( .A(n1100), .Y(n359) );
  XOR2X1 U1066 ( .A(n483), .B(n474), .Y(n1101) );
  XOR2X1 U1067 ( .A(n472), .B(n1101), .Y(n470) );
  NAND2X1 U1068 ( .A(n472), .B(n483), .Y(n1102) );
  NAND2X1 U1069 ( .A(n472), .B(n474), .Y(n1103) );
  NAND2X1 U1070 ( .A(n483), .B(n474), .Y(n1104) );
  NAND3X1 U1071 ( .A(n1103), .B(n1102), .C(n1104), .Y(n469) );
  AND2X2 U1072 ( .A(n896), .B(n1218), .Y(n1106) );
  INVX1 U1073 ( .A(n210), .Y(n289) );
  OR2X2 U1074 ( .A(n996), .B(n1067), .Y(n774) );
  INVX1 U1075 ( .A(n1360), .Y(n1177) );
  XOR2X1 U1076 ( .A(n19), .B(a[21]), .Y(n897) );
  INVX8 U1077 ( .A(n1109), .Y(n1110) );
  INVX2 U1078 ( .A(n25), .Y(n1111) );
  INVX2 U1079 ( .A(n1111), .Y(n1112) );
  INVX2 U1080 ( .A(n46), .Y(n1307) );
  BUFX2 U1081 ( .A(n1116), .Y(n1113) );
  INVX2 U1082 ( .A(n1307), .Y(n1116) );
  XOR2X1 U1083 ( .A(n375), .B(n366), .Y(n1117) );
  XOR2X1 U1084 ( .A(n364), .B(n1117), .Y(n362) );
  NAND2X1 U1085 ( .A(n364), .B(n375), .Y(n1118) );
  NAND2X1 U1086 ( .A(n364), .B(n366), .Y(n1119) );
  NAND2X1 U1087 ( .A(n375), .B(n366), .Y(n1120) );
  NAND3X1 U1088 ( .A(n1119), .B(n1118), .C(n1120), .Y(n361) );
  XOR2X1 U1089 ( .A(n379), .B(n368), .Y(n1121) );
  XOR2X1 U1090 ( .A(n377), .B(n1121), .Y(n364) );
  NAND2X1 U1091 ( .A(n377), .B(n379), .Y(n1122) );
  NAND2X1 U1092 ( .A(n377), .B(n368), .Y(n1123) );
  NAND2X1 U1093 ( .A(n379), .B(n368), .Y(n1124) );
  NAND3X1 U1094 ( .A(n1123), .B(n1122), .C(n1124), .Y(n363) );
  XOR2X1 U1095 ( .A(n1), .B(a[15]), .Y(n900) );
  INVX4 U1096 ( .A(n12), .Y(n1285) );
  OAI22X1 U1097 ( .A(n1116), .B(n755), .C(n1310), .D(n756), .Y(n1126) );
  INVX1 U1098 ( .A(n171), .Y(n173) );
  INVX2 U1099 ( .A(n1305), .Y(n1127) );
  BUFX2 U1100 ( .A(n48), .Y(n1134) );
  INVX8 U1101 ( .A(n1094), .Y(n1354) );
  BUFX2 U1102 ( .A(n1112), .Y(n1130) );
  INVX4 U1103 ( .A(n885), .Y(n1325) );
  NAND2X1 U1104 ( .A(n917), .B(n900), .Y(n1131) );
  INVX1 U1105 ( .A(n1360), .Y(n1132) );
  INVX2 U1106 ( .A(n48), .Y(n1309) );
  INVX4 U1107 ( .A(n25), .Y(n1358) );
  XNOR2X1 U1108 ( .A(n13), .B(a[21]), .Y(n1135) );
  INVX4 U1109 ( .A(n1278), .Y(n628) );
  INVX2 U1110 ( .A(n1303), .Y(n1136) );
  INVX1 U1111 ( .A(n1220), .Y(n1303) );
  XOR2X1 U1112 ( .A(n1331), .B(n1087), .Y(n814) );
  OR2X2 U1113 ( .A(n1138), .B(n1220), .Y(n42) );
  XOR2X1 U1114 ( .A(n1363), .B(a[27]), .Y(n1138) );
  XOR2X1 U1115 ( .A(n1032), .B(n453), .Y(n1139) );
  XOR2X1 U1116 ( .A(n451), .B(n1139), .Y(n436) );
  NAND2X1 U1117 ( .A(n451), .B(n1032), .Y(n1140) );
  NAND2X1 U1118 ( .A(n451), .B(n453), .Y(n1141) );
  NAND2X1 U1119 ( .A(n1032), .B(n453), .Y(n1142) );
  NAND3X1 U1120 ( .A(n1141), .B(n1140), .C(n1142), .Y(n435) );
  XOR2X1 U1121 ( .A(n615), .B(n663), .Y(n456) );
  OR2X1 U1122 ( .A(n1110), .B(n814), .Y(n1186) );
  OR2X2 U1123 ( .A(n1219), .B(n1217), .Y(n12) );
  INVX1 U1124 ( .A(n189), .Y(n286) );
  XOR2X1 U1125 ( .A(n616), .B(n600), .Y(n1143) );
  XOR2X1 U1126 ( .A(n1143), .B(n632), .Y(n468) );
  NAND2X1 U1127 ( .A(n616), .B(n600), .Y(n1144) );
  NAND2X1 U1128 ( .A(n616), .B(n632), .Y(n1145) );
  NAND2X1 U1129 ( .A(n600), .B(n632), .Y(n1146) );
  NAND3X1 U1130 ( .A(n1144), .B(n1145), .C(n1146), .Y(n467) );
  XOR2X1 U1131 ( .A(n679), .B(n456), .Y(n1147) );
  XOR2X1 U1132 ( .A(n1147), .B(n467), .Y(n450) );
  NAND2X1 U1133 ( .A(n679), .B(n456), .Y(n1148) );
  NAND2X1 U1134 ( .A(n679), .B(n467), .Y(n1149) );
  NAND2X1 U1135 ( .A(n456), .B(n467), .Y(n1150) );
  NAND3X1 U1136 ( .A(n1148), .B(n1149), .C(n1150), .Y(n449) );
  XOR2X1 U1137 ( .A(n450), .B(n463), .Y(n1151) );
  XOR2X1 U1138 ( .A(n461), .B(n1151), .Y(n446) );
  NAND2X1 U1139 ( .A(n461), .B(n450), .Y(n1152) );
  NAND2X1 U1140 ( .A(n461), .B(n463), .Y(n1153) );
  NAND2X1 U1141 ( .A(n450), .B(n463), .Y(n1154) );
  NAND3X1 U1142 ( .A(n1153), .B(n1152), .C(n1154), .Y(n445) );
  INVX8 U1143 ( .A(n1358), .Y(n1357) );
  XOR2X1 U1144 ( .A(n383), .B(n381), .Y(n1155) );
  XOR2X1 U1145 ( .A(n1155), .B(n370), .Y(n366) );
  NAND2X1 U1146 ( .A(n383), .B(n381), .Y(n1156) );
  NAND2X1 U1147 ( .A(n383), .B(n370), .Y(n1157) );
  NAND2X1 U1148 ( .A(n381), .B(n370), .Y(n1158) );
  NAND3X1 U1149 ( .A(n1156), .B(n1157), .C(n1158), .Y(n365) );
  XOR2X1 U1150 ( .A(n356), .B(n367), .Y(n1159) );
  XOR2X1 U1151 ( .A(n1159), .B(n365), .Y(n352) );
  NAND2X1 U1152 ( .A(n356), .B(n367), .Y(n1160) );
  NAND2X1 U1153 ( .A(n356), .B(n365), .Y(n1161) );
  NAND2X1 U1154 ( .A(n367), .B(n365), .Y(n1162) );
  NAND3X1 U1155 ( .A(n1160), .B(n1161), .C(n1162), .Y(n351) );
  NAND2X1 U1156 ( .A(n1203), .B(n281), .Y(n1163) );
  XOR2X1 U1157 ( .A(n627), .B(n675), .Y(n1164) );
  XOR2X1 U1158 ( .A(n1164), .B(n691), .Y(n398) );
  NAND2X1 U1159 ( .A(n627), .B(n675), .Y(n1165) );
  NAND2X1 U1160 ( .A(n627), .B(n691), .Y(n1166) );
  NAND2X1 U1161 ( .A(n675), .B(n691), .Y(n1167) );
  NAND3X1 U1162 ( .A(n1165), .B(n1166), .C(n1167), .Y(n397) );
  XOR2X1 U1163 ( .A(n626), .B(n399), .Y(n1168) );
  XOR2X1 U1164 ( .A(n1168), .B(n397), .Y(n380) );
  NAND2X1 U1165 ( .A(n626), .B(n399), .Y(n1169) );
  NAND2X1 U1166 ( .A(n626), .B(n397), .Y(n1170) );
  NAND2X1 U1167 ( .A(n399), .B(n397), .Y(n1171) );
  NAND3X1 U1168 ( .A(n1169), .B(n1170), .C(n1171), .Y(n379) );
  NOR2X1 U1169 ( .A(n373), .B(n362), .Y(n1172) );
  INVX8 U1170 ( .A(n1350), .Y(n1349) );
  XOR2X1 U1171 ( .A(n697), .B(n566), .Y(n1173) );
  XOR2X1 U1172 ( .A(n665), .B(n1173), .Y(n476) );
  NAND2X1 U1173 ( .A(n665), .B(n697), .Y(n1174) );
  NAND2X1 U1174 ( .A(n665), .B(n566), .Y(n1175) );
  NAND2X1 U1175 ( .A(n697), .B(n566), .Y(n1176) );
  NAND3X1 U1176 ( .A(n1175), .B(n1174), .C(n1176), .Y(n475) );
  XOR2X1 U1177 ( .A(n1126), .B(n647), .Y(n1178) );
  XOR2X1 U1178 ( .A(n1178), .B(n711), .Y(n454) );
  NAND2X1 U1179 ( .A(n711), .B(n599), .Y(n1179) );
  NAND2X1 U1180 ( .A(n711), .B(n647), .Y(n1180) );
  NAND2X1 U1181 ( .A(n647), .B(n599), .Y(n1181) );
  NAND3X1 U1182 ( .A(n1180), .B(n1179), .C(n1181), .Y(n453) );
  NAND2X1 U1183 ( .A(n662), .B(n678), .Y(n1182) );
  NAND2X1 U1184 ( .A(n662), .B(n646), .Y(n1183) );
  NAND2X1 U1185 ( .A(n678), .B(n646), .Y(n1184) );
  NAND3X1 U1186 ( .A(n1183), .B(n1182), .C(n1184), .Y(n437) );
  NAND2X1 U1187 ( .A(n1185), .B(n1186), .Y(n662) );
  INVX4 U1188 ( .A(n1294), .Y(n1274) );
  BUFX2 U1189 ( .A(n1064), .Y(n1192) );
  XOR2X1 U1190 ( .A(n598), .B(n582), .Y(n1187) );
  XOR2X1 U1191 ( .A(n1187), .B(n710), .Y(n442) );
  NAND2X1 U1192 ( .A(n710), .B(n598), .Y(n1188) );
  NAND2X1 U1193 ( .A(n710), .B(n582), .Y(n1189) );
  NAND2X1 U1194 ( .A(n598), .B(n582), .Y(n1190) );
  NAND3X1 U1195 ( .A(n1189), .B(n1188), .C(n1190), .Y(n441) );
  BUFX2 U1196 ( .A(n1064), .Y(n1191) );
  NAND2X1 U1197 ( .A(n1350), .B(a[17]), .Y(n1195) );
  NAND2X1 U1198 ( .A(n1194), .B(n1), .Y(n1196) );
  NAND2X1 U1199 ( .A(n1195), .B(n1196), .Y(n1219) );
  INVX4 U1200 ( .A(n1295), .Y(n1296) );
  INVX2 U1201 ( .A(n283), .Y(n1198) );
  INVX1 U1202 ( .A(n166), .Y(n283) );
  INVX1 U1203 ( .A(n1348), .Y(n1347) );
  OR2X2 U1204 ( .A(n481), .B(n470), .Y(n1200) );
  OR2X2 U1205 ( .A(n302), .B(n307), .Y(n1204) );
  OR2X2 U1206 ( .A(n322), .B(n329), .Y(n1203) );
  INVX4 U1207 ( .A(n1299), .Y(n1221) );
  NOR2X1 U1208 ( .A(n1260), .B(n1216), .Y(n1199) );
  INVX8 U1209 ( .A(n1285), .Y(n1286) );
  AND2X2 U1210 ( .A(n481), .B(n470), .Y(n1201) );
  XNOR2X1 U1211 ( .A(n1202), .B(n419), .Y(n404) );
  XNOR2X1 U1212 ( .A(n421), .B(n408), .Y(n1202) );
  OR2X1 U1213 ( .A(n523), .B(n518), .Y(n1205) );
  AND2X2 U1214 ( .A(n491), .B(n482), .Y(n1206) );
  OR2X1 U1215 ( .A(n491), .B(n482), .Y(n1207) );
  AND2X2 U1216 ( .A(n523), .B(n518), .Y(n1208) );
  XNOR2X1 U1217 ( .A(n623), .B(n1209), .Y(n348) );
  XNOR2X1 U1218 ( .A(n359), .B(n577), .Y(n1209) );
  INVX2 U1219 ( .A(n551), .Y(n637) );
  INVX2 U1220 ( .A(n560), .Y(n691) );
  INVX2 U1221 ( .A(n1276), .Y(n627) );
  INVX2 U1222 ( .A(n781), .Y(n1277) );
  OR2X1 U1223 ( .A(n533), .B(n530), .Y(n1210) );
  OR2X1 U1224 ( .A(n539), .B(n538), .Y(n1211) );
  AND2X2 U1225 ( .A(n533), .B(n530), .Y(n1212) );
  AND2X2 U1226 ( .A(n539), .B(n538), .Y(n1213) );
  XNOR2X1 U1227 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1228 ( .A(n554), .Y(n655) );
  INVX2 U1229 ( .A(n548), .Y(n619) );
  INVX2 U1230 ( .A(n1099), .Y(n1292) );
  INVX2 U1231 ( .A(n1309), .Y(n1310) );
  INVX2 U1232 ( .A(n545), .Y(n601) );
  INVX2 U1233 ( .A(n1218), .Y(n1295) );
  AND2X2 U1234 ( .A(n572), .B(n725), .Y(n1215) );
  XOR2X1 U1235 ( .A(n25), .B(a[25]), .Y(n1216) );
  INVX4 U1236 ( .A(n1313), .Y(n1314) );
  INVX2 U1237 ( .A(n883), .Y(n1329) );
  INVX2 U1238 ( .A(n1221), .Y(n1222) );
  INVX2 U1239 ( .A(n1221), .Y(n1223) );
  INVX2 U1240 ( .A(n1216), .Y(n1299) );
  BUFX4 U1241 ( .A(n422), .Y(n1225) );
  INVX1 U1242 ( .A(n222), .Y(n221) );
  INVX8 U1243 ( .A(n1289), .Y(n1290) );
  INVX1 U1244 ( .A(n200), .Y(n202) );
  BUFX4 U1245 ( .A(n452), .Y(n1226) );
  INVX1 U1246 ( .A(n213), .Y(n212) );
  INVX1 U1247 ( .A(n199), .Y(n201) );
  BUFX2 U1248 ( .A(n52), .Y(n1228) );
  BUFX2 U1249 ( .A(n52), .Y(n1229) );
  BUFX2 U1250 ( .A(n52), .Y(n1230) );
  INVX1 U1251 ( .A(n49), .Y(n1348) );
  BUFX2 U1252 ( .A(n53), .Y(n1231) );
  BUFX4 U1253 ( .A(n53), .Y(n1232) );
  INVX2 U1254 ( .A(n1222), .Y(n1279) );
  INVX2 U1255 ( .A(n888), .Y(n1319) );
  AND2X2 U1256 ( .A(n896), .B(n1218), .Y(n1236) );
  NOR2X1 U1257 ( .A(n1260), .B(n1216), .Y(n1237) );
  INVX1 U1258 ( .A(n216), .Y(n290) );
  XOR2X1 U1259 ( .A(n417), .B(n406), .Y(n1238) );
  XOR2X1 U1260 ( .A(n1238), .B(n404), .Y(n402) );
  NAND2X1 U1261 ( .A(n421), .B(n408), .Y(n1239) );
  NAND2X1 U1262 ( .A(n421), .B(n419), .Y(n1240) );
  NAND2X1 U1263 ( .A(n408), .B(n419), .Y(n1241) );
  NAND3X1 U1264 ( .A(n1239), .B(n1240), .C(n1241), .Y(n403) );
  NAND2X1 U1265 ( .A(n406), .B(n417), .Y(n1242) );
  NAND2X1 U1266 ( .A(n406), .B(n404), .Y(n1243) );
  NAND2X1 U1267 ( .A(n417), .B(n404), .Y(n1244) );
  NAND3X1 U1268 ( .A(n1242), .B(n1243), .C(n1244), .Y(n401) );
  XOR2X1 U1269 ( .A(n426), .B(n439), .Y(n1245) );
  XOR2X1 U1270 ( .A(n424), .B(n1245), .Y(n420) );
  NAND2X1 U1271 ( .A(n424), .B(n426), .Y(n1246) );
  NAND2X1 U1272 ( .A(n424), .B(n439), .Y(n1247) );
  NAND2X1 U1273 ( .A(n426), .B(n439), .Y(n1248) );
  NAND3X1 U1274 ( .A(n1247), .B(n1246), .C(n1248), .Y(n419) );
  INVX1 U1275 ( .A(n182), .Y(n285) );
  INVX2 U1276 ( .A(n423), .Y(n1249) );
  INVX4 U1277 ( .A(n1304), .Y(n1306) );
  INVX1 U1278 ( .A(n19), .Y(n1251) );
  XOR2X1 U1279 ( .A(n578), .B(n385), .Y(n1252) );
  XOR2X1 U1280 ( .A(n1252), .B(n641), .Y(n372) );
  XOR2X1 U1281 ( .A(n625), .B(n593), .Y(n1253) );
  XOR2X1 U1282 ( .A(n1253), .B(n372), .Y(n368) );
  NAND2X1 U1283 ( .A(n578), .B(n385), .Y(n1254) );
  NAND2X1 U1284 ( .A(n578), .B(n641), .Y(n1255) );
  NAND2X1 U1285 ( .A(n385), .B(n641), .Y(n1256) );
  NAND3X1 U1286 ( .A(n1254), .B(n1255), .C(n1256), .Y(n371) );
  NAND2X1 U1287 ( .A(n625), .B(n593), .Y(n1257) );
  NAND2X1 U1288 ( .A(n625), .B(n372), .Y(n1258) );
  NAND2X1 U1289 ( .A(n593), .B(n372), .Y(n1259) );
  NAND3X1 U1290 ( .A(n1257), .B(n1258), .C(n1259), .Y(n367) );
  INVX4 U1291 ( .A(n51), .Y(n1311) );
  INVX2 U1292 ( .A(n1216), .Y(n1300) );
  XOR2X1 U1293 ( .A(n622), .B(n606), .Y(n1261) );
  XOR2X1 U1294 ( .A(n1261), .B(n347), .Y(n334) );
  XOR2X1 U1295 ( .A(n345), .B(n336), .Y(n1262) );
  XOR2X1 U1296 ( .A(n1262), .B(n334), .Y(n332) );
  NAND2X1 U1297 ( .A(n622), .B(n606), .Y(n1263) );
  NAND2X1 U1298 ( .A(n622), .B(n347), .Y(n1264) );
  NAND2X1 U1299 ( .A(n606), .B(n347), .Y(n1265) );
  NAND3X1 U1300 ( .A(n1263), .B(n1264), .C(n1265), .Y(n333) );
  NAND2X1 U1301 ( .A(n345), .B(n336), .Y(n1266) );
  NAND2X1 U1302 ( .A(n345), .B(n334), .Y(n1267) );
  NAND2X1 U1303 ( .A(n336), .B(n334), .Y(n1268) );
  NAND3X1 U1304 ( .A(n1266), .B(n1267), .C(n1268), .Y(n331) );
  NAND2X1 U1305 ( .A(n623), .B(n359), .Y(n1269) );
  NAND2X1 U1306 ( .A(n623), .B(n577), .Y(n1270) );
  NAND2X1 U1307 ( .A(n359), .B(n577), .Y(n1271) );
  NAND3X1 U1308 ( .A(n1270), .B(n1269), .C(n1271), .Y(n347) );
  INVX2 U1309 ( .A(n1008), .Y(n1293) );
  INVX1 U1310 ( .A(n205), .Y(n288) );
  BUFX2 U1311 ( .A(n1131), .Y(n1275) );
  AOI22X1 U1312 ( .A(n1221), .B(n1277), .C(n1085), .D(n1061), .Y(n1276) );
  INVX2 U1313 ( .A(n16), .Y(n1287) );
  AOI22X1 U1314 ( .A(n1237), .B(n1062), .C(n1279), .D(n1061), .Y(n1278) );
  XNOR2X1 U1315 ( .A(n73), .B(n1280), .Y(product[46]) );
  AND2X2 U1316 ( .A(n72), .B(n1035), .Y(n1280) );
  AND2X2 U1317 ( .A(n1347), .B(n1345), .Y(n582) );
  INVX4 U1318 ( .A(n1283), .Y(n1284) );
  INVX8 U1319 ( .A(n1363), .Y(n1361) );
  INVX2 U1320 ( .A(n557), .Y(n673) );
  INVX1 U1321 ( .A(n172), .Y(n174) );
  INVX1 U1322 ( .A(n891), .Y(n1313) );
  INVX1 U1323 ( .A(n194), .Y(n287) );
  INVX4 U1324 ( .A(n18), .Y(n1289) );
  INVX1 U1325 ( .A(n1172), .Y(n284) );
  INVX1 U1326 ( .A(n161), .Y(n282) );
  INVX1 U1327 ( .A(n1232), .Y(n155) );
  INVX1 U1328 ( .A(n1229), .Y(n156) );
  INVX8 U1329 ( .A(n1311), .Y(n1312) );
  INVX8 U1330 ( .A(n1325), .Y(n1326) );
  INVX8 U1331 ( .A(n1115), .Y(n1345) );
  INVX8 U1332 ( .A(n7), .Y(n1353) );
  INVX2 U1333 ( .A(n101), .Y(n99) );
  INVX2 U1334 ( .A(n94), .Y(n92) );
  INVX2 U1335 ( .A(n79), .Y(n77) );
  OAI22X1 U1336 ( .A(n917), .B(n1350), .C(n1096), .D(n6), .Y(n563) );
  OAI22X1 U1337 ( .A(n1193), .B(n1353), .C(n1286), .D(n1353), .Y(n560) );
  OAI22X1 U1338 ( .A(n1288), .B(n1129), .C(n1290), .D(n1129), .Y(n557) );
  OAI22X1 U1339 ( .A(n1293), .B(n1251), .C(n1273), .D(n1251), .Y(n554) );
  OAI22X1 U1340 ( .A(n1296), .B(n1358), .C(n1214), .D(n1358), .Y(n551) );
  OAI22X1 U1341 ( .A(n1300), .B(n1125), .C(n1302), .D(n1125), .Y(n548) );
  OAI22X1 U1342 ( .A(n1137), .B(n1067), .C(n1128), .D(n1067), .Y(n545) );
  OAI22X1 U1343 ( .A(n1308), .B(n918), .C(n1310), .D(n918), .Y(n542) );
  INVX2 U1344 ( .A(n385), .Y(n386) );
  INVX2 U1345 ( .A(n337), .Y(n338) );
  INVX2 U1346 ( .A(n319), .Y(n320) );
  INVX2 U1347 ( .A(n305), .Y(n306) );
  INVX2 U1348 ( .A(n295), .Y(n296) );
  INVX2 U1349 ( .A(n130), .Y(n279) );
  INVX2 U1350 ( .A(n93), .Y(n91) );
  INVX2 U1351 ( .A(n84), .Y(n275) );
  INVX2 U1352 ( .A(n211), .Y(n209) );
  INVX2 U1353 ( .A(n183), .Y(n181) );
  INVX2 U1354 ( .A(n149), .Y(n151) );
  INVX2 U1355 ( .A(n148), .Y(n281) );
  INVX2 U1356 ( .A(n144), .Y(n142) );
  INVX2 U1357 ( .A(n129), .Y(n127) );
  INVX2 U1358 ( .A(n122), .Y(n120) );
  INVX2 U1359 ( .A(n111), .Y(n109) );
  INVX2 U1360 ( .A(n105), .Y(n103) );
  INVX2 U1361 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16:15], n25, n17, n7, 
        n23, n11, n14, src1_data[8], n33, src1_data[6], n31, n15, n29, n8, n18, 
        src1_data[0]}), .B({src2_data[16], src2_data[16], n22, 
        src2_data[14:13], n19, n3, n4, n24, src2_data[8:5], n13, 
        src2_data[3:0]}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16:15], n25, n17, n7, 
        n23, n11, n14, src1_data[8], n33, src1_data[6], n31, src1_data[4], n29, 
        src1_data[2], n18, src1_data[0]}), .B({src2_data[16], src2_data[16], 
        n22, src2_data[14:13], n19, n3, n4, n24, src2_data[8:5], n13, 
        src2_data[3:1], n5}), .CI(1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:14], n39, src1_data[12], n37, 
        src1_data[10], n35, src1_data[8], n33, src1_data[6], n31, src1_data[4], 
        n29, src1_data[2], n9, src1_data[0], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .b(
        src2_data[15:0]), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  INVX8 U3 ( .A(n30), .Y(n29) );
  INVX4 U4 ( .A(src1_data[3]), .Y(n30) );
  INVX2 U6 ( .A(src1_data[5]), .Y(n32) );
  INVX2 U7 ( .A(src1_data[7]), .Y(n34) );
  INVX1 U9 ( .A(src1_data[14]), .Y(n1) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(n26), .Y(n18) );
  INVX8 U12 ( .A(n26), .Y(n9) );
  INVX4 U13 ( .A(src1_data[1]), .Y(n26) );
  BUFX2 U14 ( .A(src2_data[11]), .Y(n3) );
  BUFX2 U15 ( .A(src2_data[10]), .Y(n4) );
  BUFX2 U16 ( .A(src2_data[0]), .Y(n5) );
  INVX1 U17 ( .A(src1_data[12]), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n7) );
  BUFX2 U19 ( .A(src1_data[2]), .Y(n8) );
  INVX1 U20 ( .A(src1_data[10]), .Y(n10) );
  INVX2 U21 ( .A(n10), .Y(n11) );
  INVX1 U22 ( .A(src2_data[4]), .Y(n12) );
  INVX2 U23 ( .A(n12), .Y(n13) );
  INVX1 U24 ( .A(n36), .Y(n14) );
  INVX4 U25 ( .A(n36), .Y(n35) );
  INVX2 U26 ( .A(src1_data[9]), .Y(n36) );
  BUFX2 U27 ( .A(src1_data[4]), .Y(n15) );
  INVX1 U28 ( .A(n39), .Y(n16) );
  INVX2 U29 ( .A(n16), .Y(n17) );
  BUFX2 U30 ( .A(src2_data[12]), .Y(n19) );
  INVX2 U31 ( .A(n84), .Y(n79) );
  INVX2 U32 ( .A(n47), .Y(n78) );
  AND2X2 U33 ( .A(n46), .B(n45), .Y(n20) );
  AND2X2 U34 ( .A(alu_op[1]), .B(n45), .Y(n21) );
  INVX1 U35 ( .A(large_sum[16]), .Y(n83) );
  BUFX2 U36 ( .A(src2_data[15]), .Y(n22) );
  INVX4 U37 ( .A(n40), .Y(n39) );
  INVX2 U38 ( .A(src1_data[13]), .Y(n40) );
  INVX1 U39 ( .A(n38), .Y(n23) );
  INVX4 U40 ( .A(n38), .Y(n37) );
  INVX2 U41 ( .A(src1_data[11]), .Y(n38) );
  BUFX2 U42 ( .A(src2_data[9]), .Y(n24) );
  BUFX2 U43 ( .A(n2), .Y(n25) );
  INVX8 U44 ( .A(n32), .Y(n31) );
  INVX8 U45 ( .A(n34), .Y(n33) );
  NAND2X1 U46 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n47) );
  INVX2 U47 ( .A(N26), .Y(n44) );
  INVX2 U48 ( .A(alu_op[0]), .Y(n45) );
  XOR2X1 U49 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n42) );
  INVX2 U50 ( .A(alu_op[1]), .Y(n46) );
  NAND2X1 U51 ( .A(alu_op[0]), .B(n46), .Y(n84) );
  XOR2X1 U52 ( .A(large_sum[17]), .B(large_sum[16]), .Y(n41) );
  AOI22X1 U53 ( .A(n42), .B(n21), .C(n79), .D(n41), .Y(n43) );
  OAI21X1 U54 ( .A(n47), .B(n44), .C(n43), .Y(overflow) );
  AOI22X1 U55 ( .A(src1_data[0]), .B(n20), .C(full_mult[30]), .D(n78), .Y(n49)
         );
  AOI22X1 U56 ( .A(large_dif[0]), .B(n21), .C(large_sum[0]), .D(n79), .Y(n48)
         );
  NAND2X1 U57 ( .A(n49), .B(n48), .Y(result[0]) );
  AOI22X1 U58 ( .A(n18), .B(n20), .C(full_mult[31]), .D(n78), .Y(n51) );
  AOI22X1 U59 ( .A(large_dif[1]), .B(n21), .C(large_sum[1]), .D(n79), .Y(n50)
         );
  NAND2X1 U60 ( .A(n51), .B(n50), .Y(result[1]) );
  AOI22X1 U61 ( .A(n8), .B(n20), .C(full_mult[32]), .D(n78), .Y(n53) );
  AOI22X1 U62 ( .A(large_dif[2]), .B(n21), .C(large_sum[2]), .D(n79), .Y(n52)
         );
  NAND2X1 U63 ( .A(n53), .B(n52), .Y(result[2]) );
  AOI22X1 U64 ( .A(n29), .B(n20), .C(full_mult[33]), .D(n78), .Y(n55) );
  AOI22X1 U65 ( .A(large_dif[3]), .B(n21), .C(large_sum[3]), .D(n79), .Y(n54)
         );
  NAND2X1 U66 ( .A(n55), .B(n54), .Y(result[3]) );
  AOI22X1 U67 ( .A(n15), .B(n20), .C(full_mult[34]), .D(n78), .Y(n57) );
  AOI22X1 U68 ( .A(large_dif[4]), .B(n21), .C(large_sum[4]), .D(n79), .Y(n56)
         );
  NAND2X1 U69 ( .A(n57), .B(n56), .Y(result[4]) );
  AOI22X1 U70 ( .A(n31), .B(n20), .C(full_mult[35]), .D(n78), .Y(n59) );
  AOI22X1 U71 ( .A(large_dif[5]), .B(n21), .C(large_sum[5]), .D(n79), .Y(n58)
         );
  NAND2X1 U72 ( .A(n59), .B(n58), .Y(result[5]) );
  AOI22X1 U73 ( .A(src1_data[6]), .B(n20), .C(full_mult[36]), .D(n78), .Y(n61)
         );
  AOI22X1 U74 ( .A(large_dif[6]), .B(n21), .C(large_sum[6]), .D(n79), .Y(n60)
         );
  NAND2X1 U75 ( .A(n61), .B(n60), .Y(result[6]) );
  AOI22X1 U76 ( .A(n33), .B(n20), .C(full_mult[37]), .D(n78), .Y(n63) );
  AOI22X1 U77 ( .A(large_dif[7]), .B(n21), .C(large_sum[7]), .D(n79), .Y(n62)
         );
  NAND2X1 U78 ( .A(n63), .B(n62), .Y(result[7]) );
  AOI22X1 U79 ( .A(src1_data[8]), .B(n20), .C(full_mult[38]), .D(n78), .Y(n65)
         );
  AOI22X1 U80 ( .A(large_dif[8]), .B(n21), .C(large_sum[8]), .D(n79), .Y(n64)
         );
  NAND2X1 U81 ( .A(n65), .B(n64), .Y(result[8]) );
  AOI22X1 U82 ( .A(n14), .B(n20), .C(full_mult[39]), .D(n78), .Y(n67) );
  AOI22X1 U83 ( .A(large_dif[9]), .B(n21), .C(large_sum[9]), .D(n79), .Y(n66)
         );
  NAND2X1 U84 ( .A(n67), .B(n66), .Y(result[9]) );
  AOI22X1 U85 ( .A(n11), .B(n20), .C(full_mult[40]), .D(n78), .Y(n69) );
  AOI22X1 U86 ( .A(large_dif[10]), .B(n21), .C(large_sum[10]), .D(n79), .Y(n68) );
  NAND2X1 U87 ( .A(n69), .B(n68), .Y(result[10]) );
  AOI22X1 U88 ( .A(n23), .B(n20), .C(full_mult[41]), .D(n78), .Y(n71) );
  AOI22X1 U89 ( .A(large_dif[11]), .B(n21), .C(large_sum[11]), .D(n79), .Y(n70) );
  NAND2X1 U90 ( .A(n71), .B(n70), .Y(result[11]) );
  AOI22X1 U91 ( .A(n7), .B(n20), .C(full_mult[42]), .D(n78), .Y(n73) );
  AOI22X1 U92 ( .A(large_dif[12]), .B(n21), .C(large_sum[12]), .D(n79), .Y(n72) );
  NAND2X1 U93 ( .A(n72), .B(n73), .Y(result[12]) );
  AOI22X1 U94 ( .A(n17), .B(n20), .C(full_mult[43]), .D(n78), .Y(n75) );
  AOI22X1 U95 ( .A(large_dif[13]), .B(n21), .C(large_sum[13]), .D(n79), .Y(n74) );
  NAND2X1 U96 ( .A(n75), .B(n74), .Y(result[13]) );
  AOI22X1 U97 ( .A(n25), .B(n20), .C(full_mult[44]), .D(n78), .Y(n77) );
  AOI22X1 U98 ( .A(large_dif[14]), .B(n21), .C(large_sum[14]), .D(n79), .Y(n76) );
  NAND2X1 U99 ( .A(n77), .B(n76), .Y(result[14]) );
  AOI22X1 U100 ( .A(src1_data[15]), .B(n20), .C(full_mult[45]), .D(n78), .Y(
        n81) );
  AOI22X1 U101 ( .A(large_dif[15]), .B(n21), .C(large_sum[15]), .D(n79), .Y(
        n80) );
  NAND2X1 U102 ( .A(n81), .B(n80), .Y(result[15]) );
  AOI22X1 U103 ( .A(src1_data[16]), .B(n20), .C(large_dif[16]), .D(n21), .Y(
        n82) );
  OAI21X1 U104 ( .A(n84), .B(n83), .C(n82), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n13), .Y(n42) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n11), .Y(n46) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U34 ( .A(n17), .Y(n34) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n16), .Y(n36) );
  INVX1 U7 ( .A(n18), .Y(n32) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  INVX1 U12 ( .A(n22), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U14 ( .A(n5), .Y(n55) );
  MUX2X1 U15 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U16 ( .A(n6), .Y(n54) );
  MUX2X1 U17 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U18 ( .A(n7), .Y(n53) );
  MUX2X1 U19 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U20 ( .A(n8), .Y(n52) );
  MUX2X1 U21 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U22 ( .A(n9), .Y(n50) );
  MUX2X1 U23 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U24 ( .A(n10), .Y(n48) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U29 ( .A(n14), .Y(n40) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U31 ( .A(n15), .Y(n38) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U34 ( .A(n17), .Y(n34) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n18), .Y(n32) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n22), .Y(n28) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U28 ( .A(n14), .Y(n40) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U30 ( .A(n15), .Y(n38) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U32 ( .A(n16), .Y(n36) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U34 ( .A(n17), .Y(n34) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n16), .Y(n36) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U24 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n40) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U29 ( .A(n15), .Y(n38) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n40) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U28 ( .A(n15), .Y(n38) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n36) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n40) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U28 ( .A(n15), .Y(n38) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n36) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n18), .Y(n32) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n22), .Y(n28) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U28 ( .A(n14), .Y(n40) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U30 ( .A(n15), .Y(n38) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U32 ( .A(n16), .Y(n36) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U34 ( .A(n17), .Y(n34) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n11), .Y(n46) );
  INVX1 U5 ( .A(n13), .Y(n42) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n22), .Y(n28) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U28 ( .A(n14), .Y(n40) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U30 ( .A(n15), .Y(n38) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U32 ( .A(n16), .Y(n36) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U34 ( .A(n17), .Y(n34) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n22), .Y(n28) );
  INVX1 U4 ( .A(n11), .Y(n46) );
  INVX1 U5 ( .A(n13), .Y(n42) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U24 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n40) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U29 ( .A(n15), .Y(n38) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U31 ( .A(n16), .Y(n36) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U33 ( .A(n17), .Y(n34) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U35 ( .A(n18), .Y(n32) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n11), .Y(n46) );
  INVX1 U5 ( .A(n13), .Y(n42) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  INVX1 U11 ( .A(n22), .Y(n28) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U28 ( .A(n14), .Y(n40) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U30 ( .A(n15), .Y(n38) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U32 ( .A(n16), .Y(n36) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U34 ( .A(n17), .Y(n34) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n22), .Y(n28) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n18), .Y(n32) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n12), .Y(n44) );
  INVX2 U8 ( .A(n1), .Y(n2) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  INVX2 U10 ( .A(n4), .Y(n3) );
  INVX2 U11 ( .A(n_reset), .Y(n4) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U28 ( .A(n14), .Y(n40) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U30 ( .A(n15), .Y(n38) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U32 ( .A(n16), .Y(n36) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U34 ( .A(n17), .Y(n34) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n40) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U28 ( .A(n15), .Y(n38) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n36) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n40) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U28 ( .A(n15), .Y(n38) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n36) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U24 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n40) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U29 ( .A(n15), .Y(n38) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n11), .Y(n46) );
  INVX1 U5 ( .A(n13), .Y(n42) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U24 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n40) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U29 ( .A(n15), .Y(n38) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U31 ( .A(n16), .Y(n36) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U33 ( .A(n17), .Y(n34) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n11), .Y(n46) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n40) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U28 ( .A(n15), .Y(n38) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n36) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U34 ( .A(n18), .Y(n32) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n103, n104, n106,
         n107, n108, n109, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n732), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n731), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n733), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n732), .Y(n10) );
  NOR2X1 U29 ( .A(n730), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n731), .B(n733), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n729), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n721, n718, 
        n715, n713, n710, n707, n704, n701, n699, n695, n693, n690, n687, n684, 
        n681, n678}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n722), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n720, n98, 
        n715, n87, n96, n89, n85, n701, n698, n696, n692, n689, n686, n683, 
        n680, n678}), .current_value({\regs_matrix[1][16] , 
        \regs_matrix[1][15] , \regs_matrix[1][14] , \regs_matrix[1][13] , 
        \regs_matrix[1][12] , \regs_matrix[1][11] , \regs_matrix[1][10] , 
        \regs_matrix[1][9] , \regs_matrix[1][8] , \regs_matrix[1][7] , 
        \regs_matrix[1][6] , \regs_matrix[1][5] , \regs_matrix[1][4] , 
        \regs_matrix[1][3] , \regs_matrix[1][2] , \regs_matrix[1][1] , 
        \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n722), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n721, n718, 
        n715, n713, n710, n707, n704, n701, n699, n83, n693, n690, n687, n684, 
        n681, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n723), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n720, n717, 
        n715, n712, n709, n706, n703, n701, n91, n696, n692, n689, n686, n683, 
        n680, n678}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n723), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n721, n718, 
        n715, n713, n710, n707, n704, n701, n699, n695, n693, n690, n687, n684, 
        n681, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n724), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n720, n99, 
        n715, n88, n97, n90, n86, n701, n92, n696, n692, n689, n686, n683, 
        n680, n678}), .current_value({\regs_matrix[5][16] , 
        \regs_matrix[5][15] , \regs_matrix[5][14] , \regs_matrix[5][13] , 
        \regs_matrix[5][12] , \regs_matrix[5][11] , \regs_matrix[5][10] , 
        \regs_matrix[5][9] , \regs_matrix[5][8] , \regs_matrix[5][7] , 
        \regs_matrix[5][6] , \regs_matrix[5][5] , \regs_matrix[5][4] , 
        \regs_matrix[5][3] , \regs_matrix[5][2] , \regs_matrix[5][1] , 
        \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n724), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n721, n718, 
        n715, n713, n710, n707, n704, n701, n699, n84, n693, n690, n687, n684, 
        n681, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n725), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n720, n98, 
        n715, n87, n96, n89, n85, n701, n92, n696, n692, n689, n686, n683, 
        n680, n678}), .current_value({\regs_matrix[7][16] , 
        \regs_matrix[7][15] , \regs_matrix[7][14] , \regs_matrix[7][13] , 
        \regs_matrix[7][12] , \regs_matrix[7][11] , \regs_matrix[7][10] , 
        \regs_matrix[7][9] , \regs_matrix[7][8] , \regs_matrix[7][7] , 
        \regs_matrix[7][6] , \regs_matrix[7][5] , \regs_matrix[7][4] , 
        \regs_matrix[7][3] , \regs_matrix[7][2] , \regs_matrix[7][1] , 
        \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n725), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n721, n99, 
        n715, n88, n97, n90, n86, n701, n91, n83, n693, n690, n687, n684, n681, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n726), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n720, n717, 
        n715, n712, n709, n706, n703, n701, n698, n84, n692, n689, n686, n683, 
        n680, n678}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n726), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n721, n98, 
        n715, n87, n96, n89, n85, n701, n91, n695, n693, n690, n687, n684, 
        n681, w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n727), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n720, n99, 
        n715, n88, n97, n90, n86, n701, n698, n83, n692, n689, n686, n683, 
        n680, n678}), .current_value({\regs_matrix[11][16] , 
        \regs_matrix[11][15] , \regs_matrix[11][14] , \regs_matrix[11][13] , 
        \regs_matrix[11][12] , \regs_matrix[11][11] , \regs_matrix[11][10] , 
        \regs_matrix[11][9] , \regs_matrix[11][8] , \regs_matrix[11][7] , 
        \regs_matrix[11][6] , \regs_matrix[11][5] , \regs_matrix[11][4] , 
        \regs_matrix[11][3] , \regs_matrix[11][2] , \regs_matrix[11][1] , 
        \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n727), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n721, n717, 
        n715, n712, n709, n706, n703, n701, n698, n84, n693, n690, n687, n684, 
        n681, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n728), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n720, n98, 
        n715, n87, n709, n89, n85, n701, n92, n695, n692, n689, n686, n683, 
        n680, n678}), .current_value({\regs_matrix[13][16] , 
        \regs_matrix[13][15] , \regs_matrix[13][14] , \regs_matrix[13][13] , 
        \regs_matrix[13][12] , \regs_matrix[13][11] , \regs_matrix[13][10] , 
        \regs_matrix[13][9] , \regs_matrix[13][8] , \regs_matrix[13][7] , 
        \regs_matrix[13][6] , \regs_matrix[13][5] , \regs_matrix[13][4] , 
        \regs_matrix[13][3] , \regs_matrix[13][2] , \regs_matrix[13][1] , 
        \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n728), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n721, n99, 
        n715, n88, n97, n90, n86, n701, n92, n83, n693, n690, n687, n684, n681, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n729), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n720, n717, 
        n715, n712, n96, n706, n703, n701, n91, n84, n692, n689, n686, n683, 
        n680, n678}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  BUFX2 U2 ( .A(n653), .Y(n1) );
  BUFX4 U3 ( .A(n653), .Y(n2) );
  INVX4 U4 ( .A(n369), .Y(n371) );
  INVX4 U5 ( .A(N16), .Y(n646) );
  BUFX4 U31 ( .A(n75), .Y(n652) );
  INVX8 U32 ( .A(n384), .Y(n3) );
  INVX8 U33 ( .A(n3), .Y(n4) );
  INVX8 U34 ( .A(n3), .Y(n14) );
  INVX4 U35 ( .A(n130), .Y(n373) );
  INVX4 U36 ( .A(n418), .Y(n668) );
  INVX8 U37 ( .A(n668), .Y(n669) );
  INVX8 U38 ( .A(n668), .Y(n670) );
  INVX1 U39 ( .A(n656), .Y(n15) );
  INVX1 U40 ( .A(n656), .Y(n16) );
  INVX1 U41 ( .A(n656), .Y(n17) );
  INVX1 U42 ( .A(n656), .Y(n18) );
  INVX1 U43 ( .A(n656), .Y(n19) );
  INVX1 U44 ( .A(n656), .Y(n20) );
  INVX1 U45 ( .A(n657), .Y(n21) );
  INVX1 U46 ( .A(n657), .Y(n22) );
  INVX1 U47 ( .A(n657), .Y(n23) );
  INVX1 U48 ( .A(n657), .Y(n24) );
  INVX2 U49 ( .A(n657), .Y(n25) );
  INVX1 U50 ( .A(n658), .Y(n26) );
  INVX1 U51 ( .A(n658), .Y(n27) );
  INVX1 U52 ( .A(n658), .Y(n28) );
  INVX1 U53 ( .A(n658), .Y(n29) );
  INVX1 U54 ( .A(n658), .Y(n30) );
  INVX2 U55 ( .A(n658), .Y(n31) );
  INVX1 U56 ( .A(n412), .Y(n32) );
  INVX4 U57 ( .A(n412), .Y(n656) );
  BUFX4 U58 ( .A(n656), .Y(n658) );
  INVX2 U59 ( .A(n80), .Y(n579) );
  INVX2 U60 ( .A(N15), .Y(n645) );
  INVX2 U61 ( .A(\regs_matrix[3][11] ), .Y(n81) );
  INVX2 U62 ( .A(\regs_matrix[1][11] ), .Y(n82) );
  INVX4 U63 ( .A(n651), .Y(n655) );
  INVX4 U64 ( .A(n39), .Y(n40) );
  INVX2 U65 ( .A(n663), .Y(n39) );
  INVX2 U66 ( .A(n650), .Y(n653) );
  INVX4 U67 ( .A(n659), .Y(n660) );
  INVX2 U68 ( .A(n419), .Y(n671) );
  INVX2 U69 ( .A(n396), .Y(r1_data[2]) );
  INVX2 U70 ( .A(n133), .Y(n383) );
  INVX2 U71 ( .A(n131), .Y(n376) );
  INVX4 U72 ( .A(n383), .Y(n384) );
  INVX4 U73 ( .A(n383), .Y(n385) );
  INVX4 U74 ( .A(n688), .Y(n690) );
  INVX4 U75 ( .A(n688), .Y(n689) );
  INVX1 U76 ( .A(n70), .Y(n71) );
  INVX2 U77 ( .A(n72), .Y(n67) );
  MUX2X1 U78 ( .B(n141), .A(n140), .S(n388), .Y(r1_data[1]) );
  NAND2X1 U79 ( .A(n647), .B(N16), .Y(n33) );
  NAND2X1 U80 ( .A(n645), .B(n34), .Y(n413) );
  INVX2 U81 ( .A(n33), .Y(n34) );
  AND2X2 U82 ( .A(N11), .B(N10), .Y(n76) );
  BUFX2 U83 ( .A(N10), .Y(n73) );
  INVX1 U84 ( .A(N11), .Y(n72) );
  NAND2X1 U85 ( .A(n79), .B(n646), .Y(n35) );
  BUFX2 U86 ( .A(n664), .Y(n36) );
  BUFX4 U87 ( .A(n664), .Y(n37) );
  INVX1 U88 ( .A(n662), .Y(n664) );
  NAND3X1 U89 ( .A(n73), .B(n350), .C(n349), .Y(n38) );
  BUFX2 U90 ( .A(n78), .Y(n41) );
  INVX2 U91 ( .A(n78), .Y(n42) );
  INVX1 U92 ( .A(n78), .Y(n43) );
  INVX1 U93 ( .A(n78), .Y(n44) );
  INVX2 U94 ( .A(n42), .Y(n45) );
  INVX2 U95 ( .A(n42), .Y(n46) );
  INVX1 U96 ( .A(n42), .Y(n47) );
  INVX2 U97 ( .A(n43), .Y(n48) );
  INVX1 U98 ( .A(n43), .Y(n49) );
  INVX1 U99 ( .A(n43), .Y(n50) );
  INVX1 U100 ( .A(n44), .Y(n51) );
  INVX1 U101 ( .A(n44), .Y(n52) );
  INVX1 U102 ( .A(n44), .Y(n53) );
  INVX1 U103 ( .A(n41), .Y(n54) );
  INVX1 U104 ( .A(n41), .Y(n55) );
  INVX1 U105 ( .A(n41), .Y(n56) );
  INVX1 U106 ( .A(n54), .Y(n57) );
  INVX1 U107 ( .A(n54), .Y(n58) );
  INVX1 U108 ( .A(n54), .Y(n59) );
  INVX1 U109 ( .A(n55), .Y(n60) );
  INVX1 U110 ( .A(n55), .Y(n61) );
  INVX1 U111 ( .A(n55), .Y(n62) );
  INVX1 U112 ( .A(n56), .Y(n63) );
  INVX1 U113 ( .A(n56), .Y(n64) );
  INVX1 U114 ( .A(n56), .Y(n65) );
  NAND3X1 U115 ( .A(N16), .B(N14), .C(n645), .Y(n66) );
  INVX4 U116 ( .A(N12), .Y(n350) );
  INVX2 U117 ( .A(n414), .Y(n662) );
  MUX2X1 U118 ( .B(n219), .A(n218), .S(n388), .Y(r1_data[7]) );
  INVX8 U119 ( .A(n659), .Y(n661) );
  AND2X2 U120 ( .A(n154), .B(n155), .Y(n395) );
  INVX4 U121 ( .A(n362), .Y(n68) );
  INVX4 U122 ( .A(n362), .Y(n69) );
  INVX2 U123 ( .A(n362), .Y(n365) );
  INVX8 U124 ( .A(n714), .Y(n715) );
  INVX1 U125 ( .A(n363), .Y(n70) );
  INVX8 U126 ( .A(n700), .Y(n701) );
  INVX8 U127 ( .A(n665), .Y(n667) );
  BUFX4 U128 ( .A(n361), .Y(n362) );
  INVX1 U129 ( .A(n358), .Y(n74) );
  AND2X1 U130 ( .A(N15), .B(N14), .Y(n79) );
  INVX1 U131 ( .A(n411), .Y(n75) );
  AND2X2 U132 ( .A(N16), .B(N14), .Y(n77) );
  NAND2X1 U133 ( .A(N15), .B(n77), .Y(n78) );
  INVX8 U134 ( .A(n373), .Y(n374) );
  BUFX2 U135 ( .A(n354), .Y(n357) );
  INVX2 U136 ( .A(n411), .Y(n650) );
  MUX2X1 U137 ( .B(n167), .A(n166), .S(n388), .Y(r1_data[3]) );
  AND2X2 U138 ( .A(n206), .B(n207), .Y(n398) );
  INVX4 U139 ( .A(n369), .Y(n109) );
  INVX4 U140 ( .A(n671), .Y(n673) );
  AOI22X1 U141 ( .A(n81), .B(n665), .C(n82), .D(n668), .Y(n80) );
  INVX2 U142 ( .A(n357), .Y(n358) );
  AND2X2 U143 ( .A(n212), .B(n213), .Y(n397) );
  BUFX4 U144 ( .A(n650), .Y(n651) );
  INVX2 U145 ( .A(n355), .Y(n392) );
  INVX2 U146 ( .A(N10), .Y(n351) );
  INVX2 U147 ( .A(n694), .Y(n83) );
  INVX2 U148 ( .A(n694), .Y(n84) );
  INVX4 U149 ( .A(w_data[6]), .Y(n694) );
  INVX2 U150 ( .A(n702), .Y(n85) );
  INVX2 U151 ( .A(n702), .Y(n86) );
  INVX4 U152 ( .A(w_data[9]), .Y(n702) );
  INVX4 U153 ( .A(w_data[8]), .Y(n700) );
  INVX2 U154 ( .A(n711), .Y(n87) );
  INVX2 U155 ( .A(n711), .Y(n88) );
  INVX4 U156 ( .A(w_data[12]), .Y(n711) );
  INVX2 U157 ( .A(n705), .Y(n89) );
  INVX2 U158 ( .A(n705), .Y(n90) );
  INVX4 U159 ( .A(w_data[10]), .Y(n705) );
  INVX2 U160 ( .A(n697), .Y(n91) );
  INVX2 U161 ( .A(n697), .Y(n92) );
  INVX4 U162 ( .A(w_data[7]), .Y(n697) );
  NAND2X1 U163 ( .A(n118), .B(n388), .Y(n93) );
  NAND2X1 U164 ( .A(n119), .B(n386), .Y(n94) );
  NAND2X1 U165 ( .A(n93), .B(n94), .Y(n95) );
  INVX4 U166 ( .A(n95), .Y(r1_data[0]) );
  INVX1 U167 ( .A(n388), .Y(n386) );
  INVX2 U168 ( .A(n708), .Y(n96) );
  INVX2 U169 ( .A(n708), .Y(n97) );
  INVX4 U170 ( .A(w_data[11]), .Y(n708) );
  INVX2 U171 ( .A(n716), .Y(n98) );
  INVX2 U172 ( .A(n716), .Y(n99) );
  INVX4 U173 ( .A(w_data[14]), .Y(n716) );
  INVX2 U174 ( .A(n662), .Y(n100) );
  INVX2 U175 ( .A(n662), .Y(n101) );
  INVX2 U176 ( .A(N17), .Y(n676) );
  MUX2X1 U177 ( .B(n103), .A(n104), .S(n386), .Y(r1_data[4]) );
  NAND2X1 U178 ( .A(n186), .B(n187), .Y(n103) );
  NAND2X1 U179 ( .A(n180), .B(n181), .Y(n104) );
  MUX2X1 U180 ( .B(n106), .A(n107), .S(n386), .Y(r1_data[10]) );
  NAND2X1 U181 ( .A(n266), .B(n267), .Y(n106) );
  NAND2X1 U182 ( .A(n260), .B(n261), .Y(n107) );
  INVX2 U183 ( .A(w_data[4]), .Y(n688) );
  INVX2 U184 ( .A(w_data[3]), .Y(n685) );
  INVX2 U185 ( .A(w_data[2]), .Y(n682) );
  INVX2 U186 ( .A(w_data[5]), .Y(n691) );
  INVX2 U187 ( .A(w_data[1]), .Y(n679) );
  INVX2 U188 ( .A(w_data[0]), .Y(n677) );
  INVX2 U189 ( .A(n369), .Y(n108) );
  INVX2 U190 ( .A(n369), .Y(n372) );
  INVX2 U191 ( .A(n369), .Y(n370) );
  INVX2 U192 ( .A(n662), .Y(n663) );
  BUFX2 U193 ( .A(n656), .Y(n657) );
  INVX2 U194 ( .A(n676), .Y(n675) );
  INVX2 U195 ( .A(n676), .Y(n674) );
  INVX2 U196 ( .A(n388), .Y(n387) );
  INVX4 U197 ( .A(n127), .Y(n369) );
  INVX2 U198 ( .A(N13), .Y(n388) );
  MUX2X1 U199 ( .B(n111), .A(n112), .S(n387), .Y(r1_data[14]) );
  NAND2X1 U200 ( .A(n318), .B(n319), .Y(n111) );
  NAND2X1 U201 ( .A(n312), .B(n313), .Y(n112) );
  INVX4 U202 ( .A(n719), .Y(n721) );
  INVX4 U203 ( .A(n719), .Y(n720) );
  INVX2 U204 ( .A(n705), .Y(n707) );
  INVX2 U205 ( .A(n716), .Y(n718) );
  INVX2 U206 ( .A(n711), .Y(n713) );
  INVX2 U207 ( .A(n705), .Y(n706) );
  INVX2 U208 ( .A(n716), .Y(n717) );
  INVX2 U209 ( .A(n711), .Y(n712) );
  INVX2 U210 ( .A(n708), .Y(n710) );
  INVX2 U211 ( .A(n708), .Y(n709) );
  INVX2 U212 ( .A(n697), .Y(n699) );
  INVX2 U213 ( .A(n702), .Y(n704) );
  INVX2 U214 ( .A(n697), .Y(n698) );
  INVX2 U215 ( .A(n702), .Y(n703) );
  INVX2 U216 ( .A(n694), .Y(n695) );
  INVX2 U217 ( .A(n694), .Y(n696) );
  INVX2 U218 ( .A(n685), .Y(n687) );
  INVX2 U219 ( .A(n682), .Y(n684) );
  INVX2 U220 ( .A(n685), .Y(n686) );
  INVX2 U221 ( .A(n682), .Y(n683) );
  INVX2 U222 ( .A(n691), .Y(n693) );
  INVX2 U223 ( .A(n691), .Y(n692) );
  INVX2 U224 ( .A(n679), .Y(n681) );
  INVX2 U225 ( .A(n679), .Y(n680) );
  INVX2 U226 ( .A(n677), .Y(n678) );
  BUFX2 U227 ( .A(n_reset), .Y(n722) );
  BUFX2 U228 ( .A(n_reset), .Y(n723) );
  BUFX2 U229 ( .A(n_reset), .Y(n724) );
  BUFX2 U230 ( .A(n_reset), .Y(n725) );
  BUFX2 U231 ( .A(n_reset), .Y(n726) );
  BUFX2 U232 ( .A(n_reset), .Y(n727) );
  BUFX2 U233 ( .A(n_reset), .Y(n728) );
  BUFX2 U234 ( .A(n_reset), .Y(n729) );
  AOI22X1 U235 ( .A(n116), .B(n115), .C(n114), .D(n113), .Y(n117) );
  INVX2 U236 ( .A(n117), .Y(r1_data[16]) );
  NAND2X1 U237 ( .A(n121), .B(n120), .Y(n119) );
  NOR2X1 U238 ( .A(n123), .B(n122), .Y(n121) );
  OAI22X1 U239 ( .A(\regs_matrix[8][0] ), .B(n393), .C(\regs_matrix[10][0] ), 
        .D(n364), .Y(n123) );
  OAI22X1 U240 ( .A(\regs_matrix[12][0] ), .B(n367), .C(\regs_matrix[14][0] ), 
        .D(n371), .Y(n122) );
  NOR2X1 U241 ( .A(n128), .B(n129), .Y(n120) );
  OAI22X1 U242 ( .A(\regs_matrix[11][0] ), .B(n374), .C(\regs_matrix[9][0] ), 
        .D(n38), .Y(n129) );
  OAI22X1 U243 ( .A(\regs_matrix[13][0] ), .B(n381), .C(\regs_matrix[15][0] ), 
        .D(n14), .Y(n128) );
  NAND2X1 U244 ( .A(n135), .B(n134), .Y(n118) );
  NOR2X1 U245 ( .A(n136), .B(n137), .Y(n135) );
  OAI22X1 U246 ( .A(outreg_data[0]), .B(n360), .C(\regs_matrix[2][0] ), .D(
        n364), .Y(n137) );
  OAI22X1 U247 ( .A(\regs_matrix[4][0] ), .B(n368), .C(\regs_matrix[6][0] ), 
        .D(n371), .Y(n136) );
  NOR2X1 U248 ( .A(n139), .B(n138), .Y(n134) );
  OAI22X1 U249 ( .A(\regs_matrix[3][0] ), .B(n374), .C(\regs_matrix[1][0] ), 
        .D(n38), .Y(n139) );
  OAI22X1 U250 ( .A(\regs_matrix[5][0] ), .B(n381), .C(\regs_matrix[7][0] ), 
        .D(n14), .Y(n138) );
  NAND2X1 U251 ( .A(n143), .B(n142), .Y(n141) );
  NOR2X1 U252 ( .A(n145), .B(n144), .Y(n143) );
  OAI22X1 U253 ( .A(\regs_matrix[8][1] ), .B(n393), .C(\regs_matrix[10][1] ), 
        .D(n364), .Y(n145) );
  OAI22X1 U254 ( .A(\regs_matrix[12][1] ), .B(n367), .C(\regs_matrix[14][1] ), 
        .D(n371), .Y(n144) );
  NOR2X1 U255 ( .A(n147), .B(n146), .Y(n142) );
  OAI22X1 U256 ( .A(\regs_matrix[11][1] ), .B(n374), .C(\regs_matrix[9][1] ), 
        .D(n38), .Y(n147) );
  OAI22X1 U257 ( .A(\regs_matrix[13][1] ), .B(n381), .C(\regs_matrix[15][1] ), 
        .D(n385), .Y(n146) );
  NAND2X1 U258 ( .A(n148), .B(n149), .Y(n140) );
  NOR2X1 U259 ( .A(n151), .B(n150), .Y(n149) );
  OAI22X1 U260 ( .A(outreg_data[1]), .B(n393), .C(\regs_matrix[2][1] ), .D(
        n364), .Y(n151) );
  OAI22X1 U261 ( .A(\regs_matrix[4][1] ), .B(n368), .C(\regs_matrix[6][1] ), 
        .D(n109), .Y(n150) );
  NOR2X1 U262 ( .A(n152), .B(n153), .Y(n148) );
  OAI22X1 U263 ( .A(\regs_matrix[3][1] ), .B(n374), .C(\regs_matrix[1][1] ), 
        .D(n38), .Y(n153) );
  OAI22X1 U264 ( .A(n382), .B(\regs_matrix[5][1] ), .C(n4), .D(
        \regs_matrix[7][1] ), .Y(n152) );
  NOR2X1 U265 ( .A(n156), .B(n157), .Y(n155) );
  OAI22X1 U266 ( .A(\regs_matrix[8][2] ), .B(n359), .C(\regs_matrix[10][2] ), 
        .D(n364), .Y(n157) );
  OAI22X1 U267 ( .A(\regs_matrix[12][2] ), .B(n368), .C(\regs_matrix[14][2] ), 
        .D(n370), .Y(n156) );
  NOR2X1 U268 ( .A(n158), .B(n159), .Y(n154) );
  OAI22X1 U269 ( .A(\regs_matrix[11][2] ), .B(n374), .C(\regs_matrix[9][2] ), 
        .D(n378), .Y(n159) );
  OAI22X1 U270 ( .A(\regs_matrix[13][2] ), .B(n382), .C(\regs_matrix[15][2] ), 
        .D(n14), .Y(n158) );
  NOR2X1 U271 ( .A(n162), .B(n163), .Y(n161) );
  OAI22X1 U272 ( .A(outreg_data[2]), .B(n360), .C(\regs_matrix[2][2] ), .D(
        n364), .Y(n163) );
  OAI22X1 U273 ( .A(\regs_matrix[4][2] ), .B(n367), .C(\regs_matrix[6][2] ), 
        .D(n372), .Y(n162) );
  NOR2X1 U274 ( .A(n164), .B(n165), .Y(n160) );
  OAI22X1 U275 ( .A(\regs_matrix[3][2] ), .B(n374), .C(\regs_matrix[1][2] ), 
        .D(n378), .Y(n165) );
  OAI22X1 U276 ( .A(\regs_matrix[5][2] ), .B(n381), .C(\regs_matrix[7][2] ), 
        .D(n385), .Y(n164) );
  NAND2X1 U277 ( .A(n168), .B(n169), .Y(n167) );
  NOR2X1 U278 ( .A(n170), .B(n171), .Y(n169) );
  OAI22X1 U279 ( .A(\regs_matrix[8][3] ), .B(n360), .C(\regs_matrix[10][3] ), 
        .D(n364), .Y(n171) );
  OAI22X1 U280 ( .A(\regs_matrix[12][3] ), .B(n367), .C(\regs_matrix[14][3] ), 
        .D(n370), .Y(n170) );
  NOR2X1 U281 ( .A(n172), .B(n173), .Y(n168) );
  OAI22X1 U282 ( .A(\regs_matrix[11][3] ), .B(n374), .C(\regs_matrix[9][3] ), 
        .D(n379), .Y(n173) );
  OAI22X1 U283 ( .A(\regs_matrix[13][3] ), .B(n381), .C(\regs_matrix[15][3] ), 
        .D(n385), .Y(n172) );
  NAND2X1 U284 ( .A(n174), .B(n175), .Y(n166) );
  NOR2X1 U285 ( .A(n177), .B(n176), .Y(n175) );
  OAI22X1 U286 ( .A(outreg_data[3]), .B(n360), .C(\regs_matrix[2][3] ), .D(
        n364), .Y(n177) );
  OAI22X1 U287 ( .A(\regs_matrix[4][3] ), .B(n368), .C(\regs_matrix[6][3] ), 
        .D(n109), .Y(n176) );
  NOR2X1 U288 ( .A(n178), .B(n179), .Y(n174) );
  OAI22X1 U289 ( .A(\regs_matrix[3][3] ), .B(n374), .C(\regs_matrix[1][3] ), 
        .D(n377), .Y(n179) );
  OAI22X1 U290 ( .A(\regs_matrix[5][3] ), .B(n381), .C(\regs_matrix[7][3] ), 
        .D(n4), .Y(n178) );
  NOR2X1 U291 ( .A(n182), .B(n183), .Y(n181) );
  OAI22X1 U292 ( .A(\regs_matrix[8][4] ), .B(n358), .C(\regs_matrix[10][4] ), 
        .D(n365), .Y(n183) );
  OAI22X1 U293 ( .A(\regs_matrix[12][4] ), .B(n367), .C(\regs_matrix[14][4] ), 
        .D(n109), .Y(n182) );
  NOR2X1 U294 ( .A(n184), .B(n185), .Y(n180) );
  OAI22X1 U295 ( .A(\regs_matrix[11][4] ), .B(n374), .C(\regs_matrix[9][4] ), 
        .D(n377), .Y(n185) );
  OAI22X1 U296 ( .A(\regs_matrix[13][4] ), .B(n382), .C(\regs_matrix[15][4] ), 
        .D(n14), .Y(n184) );
  NOR2X1 U297 ( .A(n188), .B(n189), .Y(n187) );
  OAI22X1 U298 ( .A(outreg_data[4]), .B(n359), .C(\regs_matrix[2][4] ), .D(n68), .Y(n189) );
  OAI22X1 U299 ( .A(\regs_matrix[4][4] ), .B(n368), .C(\regs_matrix[6][4] ), 
        .D(n371), .Y(n188) );
  NOR2X1 U300 ( .A(n190), .B(n191), .Y(n186) );
  OAI22X1 U301 ( .A(\regs_matrix[3][4] ), .B(n375), .C(\regs_matrix[1][4] ), 
        .D(n379), .Y(n191) );
  OAI22X1 U302 ( .A(\regs_matrix[5][4] ), .B(n381), .C(\regs_matrix[7][4] ), 
        .D(n385), .Y(n190) );
  MUX2X1 U303 ( .B(n192), .A(n193), .S(n387), .Y(r1_data[5]) );
  NAND2X1 U304 ( .A(n195), .B(n194), .Y(n193) );
  NOR2X1 U305 ( .A(n196), .B(n197), .Y(n195) );
  OAI22X1 U306 ( .A(\regs_matrix[8][5] ), .B(n359), .C(\regs_matrix[10][5] ), 
        .D(n365), .Y(n197) );
  OAI22X1 U307 ( .A(\regs_matrix[12][5] ), .B(n368), .C(\regs_matrix[14][5] ), 
        .D(n371), .Y(n196) );
  NOR2X1 U308 ( .A(n198), .B(n199), .Y(n194) );
  OAI22X1 U309 ( .A(\regs_matrix[11][5] ), .B(n375), .C(\regs_matrix[9][5] ), 
        .D(n379), .Y(n199) );
  OAI22X1 U310 ( .A(\regs_matrix[13][5] ), .B(n381), .C(\regs_matrix[15][5] ), 
        .D(n385), .Y(n198) );
  NAND2X1 U311 ( .A(n200), .B(n201), .Y(n192) );
  NOR2X1 U312 ( .A(n202), .B(n203), .Y(n201) );
  OAI22X1 U313 ( .A(outreg_data[5]), .B(n359), .C(\regs_matrix[2][5] ), .D(n68), .Y(n203) );
  OAI22X1 U314 ( .A(\regs_matrix[4][5] ), .B(n368), .C(\regs_matrix[6][5] ), 
        .D(n109), .Y(n202) );
  NOR2X1 U315 ( .A(n204), .B(n205), .Y(n200) );
  OAI22X1 U316 ( .A(\regs_matrix[3][5] ), .B(n374), .C(\regs_matrix[1][5] ), 
        .D(n377), .Y(n205) );
  OAI22X1 U317 ( .A(\regs_matrix[5][5] ), .B(n382), .C(\regs_matrix[7][5] ), 
        .D(n385), .Y(n204) );
  NOR2X1 U318 ( .A(n208), .B(n209), .Y(n207) );
  OAI22X1 U319 ( .A(\regs_matrix[8][6] ), .B(n359), .C(\regs_matrix[10][6] ), 
        .D(n365), .Y(n209) );
  OAI22X1 U320 ( .A(\regs_matrix[12][6] ), .B(n368), .C(\regs_matrix[14][6] ), 
        .D(n109), .Y(n208) );
  NOR2X1 U321 ( .A(n210), .B(n211), .Y(n206) );
  OAI22X1 U322 ( .A(\regs_matrix[11][6] ), .B(n374), .C(\regs_matrix[9][6] ), 
        .D(n378), .Y(n211) );
  OAI22X1 U323 ( .A(\regs_matrix[13][6] ), .B(n381), .C(\regs_matrix[15][6] ), 
        .D(n385), .Y(n210) );
  NOR2X1 U324 ( .A(n214), .B(n215), .Y(n213) );
  OAI22X1 U325 ( .A(outreg_data[6]), .B(n359), .C(\regs_matrix[2][6] ), .D(n69), .Y(n215) );
  OAI22X1 U326 ( .A(\regs_matrix[4][6] ), .B(n367), .C(\regs_matrix[6][6] ), 
        .D(n108), .Y(n214) );
  NOR2X1 U327 ( .A(n216), .B(n217), .Y(n212) );
  OAI22X1 U328 ( .A(\regs_matrix[3][6] ), .B(n374), .C(\regs_matrix[1][6] ), 
        .D(n378), .Y(n217) );
  OAI22X1 U329 ( .A(\regs_matrix[5][6] ), .B(n382), .C(\regs_matrix[7][6] ), 
        .D(n385), .Y(n216) );
  NAND2X1 U330 ( .A(n221), .B(n220), .Y(n219) );
  NOR2X1 U331 ( .A(n223), .B(n222), .Y(n221) );
  OAI22X1 U332 ( .A(\regs_matrix[8][7] ), .B(n359), .C(\regs_matrix[10][7] ), 
        .D(n69), .Y(n223) );
  OAI22X1 U333 ( .A(\regs_matrix[12][7] ), .B(n368), .C(\regs_matrix[14][7] ), 
        .D(n109), .Y(n222) );
  NOR2X1 U334 ( .A(n224), .B(n225), .Y(n220) );
  OAI22X1 U335 ( .A(\regs_matrix[11][7] ), .B(n374), .C(\regs_matrix[9][7] ), 
        .D(n378), .Y(n225) );
  OAI22X1 U336 ( .A(\regs_matrix[13][7] ), .B(n382), .C(\regs_matrix[15][7] ), 
        .D(n385), .Y(n224) );
  NAND2X1 U337 ( .A(n227), .B(n226), .Y(n218) );
  NOR2X1 U338 ( .A(n229), .B(n228), .Y(n227) );
  OAI22X1 U339 ( .A(outreg_data[7]), .B(n359), .C(\regs_matrix[2][7] ), .D(n68), .Y(n229) );
  OAI22X1 U340 ( .A(\regs_matrix[4][7] ), .B(n367), .C(\regs_matrix[6][7] ), 
        .D(n108), .Y(n228) );
  NOR2X1 U341 ( .A(n230), .B(n231), .Y(n226) );
  OAI22X1 U342 ( .A(\regs_matrix[3][7] ), .B(n374), .C(\regs_matrix[1][7] ), 
        .D(n379), .Y(n231) );
  OAI22X1 U343 ( .A(\regs_matrix[5][7] ), .B(n381), .C(\regs_matrix[7][7] ), 
        .D(n14), .Y(n230) );
  MUX2X1 U344 ( .B(n232), .A(n233), .S(n386), .Y(r1_data[8]) );
  NAND2X1 U345 ( .A(n234), .B(n235), .Y(n233) );
  NOR2X1 U346 ( .A(n236), .B(n237), .Y(n235) );
  OAI22X1 U347 ( .A(\regs_matrix[8][8] ), .B(n359), .C(\regs_matrix[10][8] ), 
        .D(n69), .Y(n237) );
  OAI22X1 U348 ( .A(\regs_matrix[12][8] ), .B(n368), .C(\regs_matrix[14][8] ), 
        .D(n108), .Y(n236) );
  NOR2X1 U349 ( .A(n238), .B(n239), .Y(n234) );
  OAI22X1 U350 ( .A(\regs_matrix[11][8] ), .B(n375), .C(\regs_matrix[9][8] ), 
        .D(n379), .Y(n239) );
  OAI22X1 U351 ( .A(\regs_matrix[13][8] ), .B(n381), .C(\regs_matrix[15][8] ), 
        .D(n14), .Y(n238) );
  NAND2X1 U352 ( .A(n240), .B(n241), .Y(n232) );
  NOR2X1 U353 ( .A(n242), .B(n243), .Y(n241) );
  OAI22X1 U354 ( .A(outreg_data[8]), .B(n359), .C(\regs_matrix[2][8] ), .D(n69), .Y(n243) );
  OAI22X1 U355 ( .A(\regs_matrix[4][8] ), .B(n367), .C(\regs_matrix[6][8] ), 
        .D(n370), .Y(n242) );
  NOR2X1 U356 ( .A(n244), .B(n245), .Y(n240) );
  OAI22X1 U357 ( .A(\regs_matrix[3][8] ), .B(n375), .C(\regs_matrix[1][8] ), 
        .D(n377), .Y(n245) );
  OAI22X1 U358 ( .A(\regs_matrix[5][8] ), .B(n382), .C(\regs_matrix[7][8] ), 
        .D(n14), .Y(n244) );
  MUX2X1 U359 ( .B(n246), .A(n247), .S(n387), .Y(r1_data[9]) );
  NAND2X1 U360 ( .A(n249), .B(n248), .Y(n247) );
  NOR2X1 U361 ( .A(n251), .B(n250), .Y(n249) );
  OAI22X1 U362 ( .A(\regs_matrix[8][9] ), .B(n359), .C(\regs_matrix[10][9] ), 
        .D(n68), .Y(n251) );
  OAI22X1 U363 ( .A(\regs_matrix[12][9] ), .B(n367), .C(\regs_matrix[14][9] ), 
        .D(n108), .Y(n250) );
  NOR2X1 U364 ( .A(n253), .B(n252), .Y(n248) );
  OAI22X1 U365 ( .A(\regs_matrix[11][9] ), .B(n374), .C(\regs_matrix[9][9] ), 
        .D(n378), .Y(n253) );
  OAI22X1 U366 ( .A(\regs_matrix[13][9] ), .B(n382), .C(\regs_matrix[15][9] ), 
        .D(n385), .Y(n252) );
  NAND2X1 U367 ( .A(n254), .B(n255), .Y(n246) );
  NOR2X1 U368 ( .A(n256), .B(n257), .Y(n255) );
  OAI22X1 U369 ( .A(outreg_data[9]), .B(n359), .C(n68), .D(\regs_matrix[2][9] ), .Y(n257) );
  OAI22X1 U370 ( .A(\regs_matrix[4][9] ), .B(n368), .C(\regs_matrix[6][9] ), 
        .D(n109), .Y(n256) );
  NOR2X1 U371 ( .A(n258), .B(n259), .Y(n254) );
  OAI22X1 U372 ( .A(\regs_matrix[3][9] ), .B(n374), .C(\regs_matrix[1][9] ), 
        .D(n378), .Y(n259) );
  OAI22X1 U373 ( .A(\regs_matrix[5][9] ), .B(n381), .C(\regs_matrix[7][9] ), 
        .D(n4), .Y(n258) );
  NOR2X1 U374 ( .A(n263), .B(n262), .Y(n261) );
  OAI22X1 U375 ( .A(\regs_matrix[8][10] ), .B(n392), .C(\regs_matrix[10][10] ), 
        .D(n364), .Y(n263) );
  OAI22X1 U376 ( .A(\regs_matrix[12][10] ), .B(n368), .C(\regs_matrix[14][10] ), .D(n371), .Y(n262) );
  NOR2X1 U377 ( .A(n264), .B(n265), .Y(n260) );
  OAI22X1 U378 ( .A(\regs_matrix[11][10] ), .B(n374), .C(\regs_matrix[9][10] ), 
        .D(n377), .Y(n265) );
  OAI22X1 U379 ( .A(\regs_matrix[13][10] ), .B(n382), .C(\regs_matrix[15][10] ), .D(n385), .Y(n264) );
  NOR2X1 U380 ( .A(n268), .B(n269), .Y(n267) );
  OAI22X1 U381 ( .A(outreg_data[10]), .B(n392), .C(\regs_matrix[2][10] ), .D(
        n70), .Y(n269) );
  OAI22X1 U382 ( .A(\regs_matrix[4][10] ), .B(n368), .C(\regs_matrix[6][10] ), 
        .D(n109), .Y(n268) );
  NOR2X1 U383 ( .A(n270), .B(n271), .Y(n266) );
  OAI22X1 U384 ( .A(\regs_matrix[3][10] ), .B(n375), .C(\regs_matrix[1][10] ), 
        .D(n379), .Y(n271) );
  OAI22X1 U385 ( .A(\regs_matrix[5][10] ), .B(n382), .C(\regs_matrix[7][10] ), 
        .D(n14), .Y(n270) );
  MUX2X1 U386 ( .B(n272), .A(n273), .S(n387), .Y(r1_data[11]) );
  NAND2X1 U387 ( .A(n274), .B(n275), .Y(n273) );
  NOR2X1 U388 ( .A(n277), .B(n276), .Y(n275) );
  OAI22X1 U389 ( .A(\regs_matrix[8][11] ), .B(n360), .C(\regs_matrix[10][11] ), 
        .D(n364), .Y(n277) );
  OAI22X1 U390 ( .A(\regs_matrix[12][11] ), .B(n367), .C(\regs_matrix[14][11] ), .D(n370), .Y(n276) );
  NOR2X1 U391 ( .A(n278), .B(n279), .Y(n274) );
  OAI22X1 U392 ( .A(\regs_matrix[11][11] ), .B(n375), .C(\regs_matrix[9][11] ), 
        .D(n379), .Y(n279) );
  OAI22X1 U393 ( .A(\regs_matrix[13][11] ), .B(n382), .C(\regs_matrix[15][11] ), .D(n385), .Y(n278) );
  NAND2X1 U394 ( .A(n280), .B(n281), .Y(n272) );
  NOR2X1 U395 ( .A(n282), .B(n283), .Y(n281) );
  OAI22X1 U396 ( .A(outreg_data[11]), .B(n360), .C(\regs_matrix[2][11] ), .D(
        n364), .Y(n283) );
  OAI22X1 U397 ( .A(\regs_matrix[4][11] ), .B(n368), .C(\regs_matrix[6][11] ), 
        .D(n108), .Y(n282) );
  NOR2X1 U398 ( .A(n284), .B(n285), .Y(n280) );
  OAI22X1 U399 ( .A(\regs_matrix[3][11] ), .B(n375), .C(\regs_matrix[1][11] ), 
        .D(n377), .Y(n285) );
  OAI22X1 U400 ( .A(\regs_matrix[5][11] ), .B(n381), .C(\regs_matrix[7][11] ), 
        .D(n14), .Y(n284) );
  NOR2X1 U401 ( .A(n288), .B(n289), .Y(n287) );
  OAI22X1 U402 ( .A(\regs_matrix[8][12] ), .B(n360), .C(\regs_matrix[10][12] ), 
        .D(n69), .Y(n289) );
  OAI22X1 U403 ( .A(\regs_matrix[12][12] ), .B(n368), .C(\regs_matrix[14][12] ), .D(n372), .Y(n288) );
  NOR2X1 U404 ( .A(n290), .B(n291), .Y(n286) );
  OAI22X1 U405 ( .A(\regs_matrix[11][12] ), .B(n375), .C(\regs_matrix[9][12] ), 
        .D(n379), .Y(n291) );
  OAI22X1 U406 ( .A(\regs_matrix[13][12] ), .B(n382), .C(\regs_matrix[15][12] ), .D(n14), .Y(n290) );
  NOR2X1 U407 ( .A(n294), .B(n295), .Y(n293) );
  OAI22X1 U408 ( .A(n360), .B(outreg_data[12]), .C(\regs_matrix[2][12] ), .D(
        n69), .Y(n295) );
  OAI22X1 U409 ( .A(\regs_matrix[4][12] ), .B(n367), .C(\regs_matrix[6][12] ), 
        .D(n372), .Y(n294) );
  NOR2X1 U410 ( .A(n296), .B(n297), .Y(n292) );
  OAI22X1 U411 ( .A(\regs_matrix[3][12] ), .B(n375), .C(\regs_matrix[1][12] ), 
        .D(n377), .Y(n297) );
  OAI22X1 U412 ( .A(\regs_matrix[5][12] ), .B(n381), .C(\regs_matrix[7][12] ), 
        .D(n14), .Y(n296) );
  MUX2X1 U413 ( .B(n298), .A(n299), .S(n387), .Y(r1_data[13]) );
  NAND2X1 U414 ( .A(n301), .B(n300), .Y(n299) );
  NOR2X1 U415 ( .A(n303), .B(n302), .Y(n301) );
  OAI22X1 U416 ( .A(\regs_matrix[8][13] ), .B(n360), .C(\regs_matrix[10][13] ), 
        .D(n69), .Y(n303) );
  OAI22X1 U417 ( .A(\regs_matrix[12][13] ), .B(n367), .C(\regs_matrix[14][13] ), .D(n109), .Y(n302) );
  NOR2X1 U418 ( .A(n304), .B(n305), .Y(n300) );
  OAI22X1 U419 ( .A(\regs_matrix[11][13] ), .B(n375), .C(\regs_matrix[9][13] ), 
        .D(n378), .Y(n305) );
  OAI22X1 U420 ( .A(\regs_matrix[13][13] ), .B(n382), .C(\regs_matrix[15][13] ), .D(n385), .Y(n304) );
  NAND2X1 U421 ( .A(n307), .B(n306), .Y(n298) );
  NOR2X1 U422 ( .A(n308), .B(n309), .Y(n307) );
  OAI22X1 U423 ( .A(outreg_data[13]), .B(n360), .C(\regs_matrix[2][13] ), .D(
        n69), .Y(n309) );
  OAI22X1 U424 ( .A(\regs_matrix[4][13] ), .B(n367), .C(\regs_matrix[6][13] ), 
        .D(n109), .Y(n308) );
  NOR2X1 U425 ( .A(n310), .B(n311), .Y(n306) );
  OAI22X1 U426 ( .A(\regs_matrix[3][13] ), .B(n375), .C(\regs_matrix[1][13] ), 
        .D(n377), .Y(n311) );
  OAI22X1 U427 ( .A(\regs_matrix[5][13] ), .B(n382), .C(\regs_matrix[7][13] ), 
        .D(n385), .Y(n310) );
  NOR2X1 U428 ( .A(n315), .B(n314), .Y(n313) );
  OAI22X1 U429 ( .A(\regs_matrix[8][14] ), .B(n392), .C(\regs_matrix[10][14] ), 
        .D(n70), .Y(n315) );
  OAI22X1 U430 ( .A(\regs_matrix[12][14] ), .B(n367), .C(\regs_matrix[14][14] ), .D(n108), .Y(n314) );
  NOR2X1 U431 ( .A(n316), .B(n317), .Y(n312) );
  OAI22X1 U432 ( .A(\regs_matrix[11][14] ), .B(n375), .C(\regs_matrix[9][14] ), 
        .D(n38), .Y(n317) );
  OAI22X1 U433 ( .A(\regs_matrix[13][14] ), .B(n382), .C(\regs_matrix[15][14] ), .D(n385), .Y(n316) );
  NOR2X1 U434 ( .A(n320), .B(n321), .Y(n319) );
  OAI22X1 U435 ( .A(outreg_data[14]), .B(n392), .C(\regs_matrix[2][14] ), .D(
        n365), .Y(n321) );
  OAI22X1 U436 ( .A(\regs_matrix[4][14] ), .B(n367), .C(\regs_matrix[6][14] ), 
        .D(n370), .Y(n320) );
  NOR2X1 U437 ( .A(n322), .B(n323), .Y(n318) );
  OAI22X1 U438 ( .A(\regs_matrix[3][14] ), .B(n375), .C(\regs_matrix[1][14] ), 
        .D(n378), .Y(n323) );
  OAI22X1 U439 ( .A(\regs_matrix[5][14] ), .B(n381), .C(\regs_matrix[7][14] ), 
        .D(n385), .Y(n322) );
  MUX2X1 U440 ( .B(n324), .A(n325), .S(n387), .Y(r1_data[15]) );
  NAND2X1 U441 ( .A(n327), .B(n326), .Y(n325) );
  NOR2X1 U442 ( .A(n329), .B(n328), .Y(n327) );
  OAI22X1 U443 ( .A(n358), .B(\regs_matrix[8][15] ), .C(\regs_matrix[10][15] ), 
        .D(n364), .Y(n329) );
  OAI22X1 U444 ( .A(\regs_matrix[12][15] ), .B(n368), .C(\regs_matrix[14][15] ), .D(n370), .Y(n328) );
  NOR2X1 U445 ( .A(n330), .B(n331), .Y(n326) );
  OAI22X1 U446 ( .A(\regs_matrix[11][15] ), .B(n375), .C(\regs_matrix[9][15] ), 
        .D(n377), .Y(n331) );
  OAI22X1 U447 ( .A(\regs_matrix[13][15] ), .B(n381), .C(\regs_matrix[15][15] ), .D(n4), .Y(n330) );
  NAND2X1 U448 ( .A(n333), .B(n332), .Y(n324) );
  NOR2X1 U449 ( .A(n334), .B(n335), .Y(n333) );
  OAI22X1 U450 ( .A(outreg_data[15]), .B(n359), .C(\regs_matrix[2][15] ), .D(
        n364), .Y(n335) );
  OAI22X1 U451 ( .A(\regs_matrix[4][15] ), .B(n367), .C(\regs_matrix[6][15] ), 
        .D(n372), .Y(n334) );
  NOR2X1 U452 ( .A(n336), .B(n337), .Y(n332) );
  OAI22X1 U453 ( .A(\regs_matrix[3][15] ), .B(n375), .C(\regs_matrix[1][15] ), 
        .D(n378), .Y(n337) );
  OAI22X1 U454 ( .A(\regs_matrix[5][15] ), .B(n382), .C(\regs_matrix[7][15] ), 
        .D(n4), .Y(n336) );
  NOR2X1 U455 ( .A(n338), .B(n339), .Y(n113) );
  OAI21X1 U456 ( .A(\regs_matrix[6][16] ), .B(n109), .C(n340), .Y(n339) );
  AOI22X1 U457 ( .A(n71), .B(n341), .C(n74), .D(n342), .Y(n340) );
  INVX2 U458 ( .A(outreg_data[16]), .Y(n342) );
  INVX2 U459 ( .A(\regs_matrix[2][16] ), .Y(n341) );
  OAI21X1 U460 ( .A(\regs_matrix[4][16] ), .B(n367), .C(n388), .Y(n338) );
  NOR2X1 U461 ( .A(n343), .B(n344), .Y(n114) );
  OAI22X1 U462 ( .A(\regs_matrix[3][16] ), .B(n375), .C(\regs_matrix[1][16] ), 
        .D(n377), .Y(n344) );
  OAI22X1 U463 ( .A(\regs_matrix[5][16] ), .B(n381), .C(\regs_matrix[7][16] ), 
        .D(n14), .Y(n343) );
  NOR2X1 U464 ( .A(n345), .B(n346), .Y(n115) );
  OAI21X1 U465 ( .A(\regs_matrix[12][16] ), .B(n368), .C(n347), .Y(n346) );
  AOI22X1 U466 ( .A(n71), .B(n348), .C(n74), .D(n644), .Y(n347) );
  NAND3X1 U467 ( .A(n351), .B(n350), .C(n349), .Y(n124) );
  INVX2 U468 ( .A(\regs_matrix[10][16] ), .Y(n348) );
  NAND3X1 U469 ( .A(n350), .B(n351), .C(n67), .Y(n125) );
  NAND3X1 U470 ( .A(N12), .B(n349), .C(n351), .Y(n126) );
  OAI22X1 U471 ( .A(\regs_matrix[9][16] ), .B(n379), .C(\regs_matrix[14][16] ), 
        .D(n109), .Y(n345) );
  NAND3X1 U472 ( .A(n351), .B(n67), .C(N12), .Y(n127) );
  NAND3X1 U473 ( .A(n73), .B(n350), .C(n349), .Y(n131) );
  NOR2X1 U474 ( .A(n352), .B(n353), .Y(n116) );
  OAI21X1 U475 ( .A(\regs_matrix[11][16] ), .B(n375), .C(n386), .Y(n353) );
  NAND2X1 U476 ( .A(n76), .B(n350), .Y(n130) );
  OAI22X1 U477 ( .A(\regs_matrix[15][16] ), .B(n385), .C(\regs_matrix[13][16] ), .D(n382), .Y(n352) );
  NAND3X1 U478 ( .A(N12), .B(n73), .C(n349), .Y(n132) );
  NAND2X1 U479 ( .A(N12), .B(n76), .Y(n133) );
  BUFX4 U480 ( .A(n354), .Y(n355) );
  BUFX4 U481 ( .A(n354), .Y(n356) );
  INVX8 U482 ( .A(n356), .Y(n359) );
  INVX8 U483 ( .A(n355), .Y(n360) );
  BUFX4 U484 ( .A(n361), .Y(n363) );
  INVX8 U485 ( .A(n363), .Y(n364) );
  INVX8 U486 ( .A(n366), .Y(n367) );
  INVX8 U487 ( .A(n366), .Y(n368) );
  INVX8 U488 ( .A(n373), .Y(n375) );
  INVX8 U489 ( .A(n380), .Y(n381) );
  INVX8 U490 ( .A(n380), .Y(n382) );
  INVX2 U491 ( .A(n124), .Y(n354) );
  INVX2 U492 ( .A(N11), .Y(n349) );
  INVX2 U493 ( .A(n125), .Y(n361) );
  INVX4 U494 ( .A(n132), .Y(n380) );
  INVX4 U495 ( .A(n126), .Y(n366) );
  AND2X2 U496 ( .A(n292), .B(n293), .Y(n389) );
  AND2X1 U497 ( .A(n286), .B(n287), .Y(n390) );
  MUX2X1 U498 ( .B(n390), .A(n389), .S(n388), .Y(n391) );
  INVX4 U499 ( .A(n376), .Y(n379) );
  INVX4 U500 ( .A(n376), .Y(n378) );
  INVX4 U501 ( .A(n376), .Y(n377) );
  AND2X2 U502 ( .A(n160), .B(n161), .Y(n394) );
  MUX2X1 U503 ( .B(n395), .A(n394), .S(n388), .Y(n396) );
  INVX2 U504 ( .A(n357), .Y(n393) );
  MUX2X1 U505 ( .B(n398), .A(n397), .S(n388), .Y(n399) );
  INVX4 U506 ( .A(n391), .Y(r1_data[12]) );
  INVX4 U507 ( .A(n399), .Y(r1_data[6]) );
  AOI22X1 U508 ( .A(n403), .B(n402), .C(n401), .D(n400), .Y(n404) );
  INVX2 U509 ( .A(n404), .Y(r2_data[16]) );
  MUX2X1 U510 ( .B(n405), .A(n406), .S(n674), .Y(r2_data[0]) );
  NAND2X1 U511 ( .A(n407), .B(n408), .Y(n406) );
  NOR2X1 U512 ( .A(n409), .B(n410), .Y(n408) );
  OAI22X1 U513 ( .A(\regs_matrix[8][0] ), .B(n1), .C(\regs_matrix[10][0] ), 
        .D(n20), .Y(n410) );
  OAI22X1 U514 ( .A(\regs_matrix[12][0] ), .B(n660), .C(\regs_matrix[14][0] ), 
        .D(n36), .Y(n409) );
  NOR2X1 U515 ( .A(n415), .B(n416), .Y(n407) );
  OAI22X1 U516 ( .A(\regs_matrix[11][0] ), .B(n35), .C(\regs_matrix[9][0] ), 
        .D(n670), .Y(n416) );
  OAI22X1 U517 ( .A(\regs_matrix[13][0] ), .B(n66), .C(\regs_matrix[15][0] ), 
        .D(n45), .Y(n415) );
  NAND2X1 U518 ( .A(n421), .B(n420), .Y(n405) );
  NOR2X1 U519 ( .A(n422), .B(n423), .Y(n421) );
  OAI22X1 U520 ( .A(outreg_data[0]), .B(n1), .C(\regs_matrix[2][0] ), .D(n16), 
        .Y(n423) );
  OAI22X1 U521 ( .A(\regs_matrix[4][0] ), .B(n660), .C(\regs_matrix[6][0] ), 
        .D(n40), .Y(n422) );
  NOR2X1 U522 ( .A(n424), .B(n425), .Y(n420) );
  OAI22X1 U523 ( .A(\regs_matrix[3][0] ), .B(n35), .C(\regs_matrix[1][0] ), 
        .D(n670), .Y(n425) );
  OAI22X1 U524 ( .A(\regs_matrix[5][0] ), .B(n66), .C(\regs_matrix[7][0] ), 
        .D(n46), .Y(n424) );
  MUX2X1 U525 ( .B(n426), .A(n427), .S(n675), .Y(r2_data[1]) );
  NAND2X1 U526 ( .A(n428), .B(n429), .Y(n427) );
  NOR2X1 U527 ( .A(n430), .B(n431), .Y(n429) );
  OAI22X1 U528 ( .A(\regs_matrix[8][1] ), .B(n2), .C(\regs_matrix[10][1] ), 
        .D(n21), .Y(n431) );
  OAI22X1 U529 ( .A(\regs_matrix[12][1] ), .B(n660), .C(\regs_matrix[14][1] ), 
        .D(n40), .Y(n430) );
  NOR2X1 U530 ( .A(n432), .B(n433), .Y(n428) );
  OAI22X1 U531 ( .A(\regs_matrix[11][1] ), .B(n35), .C(\regs_matrix[9][1] ), 
        .D(n670), .Y(n433) );
  OAI22X1 U532 ( .A(\regs_matrix[13][1] ), .B(n66), .C(\regs_matrix[15][1] ), 
        .D(n48), .Y(n432) );
  NAND2X1 U533 ( .A(n434), .B(n435), .Y(n426) );
  NOR2X1 U534 ( .A(n436), .B(n437), .Y(n435) );
  OAI22X1 U535 ( .A(outreg_data[1]), .B(n1), .C(\regs_matrix[2][1] ), .D(n19), 
        .Y(n437) );
  OAI22X1 U536 ( .A(\regs_matrix[4][1] ), .B(n660), .C(\regs_matrix[6][1] ), 
        .D(n36), .Y(n436) );
  NOR2X1 U537 ( .A(n438), .B(n439), .Y(n434) );
  OAI22X1 U538 ( .A(\regs_matrix[3][1] ), .B(n35), .C(\regs_matrix[1][1] ), 
        .D(n670), .Y(n439) );
  OAI22X1 U539 ( .A(\regs_matrix[5][1] ), .B(n66), .C(\regs_matrix[7][1] ), 
        .D(n47), .Y(n438) );
  MUX2X1 U540 ( .B(n440), .A(n441), .S(n674), .Y(r2_data[2]) );
  NAND2X1 U541 ( .A(n442), .B(n443), .Y(n441) );
  NOR2X1 U542 ( .A(n444), .B(n445), .Y(n443) );
  OAI22X1 U543 ( .A(\regs_matrix[8][2] ), .B(n2), .C(\regs_matrix[10][2] ), 
        .D(n17), .Y(n445) );
  OAI22X1 U544 ( .A(\regs_matrix[12][2] ), .B(n660), .C(\regs_matrix[14][2] ), 
        .D(n101), .Y(n444) );
  NOR2X1 U545 ( .A(n446), .B(n447), .Y(n442) );
  OAI22X1 U546 ( .A(\regs_matrix[11][2] ), .B(n667), .C(\regs_matrix[9][2] ), 
        .D(n670), .Y(n447) );
  OAI22X1 U547 ( .A(\regs_matrix[13][2] ), .B(n673), .C(\regs_matrix[15][2] ), 
        .D(n45), .Y(n446) );
  NAND2X1 U548 ( .A(n448), .B(n449), .Y(n440) );
  NOR2X1 U549 ( .A(n450), .B(n451), .Y(n449) );
  OAI22X1 U550 ( .A(outreg_data[2]), .B(n2), .C(\regs_matrix[2][2] ), .D(n15), 
        .Y(n451) );
  OAI22X1 U551 ( .A(\regs_matrix[4][2] ), .B(n660), .C(\regs_matrix[6][2] ), 
        .D(n100), .Y(n450) );
  NOR2X1 U552 ( .A(n452), .B(n453), .Y(n448) );
  OAI22X1 U553 ( .A(\regs_matrix[3][2] ), .B(n666), .C(\regs_matrix[1][2] ), 
        .D(n670), .Y(n453) );
  OAI22X1 U554 ( .A(\regs_matrix[5][2] ), .B(n672), .C(\regs_matrix[7][2] ), 
        .D(n64), .Y(n452) );
  MUX2X1 U555 ( .B(n454), .A(n455), .S(n675), .Y(r2_data[3]) );
  NAND2X1 U556 ( .A(n456), .B(n457), .Y(n455) );
  NOR2X1 U557 ( .A(n458), .B(n459), .Y(n457) );
  OAI22X1 U558 ( .A(\regs_matrix[8][3] ), .B(n2), .C(\regs_matrix[10][3] ), 
        .D(n16), .Y(n459) );
  OAI22X1 U559 ( .A(\regs_matrix[12][3] ), .B(n660), .C(\regs_matrix[14][3] ), 
        .D(n40), .Y(n458) );
  NOR2X1 U560 ( .A(n460), .B(n461), .Y(n456) );
  OAI22X1 U561 ( .A(\regs_matrix[11][3] ), .B(n667), .C(\regs_matrix[9][3] ), 
        .D(n670), .Y(n461) );
  OAI22X1 U562 ( .A(\regs_matrix[13][3] ), .B(n673), .C(\regs_matrix[15][3] ), 
        .D(n47), .Y(n460) );
  NAND2X1 U563 ( .A(n462), .B(n463), .Y(n454) );
  NOR2X1 U564 ( .A(n464), .B(n465), .Y(n463) );
  OAI22X1 U565 ( .A(outreg_data[3]), .B(n2), .C(\regs_matrix[2][3] ), .D(n15), 
        .Y(n465) );
  OAI22X1 U566 ( .A(\regs_matrix[4][3] ), .B(n660), .C(\regs_matrix[6][3] ), 
        .D(n37), .Y(n464) );
  NOR2X1 U567 ( .A(n466), .B(n467), .Y(n462) );
  OAI22X1 U568 ( .A(\regs_matrix[3][3] ), .B(n666), .C(\regs_matrix[1][3] ), 
        .D(n670), .Y(n467) );
  OAI22X1 U569 ( .A(\regs_matrix[5][3] ), .B(n672), .C(\regs_matrix[7][3] ), 
        .D(n48), .Y(n466) );
  MUX2X1 U570 ( .B(n468), .A(n469), .S(n674), .Y(r2_data[4]) );
  NAND2X1 U571 ( .A(n470), .B(n471), .Y(n469) );
  NOR2X1 U572 ( .A(n472), .B(n473), .Y(n471) );
  OAI22X1 U573 ( .A(\regs_matrix[8][4] ), .B(n654), .C(\regs_matrix[10][4] ), 
        .D(n31), .Y(n473) );
  OAI22X1 U574 ( .A(\regs_matrix[12][4] ), .B(n661), .C(\regs_matrix[14][4] ), 
        .D(n101), .Y(n472) );
  NOR2X1 U575 ( .A(n474), .B(n475), .Y(n470) );
  OAI22X1 U576 ( .A(\regs_matrix[11][4] ), .B(n666), .C(\regs_matrix[9][4] ), 
        .D(n670), .Y(n475) );
  OAI22X1 U577 ( .A(\regs_matrix[13][4] ), .B(n673), .C(\regs_matrix[15][4] ), 
        .D(n52), .Y(n474) );
  NAND2X1 U578 ( .A(n476), .B(n477), .Y(n468) );
  NOR2X1 U579 ( .A(n478), .B(n479), .Y(n477) );
  OAI22X1 U580 ( .A(outreg_data[4]), .B(n654), .C(\regs_matrix[2][4] ), .D(n26), .Y(n479) );
  OAI22X1 U581 ( .A(\regs_matrix[4][4] ), .B(n661), .C(\regs_matrix[6][4] ), 
        .D(n100), .Y(n478) );
  NOR2X1 U582 ( .A(n480), .B(n481), .Y(n476) );
  OAI22X1 U583 ( .A(\regs_matrix[3][4] ), .B(n667), .C(\regs_matrix[1][4] ), 
        .D(n670), .Y(n481) );
  OAI22X1 U584 ( .A(\regs_matrix[5][4] ), .B(n672), .C(\regs_matrix[7][4] ), 
        .D(n60), .Y(n480) );
  MUX2X1 U585 ( .B(n482), .A(n483), .S(n675), .Y(r2_data[5]) );
  NAND2X1 U586 ( .A(n485), .B(n484), .Y(n483) );
  NOR2X1 U587 ( .A(n486), .B(n487), .Y(n485) );
  OAI22X1 U588 ( .A(\regs_matrix[8][5] ), .B(n654), .C(\regs_matrix[10][5] ), 
        .D(n25), .Y(n487) );
  OAI22X1 U589 ( .A(\regs_matrix[12][5] ), .B(n661), .C(\regs_matrix[14][5] ), 
        .D(n101), .Y(n486) );
  NOR2X1 U590 ( .A(n488), .B(n489), .Y(n484) );
  OAI22X1 U591 ( .A(\regs_matrix[11][5] ), .B(n666), .C(\regs_matrix[9][5] ), 
        .D(n670), .Y(n489) );
  OAI22X1 U592 ( .A(\regs_matrix[13][5] ), .B(n672), .C(\regs_matrix[15][5] ), 
        .D(n49), .Y(n488) );
  NAND2X1 U593 ( .A(n490), .B(n491), .Y(n482) );
  NOR2X1 U594 ( .A(n492), .B(n493), .Y(n491) );
  OAI22X1 U595 ( .A(outreg_data[5]), .B(n654), .C(\regs_matrix[2][5] ), .D(n24), .Y(n493) );
  OAI22X1 U596 ( .A(\regs_matrix[4][5] ), .B(n661), .C(\regs_matrix[6][5] ), 
        .D(n100), .Y(n492) );
  NOR2X1 U597 ( .A(n494), .B(n495), .Y(n490) );
  OAI22X1 U598 ( .A(\regs_matrix[3][5] ), .B(n666), .C(\regs_matrix[1][5] ), 
        .D(n670), .Y(n495) );
  OAI22X1 U599 ( .A(\regs_matrix[5][5] ), .B(n672), .C(\regs_matrix[7][5] ), 
        .D(n49), .Y(n494) );
  MUX2X1 U600 ( .B(n496), .A(n497), .S(n674), .Y(r2_data[6]) );
  NAND2X1 U601 ( .A(n498), .B(n499), .Y(n497) );
  NOR2X1 U602 ( .A(n500), .B(n501), .Y(n499) );
  OAI22X1 U603 ( .A(\regs_matrix[8][6] ), .B(n654), .C(\regs_matrix[10][6] ), 
        .D(n25), .Y(n501) );
  OAI22X1 U604 ( .A(\regs_matrix[12][6] ), .B(n661), .C(\regs_matrix[14][6] ), 
        .D(n100), .Y(n500) );
  NOR2X1 U605 ( .A(n502), .B(n503), .Y(n498) );
  OAI22X1 U606 ( .A(\regs_matrix[11][6] ), .B(n667), .C(\regs_matrix[9][6] ), 
        .D(n669), .Y(n503) );
  OAI22X1 U607 ( .A(\regs_matrix[13][6] ), .B(n673), .C(\regs_matrix[15][6] ), 
        .D(n52), .Y(n502) );
  NAND2X1 U608 ( .A(n504), .B(n505), .Y(n496) );
  NOR2X1 U609 ( .A(n506), .B(n507), .Y(n505) );
  OAI22X1 U610 ( .A(outreg_data[6]), .B(n654), .C(\regs_matrix[2][6] ), .D(n23), .Y(n507) );
  OAI22X1 U611 ( .A(\regs_matrix[4][6] ), .B(n661), .C(\regs_matrix[6][6] ), 
        .D(n37), .Y(n506) );
  NOR2X1 U612 ( .A(n508), .B(n509), .Y(n504) );
  OAI22X1 U613 ( .A(\regs_matrix[3][6] ), .B(n666), .C(\regs_matrix[1][6] ), 
        .D(n669), .Y(n509) );
  OAI22X1 U614 ( .A(\regs_matrix[5][6] ), .B(n672), .C(\regs_matrix[7][6] ), 
        .D(n51), .Y(n508) );
  MUX2X1 U615 ( .B(n510), .A(n511), .S(n675), .Y(r2_data[7]) );
  NAND2X1 U616 ( .A(n513), .B(n512), .Y(n511) );
  NOR2X1 U617 ( .A(n515), .B(n514), .Y(n513) );
  OAI22X1 U618 ( .A(\regs_matrix[8][7] ), .B(n654), .C(\regs_matrix[10][7] ), 
        .D(n23), .Y(n515) );
  OAI22X1 U619 ( .A(\regs_matrix[12][7] ), .B(n661), .C(\regs_matrix[14][7] ), 
        .D(n101), .Y(n514) );
  NOR2X1 U620 ( .A(n516), .B(n517), .Y(n512) );
  OAI22X1 U621 ( .A(\regs_matrix[11][7] ), .B(n667), .C(\regs_matrix[9][7] ), 
        .D(n669), .Y(n517) );
  OAI22X1 U622 ( .A(\regs_matrix[13][7] ), .B(n672), .C(\regs_matrix[15][7] ), 
        .D(n57), .Y(n516) );
  NAND2X1 U623 ( .A(n519), .B(n518), .Y(n510) );
  NOR2X1 U624 ( .A(n520), .B(n521), .Y(n519) );
  OAI22X1 U625 ( .A(outreg_data[7]), .B(n654), .C(\regs_matrix[2][7] ), .D(n24), .Y(n521) );
  OAI22X1 U626 ( .A(\regs_matrix[4][7] ), .B(n661), .C(\regs_matrix[6][7] ), 
        .D(n40), .Y(n520) );
  NOR2X1 U627 ( .A(n522), .B(n523), .Y(n518) );
  OAI22X1 U628 ( .A(\regs_matrix[3][7] ), .B(n667), .C(\regs_matrix[1][7] ), 
        .D(n669), .Y(n523) );
  OAI22X1 U629 ( .A(\regs_matrix[5][7] ), .B(n672), .C(\regs_matrix[7][7] ), 
        .D(n65), .Y(n522) );
  MUX2X1 U630 ( .B(n524), .A(n525), .S(n674), .Y(r2_data[8]) );
  NAND2X1 U631 ( .A(n526), .B(n527), .Y(n525) );
  NOR2X1 U632 ( .A(n528), .B(n529), .Y(n527) );
  OAI22X1 U633 ( .A(\regs_matrix[8][8] ), .B(n654), .C(\regs_matrix[10][8] ), 
        .D(n27), .Y(n529) );
  OAI22X1 U634 ( .A(\regs_matrix[12][8] ), .B(n661), .C(\regs_matrix[14][8] ), 
        .D(n40), .Y(n528) );
  NOR2X1 U635 ( .A(n530), .B(n531), .Y(n526) );
  OAI22X1 U636 ( .A(\regs_matrix[11][8] ), .B(n667), .C(\regs_matrix[9][8] ), 
        .D(n669), .Y(n531) );
  OAI22X1 U637 ( .A(\regs_matrix[13][8] ), .B(n673), .C(\regs_matrix[15][8] ), 
        .D(n50), .Y(n530) );
  NAND2X1 U638 ( .A(n532), .B(n533), .Y(n524) );
  NOR2X1 U639 ( .A(n534), .B(n535), .Y(n533) );
  OAI22X1 U640 ( .A(outreg_data[8]), .B(n654), .C(\regs_matrix[2][8] ), .D(n26), .Y(n535) );
  OAI22X1 U641 ( .A(\regs_matrix[4][8] ), .B(n661), .C(\regs_matrix[6][8] ), 
        .D(n37), .Y(n534) );
  NOR2X1 U642 ( .A(n536), .B(n537), .Y(n532) );
  OAI22X1 U643 ( .A(\regs_matrix[3][8] ), .B(n667), .C(\regs_matrix[1][8] ), 
        .D(n669), .Y(n537) );
  OAI22X1 U644 ( .A(\regs_matrix[5][8] ), .B(n672), .C(\regs_matrix[7][8] ), 
        .D(n53), .Y(n536) );
  MUX2X1 U645 ( .B(n538), .A(n539), .S(n675), .Y(r2_data[9]) );
  NAND2X1 U646 ( .A(n540), .B(n541), .Y(n539) );
  NOR2X1 U647 ( .A(n542), .B(n543), .Y(n541) );
  OAI22X1 U648 ( .A(\regs_matrix[8][9] ), .B(n654), .C(\regs_matrix[10][9] ), 
        .D(n29), .Y(n543) );
  OAI22X1 U649 ( .A(\regs_matrix[12][9] ), .B(n661), .C(\regs_matrix[14][9] ), 
        .D(n101), .Y(n542) );
  NOR2X1 U650 ( .A(n544), .B(n545), .Y(n540) );
  OAI22X1 U651 ( .A(\regs_matrix[11][9] ), .B(n667), .C(\regs_matrix[9][9] ), 
        .D(n669), .Y(n545) );
  OAI22X1 U652 ( .A(\regs_matrix[13][9] ), .B(n672), .C(\regs_matrix[15][9] ), 
        .D(n61), .Y(n544) );
  NAND2X1 U653 ( .A(n546), .B(n547), .Y(n538) );
  NOR2X1 U654 ( .A(n548), .B(n549), .Y(n547) );
  OAI22X1 U655 ( .A(outreg_data[9]), .B(n654), .C(\regs_matrix[2][9] ), .D(n18), .Y(n549) );
  OAI22X1 U656 ( .A(\regs_matrix[4][9] ), .B(n661), .C(\regs_matrix[6][9] ), 
        .D(n100), .Y(n548) );
  NOR2X1 U657 ( .A(n550), .B(n551), .Y(n546) );
  OAI22X1 U658 ( .A(\regs_matrix[3][9] ), .B(n666), .C(\regs_matrix[1][9] ), 
        .D(n669), .Y(n551) );
  OAI22X1 U659 ( .A(\regs_matrix[5][9] ), .B(n672), .C(\regs_matrix[7][9] ), 
        .D(n60), .Y(n550) );
  MUX2X1 U660 ( .B(n552), .A(n553), .S(n674), .Y(r2_data[10]) );
  NAND2X1 U661 ( .A(n554), .B(n555), .Y(n553) );
  NOR2X1 U662 ( .A(n556), .B(n557), .Y(n555) );
  OAI22X1 U663 ( .A(\regs_matrix[8][10] ), .B(n655), .C(\regs_matrix[10][10] ), 
        .D(n22), .Y(n557) );
  OAI22X1 U664 ( .A(\regs_matrix[12][10] ), .B(n661), .C(\regs_matrix[14][10] ), .D(n40), .Y(n556) );
  NOR2X1 U665 ( .A(n558), .B(n559), .Y(n554) );
  OAI22X1 U666 ( .A(\regs_matrix[11][10] ), .B(n666), .C(\regs_matrix[9][10] ), 
        .D(n669), .Y(n559) );
  OAI22X1 U667 ( .A(\regs_matrix[13][10] ), .B(n672), .C(\regs_matrix[15][10] ), .D(n58), .Y(n558) );
  NAND2X1 U668 ( .A(n560), .B(n561), .Y(n552) );
  NOR2X1 U669 ( .A(n562), .B(n563), .Y(n561) );
  OAI22X1 U670 ( .A(outreg_data[10]), .B(n655), .C(\regs_matrix[2][10] ), .D(
        n22), .Y(n563) );
  OAI22X1 U671 ( .A(\regs_matrix[4][10] ), .B(n661), .C(\regs_matrix[6][10] ), 
        .D(n37), .Y(n562) );
  NOR2X1 U672 ( .A(n564), .B(n565), .Y(n560) );
  OAI22X1 U673 ( .A(\regs_matrix[3][10] ), .B(n666), .C(\regs_matrix[1][10] ), 
        .D(n669), .Y(n565) );
  OAI22X1 U674 ( .A(\regs_matrix[5][10] ), .B(n672), .C(\regs_matrix[7][10] ), 
        .D(n50), .Y(n564) );
  MUX2X1 U675 ( .B(n566), .A(n567), .S(n675), .Y(r2_data[11]) );
  NAND2X1 U676 ( .A(n568), .B(n569), .Y(n567) );
  NOR2X1 U677 ( .A(n570), .B(n571), .Y(n569) );
  OAI22X1 U678 ( .A(\regs_matrix[8][11] ), .B(n655), .C(\regs_matrix[10][11] ), 
        .D(n17), .Y(n571) );
  OAI22X1 U679 ( .A(\regs_matrix[12][11] ), .B(n661), .C(\regs_matrix[14][11] ), .D(n37), .Y(n570) );
  NOR2X1 U680 ( .A(n572), .B(n573), .Y(n568) );
  OAI22X1 U681 ( .A(\regs_matrix[11][11] ), .B(n666), .C(\regs_matrix[9][11] ), 
        .D(n669), .Y(n573) );
  OAI22X1 U682 ( .A(\regs_matrix[13][11] ), .B(n672), .C(\regs_matrix[15][11] ), .D(n46), .Y(n572) );
  NAND2X1 U683 ( .A(n574), .B(n575), .Y(n566) );
  NOR2X1 U684 ( .A(n576), .B(n577), .Y(n575) );
  OAI22X1 U685 ( .A(outreg_data[11]), .B(n655), .C(\regs_matrix[2][11] ), .D(
        n18), .Y(n577) );
  OAI22X1 U686 ( .A(\regs_matrix[4][11] ), .B(n661), .C(\regs_matrix[6][11] ), 
        .D(n40), .Y(n576) );
  NOR2X1 U687 ( .A(n578), .B(n579), .Y(n574) );
  OAI22X1 U688 ( .A(\regs_matrix[5][11] ), .B(n672), .C(\regs_matrix[7][11] ), 
        .D(n53), .Y(n578) );
  MUX2X1 U689 ( .B(n580), .A(n581), .S(n674), .Y(r2_data[12]) );
  NAND2X1 U690 ( .A(n582), .B(n583), .Y(n581) );
  NOR2X1 U691 ( .A(n584), .B(n585), .Y(n583) );
  OAI22X1 U692 ( .A(\regs_matrix[8][12] ), .B(n655), .C(\regs_matrix[10][12] ), 
        .D(n17), .Y(n585) );
  OAI22X1 U693 ( .A(\regs_matrix[12][12] ), .B(n661), .C(\regs_matrix[14][12] ), .D(n101), .Y(n584) );
  NOR2X1 U694 ( .A(n586), .B(n587), .Y(n582) );
  OAI22X1 U695 ( .A(\regs_matrix[11][12] ), .B(n667), .C(\regs_matrix[9][12] ), 
        .D(n670), .Y(n587) );
  OAI22X1 U696 ( .A(\regs_matrix[13][12] ), .B(n66), .C(\regs_matrix[15][12] ), 
        .D(n57), .Y(n586) );
  NAND2X1 U697 ( .A(n588), .B(n589), .Y(n580) );
  NOR2X1 U698 ( .A(n590), .B(n591), .Y(n589) );
  OAI22X1 U699 ( .A(outreg_data[12]), .B(n655), .C(\regs_matrix[2][12] ), .D(
        n21), .Y(n591) );
  OAI22X1 U700 ( .A(\regs_matrix[4][12] ), .B(n661), .C(\regs_matrix[6][12] ), 
        .D(n37), .Y(n590) );
  NOR2X1 U701 ( .A(n592), .B(n593), .Y(n588) );
  OAI22X1 U702 ( .A(\regs_matrix[3][12] ), .B(n666), .C(\regs_matrix[1][12] ), 
        .D(n669), .Y(n593) );
  OAI22X1 U703 ( .A(\regs_matrix[5][12] ), .B(n672), .C(\regs_matrix[7][12] ), 
        .D(n62), .Y(n592) );
  MUX2X1 U704 ( .B(n594), .A(n595), .S(n675), .Y(r2_data[13]) );
  NAND2X1 U705 ( .A(n596), .B(n597), .Y(n595) );
  NOR2X1 U706 ( .A(n598), .B(n599), .Y(n597) );
  OAI22X1 U707 ( .A(\regs_matrix[8][13] ), .B(n655), .C(\regs_matrix[10][13] ), 
        .D(n20), .Y(n599) );
  OAI22X1 U708 ( .A(\regs_matrix[12][13] ), .B(n661), .C(\regs_matrix[14][13] ), .D(n100), .Y(n598) );
  NOR2X1 U709 ( .A(n600), .B(n601), .Y(n596) );
  OAI22X1 U710 ( .A(\regs_matrix[11][13] ), .B(n667), .C(\regs_matrix[9][13] ), 
        .D(n669), .Y(n601) );
  OAI22X1 U711 ( .A(\regs_matrix[13][13] ), .B(n672), .C(\regs_matrix[15][13] ), .D(n59), .Y(n600) );
  NAND2X1 U712 ( .A(n602), .B(n603), .Y(n594) );
  NOR2X1 U713 ( .A(n604), .B(n605), .Y(n603) );
  OAI22X1 U714 ( .A(outreg_data[13]), .B(n655), .C(\regs_matrix[2][13] ), .D(
        n19), .Y(n605) );
  OAI22X1 U715 ( .A(\regs_matrix[4][13] ), .B(n661), .C(\regs_matrix[6][13] ), 
        .D(n101), .Y(n604) );
  NOR2X1 U716 ( .A(n606), .B(n607), .Y(n602) );
  OAI22X1 U717 ( .A(\regs_matrix[3][13] ), .B(n667), .C(\regs_matrix[1][13] ), 
        .D(n669), .Y(n607) );
  OAI22X1 U718 ( .A(\regs_matrix[5][13] ), .B(n673), .C(\regs_matrix[7][13] ), 
        .D(n61), .Y(n606) );
  MUX2X1 U719 ( .B(n608), .A(n609), .S(n674), .Y(r2_data[14]) );
  NAND2X1 U720 ( .A(n610), .B(n611), .Y(n609) );
  NOR2X1 U721 ( .A(n612), .B(n613), .Y(n611) );
  OAI22X1 U722 ( .A(\regs_matrix[8][14] ), .B(n655), .C(\regs_matrix[10][14] ), 
        .D(n16), .Y(n613) );
  OAI22X1 U723 ( .A(\regs_matrix[12][14] ), .B(n661), .C(\regs_matrix[14][14] ), .D(n40), .Y(n612) );
  NOR2X1 U724 ( .A(n614), .B(n615), .Y(n610) );
  OAI22X1 U725 ( .A(\regs_matrix[11][14] ), .B(n667), .C(\regs_matrix[9][14] ), 
        .D(n669), .Y(n615) );
  OAI22X1 U726 ( .A(\regs_matrix[13][14] ), .B(n673), .C(\regs_matrix[15][14] ), .D(n58), .Y(n614) );
  NAND2X1 U727 ( .A(n616), .B(n617), .Y(n608) );
  NOR2X1 U728 ( .A(n618), .B(n619), .Y(n617) );
  OAI22X1 U729 ( .A(outreg_data[14]), .B(n655), .C(\regs_matrix[2][14] ), .D(
        n30), .Y(n619) );
  OAI22X1 U730 ( .A(\regs_matrix[4][14] ), .B(n661), .C(\regs_matrix[6][14] ), 
        .D(n100), .Y(n618) );
  NOR2X1 U731 ( .A(n620), .B(n621), .Y(n616) );
  OAI22X1 U732 ( .A(\regs_matrix[3][14] ), .B(n666), .C(\regs_matrix[1][14] ), 
        .D(n669), .Y(n621) );
  OAI22X1 U733 ( .A(\regs_matrix[5][14] ), .B(n672), .C(\regs_matrix[7][14] ), 
        .D(n51), .Y(n620) );
  MUX2X1 U734 ( .B(n622), .A(n623), .S(n675), .Y(r2_data[15]) );
  NAND2X1 U735 ( .A(n624), .B(n625), .Y(n623) );
  NOR2X1 U736 ( .A(n626), .B(n627), .Y(n625) );
  OAI22X1 U737 ( .A(\regs_matrix[8][15] ), .B(n655), .C(\regs_matrix[10][15] ), 
        .D(n27), .Y(n627) );
  OAI22X1 U738 ( .A(\regs_matrix[12][15] ), .B(n661), .C(\regs_matrix[14][15] ), .D(n40), .Y(n626) );
  NOR2X1 U739 ( .A(n628), .B(n629), .Y(n624) );
  OAI22X1 U740 ( .A(\regs_matrix[11][15] ), .B(n667), .C(\regs_matrix[9][15] ), 
        .D(n670), .Y(n629) );
  OAI22X1 U741 ( .A(\regs_matrix[13][15] ), .B(n673), .C(\regs_matrix[15][15] ), .D(n59), .Y(n628) );
  NAND2X1 U742 ( .A(n630), .B(n631), .Y(n622) );
  NOR2X1 U743 ( .A(n632), .B(n633), .Y(n631) );
  OAI22X1 U744 ( .A(outreg_data[15]), .B(n655), .C(\regs_matrix[2][15] ), .D(
        n28), .Y(n633) );
  OAI22X1 U745 ( .A(\regs_matrix[4][15] ), .B(n661), .C(\regs_matrix[6][15] ), 
        .D(n37), .Y(n632) );
  NOR2X1 U746 ( .A(n634), .B(n635), .Y(n630) );
  OAI22X1 U747 ( .A(\regs_matrix[3][15] ), .B(n666), .C(\regs_matrix[1][15] ), 
        .D(n669), .Y(n635) );
  OAI22X1 U748 ( .A(\regs_matrix[5][15] ), .B(n673), .C(\regs_matrix[7][15] ), 
        .D(n63), .Y(n634) );
  NOR2X1 U749 ( .A(n636), .B(n637), .Y(n400) );
  OAI21X1 U750 ( .A(\regs_matrix[6][16] ), .B(n101), .C(n638), .Y(n637) );
  AOI22X1 U751 ( .A(n32), .B(n341), .C(n652), .D(n342), .Y(n638) );
  OAI21X1 U752 ( .A(\regs_matrix[4][16] ), .B(n661), .C(n676), .Y(n636) );
  NOR2X1 U753 ( .A(n639), .B(n640), .Y(n401) );
  OAI22X1 U754 ( .A(\regs_matrix[3][16] ), .B(n35), .C(\regs_matrix[1][16] ), 
        .D(n669), .Y(n640) );
  OAI22X1 U755 ( .A(\regs_matrix[5][16] ), .B(n673), .C(\regs_matrix[7][16] ), 
        .D(n63), .Y(n639) );
  NOR2X1 U756 ( .A(n641), .B(n642), .Y(n402) );
  OAI21X1 U757 ( .A(\regs_matrix[12][16] ), .B(n661), .C(n643), .Y(n642) );
  AOI22X1 U758 ( .A(n32), .B(n348), .C(n651), .D(n644), .Y(n643) );
  INVX2 U759 ( .A(\regs_matrix[8][16] ), .Y(n644) );
  NAND3X1 U760 ( .A(n645), .B(n646), .C(n647), .Y(n411) );
  NAND3X1 U761 ( .A(n646), .B(N15), .C(n647), .Y(n412) );
  OAI22X1 U762 ( .A(\regs_matrix[9][16] ), .B(n670), .C(\regs_matrix[14][16] ), 
        .D(n100), .Y(n641) );
  NAND3X1 U763 ( .A(N16), .B(N15), .C(n647), .Y(n414) );
  INVX2 U764 ( .A(N14), .Y(n647) );
  NAND3X1 U765 ( .A(N14), .B(n646), .C(n645), .Y(n418) );
  NOR2X1 U766 ( .A(n648), .B(n649), .Y(n403) );
  OAI21X1 U767 ( .A(\regs_matrix[11][16] ), .B(n666), .C(n674), .Y(n649) );
  NAND2X1 U768 ( .A(n79), .B(n646), .Y(n417) );
  OAI22X1 U769 ( .A(\regs_matrix[15][16] ), .B(n62), .C(\regs_matrix[13][16] ), 
        .D(n672), .Y(n648) );
  NAND3X1 U770 ( .A(N16), .B(N14), .C(n645), .Y(n419) );
  INVX8 U771 ( .A(n652), .Y(n654) );
  INVX8 U772 ( .A(n665), .Y(n666) );
  INVX8 U773 ( .A(n671), .Y(n672) );
  INVX4 U774 ( .A(n417), .Y(n665) );
  INVX4 U775 ( .A(n413), .Y(n659) );
  INVX4 U776 ( .A(w_data[13]), .Y(n714) );
  INVX4 U777 ( .A(w_data[15]), .Y(n719) );
  INVX2 U778 ( .A(w_en), .Y(n730) );
  INVX2 U779 ( .A(w_sel[1]), .Y(n731) );
  INVX2 U780 ( .A(w_sel[3]), .Y(n732) );
  INVX2 U781 ( .A(w_sel[2]), .Y(n733) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data({src1_data[16], n5, src1_data[14:9], n3, 
        src1_data[7:0]}), .src2_data(src2_data), .alu_op(alu_op), .result(
        alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX2 U2 ( .A(src1_data[15]), .Y(n4) );
  AND2X2 U3 ( .A(w_data_sel[0]), .B(n39), .Y(n1) );
  AND2X2 U4 ( .A(n39), .B(n6), .Y(n2) );
  INVX2 U5 ( .A(w_data_sel[1]), .Y(n39) );
  BUFX4 U6 ( .A(src1_data[8]), .Y(n3) );
  INVX8 U7 ( .A(n4), .Y(n5) );
  AND2X2 U8 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U9 ( .A(alu_result[15]), .Y(n8) );
  INVX2 U10 ( .A(w_data_sel[0]), .Y(n6) );
  AOI22X1 U11 ( .A(ext_data2[15]), .B(n1), .C(ext_data1[15]), .D(n2), .Y(n7)
         );
  OAI21X1 U12 ( .A(n39), .B(n8), .C(n7), .Y(dest_data[15]) );
  INVX2 U13 ( .A(alu_result[14]), .Y(n10) );
  AOI22X1 U14 ( .A(ext_data2[14]), .B(n1), .C(ext_data1[14]), .D(n2), .Y(n9)
         );
  OAI21X1 U15 ( .A(n39), .B(n10), .C(n9), .Y(dest_data[14]) );
  INVX2 U16 ( .A(alu_result[13]), .Y(n12) );
  AOI22X1 U17 ( .A(ext_data2[13]), .B(n1), .C(ext_data1[13]), .D(n2), .Y(n11)
         );
  OAI21X1 U18 ( .A(n39), .B(n12), .C(n11), .Y(dest_data[13]) );
  INVX2 U19 ( .A(alu_result[12]), .Y(n14) );
  AOI22X1 U20 ( .A(ext_data2[12]), .B(n1), .C(ext_data1[12]), .D(n2), .Y(n13)
         );
  OAI21X1 U21 ( .A(n39), .B(n14), .C(n13), .Y(dest_data[12]) );
  INVX2 U22 ( .A(alu_result[11]), .Y(n16) );
  AOI22X1 U23 ( .A(ext_data2[11]), .B(n1), .C(ext_data1[11]), .D(n2), .Y(n15)
         );
  OAI21X1 U24 ( .A(n39), .B(n16), .C(n15), .Y(dest_data[11]) );
  INVX2 U25 ( .A(alu_result[10]), .Y(n18) );
  AOI22X1 U26 ( .A(ext_data2[10]), .B(n1), .C(ext_data1[10]), .D(n2), .Y(n17)
         );
  OAI21X1 U27 ( .A(n39), .B(n18), .C(n17), .Y(dest_data[10]) );
  INVX2 U28 ( .A(alu_result[9]), .Y(n20) );
  AOI22X1 U29 ( .A(ext_data2[9]), .B(n1), .C(ext_data1[9]), .D(n2), .Y(n19) );
  OAI21X1 U30 ( .A(n39), .B(n20), .C(n19), .Y(dest_data[9]) );
  INVX2 U31 ( .A(alu_result[8]), .Y(n22) );
  AOI22X1 U32 ( .A(ext_data2[8]), .B(n1), .C(ext_data1[8]), .D(n2), .Y(n21) );
  OAI21X1 U33 ( .A(n39), .B(n22), .C(n21), .Y(dest_data[8]) );
  INVX2 U34 ( .A(alu_result[7]), .Y(n24) );
  AOI22X1 U35 ( .A(ext_data2[7]), .B(n1), .C(ext_data1[7]), .D(n2), .Y(n23) );
  OAI21X1 U36 ( .A(n39), .B(n24), .C(n23), .Y(dest_data[7]) );
  INVX2 U37 ( .A(alu_result[6]), .Y(n26) );
  AOI22X1 U38 ( .A(ext_data2[6]), .B(n1), .C(ext_data1[6]), .D(n2), .Y(n25) );
  OAI21X1 U39 ( .A(n39), .B(n26), .C(n25), .Y(dest_data[6]) );
  INVX2 U40 ( .A(alu_result[5]), .Y(n28) );
  AOI22X1 U41 ( .A(ext_data2[5]), .B(n1), .C(ext_data1[5]), .D(n2), .Y(n27) );
  OAI21X1 U42 ( .A(n39), .B(n28), .C(n27), .Y(dest_data[5]) );
  INVX2 U43 ( .A(alu_result[4]), .Y(n30) );
  AOI22X1 U44 ( .A(ext_data2[4]), .B(n1), .C(ext_data1[4]), .D(n2), .Y(n29) );
  OAI21X1 U45 ( .A(n39), .B(n30), .C(n29), .Y(dest_data[4]) );
  INVX2 U46 ( .A(alu_result[3]), .Y(n32) );
  AOI22X1 U47 ( .A(ext_data2[3]), .B(n1), .C(ext_data1[3]), .D(n2), .Y(n31) );
  OAI21X1 U48 ( .A(n39), .B(n32), .C(n31), .Y(dest_data[3]) );
  INVX2 U49 ( .A(alu_result[2]), .Y(n34) );
  AOI22X1 U50 ( .A(ext_data2[2]), .B(n1), .C(ext_data1[2]), .D(n2), .Y(n33) );
  OAI21X1 U51 ( .A(n39), .B(n34), .C(n33), .Y(dest_data[2]) );
  INVX2 U52 ( .A(alu_result[1]), .Y(n36) );
  AOI22X1 U53 ( .A(ext_data2[1]), .B(n1), .C(ext_data1[1]), .D(n2), .Y(n35) );
  OAI21X1 U54 ( .A(n39), .B(n36), .C(n35), .Y(dest_data[1]) );
  INVX2 U55 ( .A(alu_result[0]), .Y(n38) );
  AOI22X1 U56 ( .A(ext_data2[0]), .B(n1), .C(ext_data1[0]), .D(n2), .Y(n37) );
  OAI21X1 U57 ( .A(n39), .B(n38), .C(n37), .Y(dest_data[0]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, \sub_add_17_b0/carry[15] , \sub_add_17_b0/carry[14] ,
         \sub_add_17_b0/carry[13] , \sub_add_17_b0/carry[12] ,
         \sub_add_17_b0/carry[11] , \sub_add_17_b0/carry[10] ,
         \sub_add_17_b0/carry[9] , \sub_add_17_b0/carry[8] ,
         \sub_add_17_b0/carry[7] , \sub_add_17_b0/carry[6] ,
         \sub_add_17_b0/carry[5] , \sub_add_17_b0/carry[4] ,
         \sub_add_17_b0/carry[3] , \sub_add_17_b0/carry[2] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  assign N2 = in[0];

  AOI22X1 U22 ( .A(n2), .B(N11), .C(in[9]), .D(n1), .Y(n22) );
  AOI22X1 U23 ( .A(N10), .B(in[16]), .C(in[8]), .D(n1), .Y(n23) );
  AOI22X1 U24 ( .A(N9), .B(in[16]), .C(in[7]), .D(n1), .Y(n24) );
  AOI22X1 U25 ( .A(N8), .B(in[16]), .C(in[6]), .D(n1), .Y(n25) );
  AOI22X1 U26 ( .A(N7), .B(in[16]), .C(in[5]), .D(n1), .Y(n26) );
  AOI22X1 U27 ( .A(N6), .B(n2), .C(in[4]), .D(n1), .Y(n27) );
  AOI22X1 U28 ( .A(N5), .B(in[16]), .C(in[3]), .D(n1), .Y(n28) );
  AOI22X1 U29 ( .A(N4), .B(n2), .C(in[2]), .D(n1), .Y(n29) );
  AOI22X1 U30 ( .A(N3), .B(n2), .C(in[1]), .D(n1), .Y(n30) );
  AOI22X1 U31 ( .A(N17), .B(n2), .C(in[15]), .D(n1), .Y(n31) );
  AOI22X1 U32 ( .A(N16), .B(n2), .C(in[14]), .D(n1), .Y(n32) );
  AOI22X1 U33 ( .A(N15), .B(n2), .C(in[13]), .D(n1), .Y(n33) );
  AOI22X1 U34 ( .A(N14), .B(n2), .C(in[12]), .D(n1), .Y(n34) );
  AOI22X1 U35 ( .A(N13), .B(n2), .C(in[11]), .D(n1), .Y(n35) );
  AOI22X1 U36 ( .A(N12), .B(n2), .C(in[10]), .D(n1), .Y(n36) );
  AOI22X1 U37 ( .A(N2), .B(n2), .C(N2), .D(n1), .Y(n37) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(in[16]), .Y(n1) );
  XOR2X1 U4 ( .A(n18), .B(\sub_add_17_b0/carry[15] ), .Y(N17) );
  AND2X1 U5 ( .A(n17), .B(\sub_add_17_b0/carry[14] ), .Y(
        \sub_add_17_b0/carry[15] ) );
  XOR2X1 U6 ( .A(\sub_add_17_b0/carry[14] ), .B(n17), .Y(N16) );
  AND2X1 U7 ( .A(n16), .B(\sub_add_17_b0/carry[13] ), .Y(
        \sub_add_17_b0/carry[14] ) );
  XOR2X1 U8 ( .A(\sub_add_17_b0/carry[13] ), .B(n16), .Y(N15) );
  AND2X1 U9 ( .A(n15), .B(\sub_add_17_b0/carry[12] ), .Y(
        \sub_add_17_b0/carry[13] ) );
  XOR2X1 U10 ( .A(\sub_add_17_b0/carry[12] ), .B(n15), .Y(N14) );
  AND2X1 U11 ( .A(n14), .B(\sub_add_17_b0/carry[11] ), .Y(
        \sub_add_17_b0/carry[12] ) );
  XOR2X1 U12 ( .A(\sub_add_17_b0/carry[11] ), .B(n14), .Y(N13) );
  AND2X1 U13 ( .A(n13), .B(\sub_add_17_b0/carry[10] ), .Y(
        \sub_add_17_b0/carry[11] ) );
  XOR2X1 U14 ( .A(\sub_add_17_b0/carry[10] ), .B(n13), .Y(N12) );
  AND2X1 U15 ( .A(n12), .B(\sub_add_17_b0/carry[9] ), .Y(
        \sub_add_17_b0/carry[10] ) );
  XOR2X1 U16 ( .A(\sub_add_17_b0/carry[9] ), .B(n12), .Y(N11) );
  AND2X1 U17 ( .A(n11), .B(\sub_add_17_b0/carry[8] ), .Y(
        \sub_add_17_b0/carry[9] ) );
  XOR2X1 U18 ( .A(\sub_add_17_b0/carry[8] ), .B(n11), .Y(N10) );
  AND2X1 U19 ( .A(n10), .B(\sub_add_17_b0/carry[7] ), .Y(
        \sub_add_17_b0/carry[8] ) );
  XOR2X1 U20 ( .A(\sub_add_17_b0/carry[7] ), .B(n10), .Y(N9) );
  AND2X1 U21 ( .A(n9), .B(\sub_add_17_b0/carry[6] ), .Y(
        \sub_add_17_b0/carry[7] ) );
  XOR2X1 U38 ( .A(\sub_add_17_b0/carry[6] ), .B(n9), .Y(N8) );
  AND2X1 U39 ( .A(n8), .B(\sub_add_17_b0/carry[5] ), .Y(
        \sub_add_17_b0/carry[6] ) );
  XOR2X1 U40 ( .A(\sub_add_17_b0/carry[5] ), .B(n8), .Y(N7) );
  AND2X1 U41 ( .A(n7), .B(\sub_add_17_b0/carry[4] ), .Y(
        \sub_add_17_b0/carry[5] ) );
  XOR2X1 U42 ( .A(\sub_add_17_b0/carry[4] ), .B(n7), .Y(N6) );
  AND2X1 U43 ( .A(n6), .B(\sub_add_17_b0/carry[3] ), .Y(
        \sub_add_17_b0/carry[4] ) );
  XOR2X1 U44 ( .A(\sub_add_17_b0/carry[3] ), .B(n6), .Y(N5) );
  AND2X1 U45 ( .A(n5), .B(\sub_add_17_b0/carry[2] ), .Y(
        \sub_add_17_b0/carry[3] ) );
  XOR2X1 U46 ( .A(\sub_add_17_b0/carry[2] ), .B(n5), .Y(N4) );
  AND2X1 U47 ( .A(n4), .B(n3), .Y(\sub_add_17_b0/carry[2] ) );
  XOR2X1 U48 ( .A(n3), .B(n4), .Y(N3) );
  INVX2 U49 ( .A(N2), .Y(n3) );
  INVX2 U50 ( .A(in[1]), .Y(n4) );
  INVX2 U51 ( .A(in[2]), .Y(n5) );
  INVX2 U52 ( .A(in[3]), .Y(n6) );
  INVX2 U53 ( .A(in[4]), .Y(n7) );
  INVX2 U54 ( .A(in[5]), .Y(n8) );
  INVX2 U55 ( .A(in[6]), .Y(n9) );
  INVX2 U56 ( .A(in[7]), .Y(n10) );
  INVX2 U57 ( .A(in[8]), .Y(n11) );
  INVX2 U58 ( .A(in[9]), .Y(n12) );
  INVX2 U59 ( .A(in[10]), .Y(n13) );
  INVX2 U60 ( .A(in[11]), .Y(n14) );
  INVX2 U61 ( .A(in[12]), .Y(n15) );
  INVX2 U62 ( .A(in[13]), .Y(n16) );
  INVX2 U63 ( .A(in[14]), .Y(n17) );
  INVX2 U64 ( .A(in[15]), .Y(n18) );
  INVX2 U65 ( .A(n31), .Y(out[15]) );
  INVX2 U66 ( .A(n32), .Y(out[14]) );
  INVX2 U67 ( .A(n33), .Y(out[13]) );
  INVX2 U68 ( .A(n34), .Y(out[12]) );
  INVX2 U69 ( .A(n35), .Y(out[11]) );
  INVX2 U70 ( .A(n36), .Y(out[10]) );
  INVX2 U71 ( .A(n22), .Y(out[9]) );
  INVX2 U72 ( .A(n23), .Y(out[8]) );
  INVX2 U73 ( .A(n24), .Y(out[7]) );
  INVX2 U74 ( .A(n25), .Y(out[6]) );
  INVX2 U75 ( .A(n26), .Y(out[5]) );
  INVX2 U76 ( .A(n27), .Y(out[4]) );
  INVX2 U77 ( .A(n28), .Y(out[3]) );
  INVX2 U78 ( .A(n29), .Y(out[2]) );
  INVX2 U79 ( .A(n30), .Y(out[1]) );
  INVX2 U80 ( .A(n37), .Y(out[0]) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   dr, lc, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;

  sync_low_1 sync_dr ( .clk(clk), .async_in(data_ready), .n_rst(n_reset), 
        .sync_out(dr) );
  sync_low_0 sync_lc ( .clk(clk), .async_in(load_coeff), .n_rst(n_reset), 
        .sync_out(lc) );
  controller ctrllr ( .clk(clk), .n_rst(n_reset), .dr(dr), .lc(lc), .overflow(
        overflow), .cnt_up(cnt_up), .clear(clear), .err(err), .modwait(modwait), .op(op), .src1(src1), .src2(src2), .dest(dest) );
  counter count ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  datapath computer ( .clk(clk), .n_reset(n_reset), .op(op), .src1(src1), 
        .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(
        fir_coefficient), .outreg_data(outreg_data), .overflow(overflow) );
  magnitude mag ( .in(outreg_data), .out(fir_out) );
endmodule

