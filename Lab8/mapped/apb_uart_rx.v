/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Oct 19 13:16:44 2020
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, data_ready, overrun_error, framing_error, psel, 
        penable, pwrite, paddr, rx_data, pwdata, data_read, pslverr, prdata, 
        data_size, bit_period );
  input [2:0] paddr;
  input [7:0] rx_data;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   \data_status[0] , n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149;
  wire   [7:0] nxt_data;
  wire   [7:6] bit_period_msb;
  wire   [7:4] data_size_reg;
  wire   [7:0] nxt_prdata;
  wire   [7:0] error_status;
  wire   [7:0] data;

  DFFSR data_read_reg ( .D(n149), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data_read) );
  DFFSR \data_status_reg[0]  ( .D(n148), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \data_status[0] ) );
  DFFSR \error_status_reg[1]  ( .D(overrun_error), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(error_status[1]) );
  DFFSR \error_status_reg[0]  ( .D(framing_error), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(error_status[0]) );
  DFFSR \bit_period_msb_reg[7]  ( .D(n180), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period_msb[7]) );
  DFFSR \bit_period_msb_reg[6]  ( .D(n181), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period_msb[6]) );
  DFFSR \bit_period_msb_reg[5]  ( .D(n182), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[13]) );
  DFFSR \bit_period_msb_reg[4]  ( .D(n183), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[12]) );
  DFFSR \bit_period_msb_reg[3]  ( .D(n184), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[11]) );
  DFFSR \bit_period_msb_reg[2]  ( .D(n185), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[10]) );
  DFFSR \bit_period_msb_reg[1]  ( .D(n186), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[9]) );
  DFFSR \bit_period_msb_reg[0]  ( .D(n187), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[8]) );
  DFFSR \bit_period_lsb_reg[7]  ( .D(n172), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[7]) );
  DFFSR \bit_period_lsb_reg[6]  ( .D(n173), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[6]) );
  DFFSR \bit_period_lsb_reg[5]  ( .D(n174), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[5]) );
  DFFSR \bit_period_lsb_reg[4]  ( .D(n175), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[4]) );
  DFFSR \bit_period_lsb_reg[3]  ( .D(n176), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[3]) );
  DFFSR \bit_period_lsb_reg[2]  ( .D(n177), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[2]) );
  DFFSR \bit_period_lsb_reg[1]  ( .D(n178), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[1]) );
  DFFSR \bit_period_lsb_reg[0]  ( .D(n179), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[0]) );
  DFFSR \data_size_reg_reg[7]  ( .D(n164), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size_reg[7]) );
  DFFSR \data_size_reg_reg[6]  ( .D(n165), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size_reg[6]) );
  DFFSR \data_size_reg_reg[5]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size_reg[5]) );
  DFFSR \data_size_reg_reg[4]  ( .D(n167), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size_reg[4]) );
  DFFSR \data_size_reg_reg[3]  ( .D(n168), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \data_size_reg_reg[2]  ( .D(n169), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \data_size_reg_reg[1]  ( .D(n170), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[1]) );
  DFFSR \data_size_reg_reg[0]  ( .D(n171), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[0]) );
  DFFSR \data_reg[7]  ( .D(nxt_data[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data[7]) );
  DFFSR \data_reg[6]  ( .D(nxt_data[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data[6]) );
  DFFSR \data_reg[5]  ( .D(nxt_data[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data[5]) );
  DFFSR \data_reg[0]  ( .D(nxt_data[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data[0]) );
  DFFSR \data_reg[1]  ( .D(nxt_data[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data[1]) );
  DFFSR \data_reg[2]  ( .D(nxt_data[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data[2]) );
  DFFSR \data_reg[3]  ( .D(nxt_data[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data[3]) );
  DFFSR \data_reg[4]  ( .D(nxt_data[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data[4]) );
  DFFSR \prdata_reg[7]  ( .D(nxt_prdata[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[7]) );
  DFFSR \prdata_reg[6]  ( .D(nxt_prdata[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[6]) );
  DFFSR \prdata_reg[5]  ( .D(nxt_prdata[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[5]) );
  DFFSR \prdata_reg[4]  ( .D(nxt_prdata[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[4]) );
  DFFSR \prdata_reg[3]  ( .D(nxt_prdata[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[3]) );
  DFFSR \prdata_reg[2]  ( .D(nxt_prdata[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[2]) );
  DFFSR \prdata_reg[1]  ( .D(nxt_prdata[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[1]) );
  DFFSR \prdata_reg[0]  ( .D(nxt_prdata[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[0]) );
  AND2X1 U45 ( .A(penable), .B(n45), .Y(pslverr) );
  OAI21X1 U46 ( .A(n46), .B(n47), .C(n48), .Y(n45) );
  NAND3X1 U47 ( .A(paddr[0]), .B(paddr[2]), .C(n49), .Y(n48) );
  NAND2X1 U48 ( .A(n50), .B(n51), .Y(n47) );
  INVX1 U49 ( .A(n52), .Y(n50) );
  NAND2X1 U50 ( .A(n53), .B(n54), .Y(n46) );
  OAI21X1 U52 ( .A(n55), .B(n56), .C(n57), .Y(nxt_prdata[7]) );
  NAND2X1 U53 ( .A(data[7]), .B(n149), .Y(n57) );
  AOI21X1 U54 ( .A(data_size_reg[7]), .B(n58), .C(n59), .Y(n55) );
  OAI22X1 U55 ( .A(n53), .B(n60), .C(n51), .D(n61), .Y(n59) );
  OAI21X1 U56 ( .A(n62), .B(n56), .C(n63), .Y(nxt_prdata[6]) );
  NAND2X1 U57 ( .A(data[6]), .B(n149), .Y(n63) );
  AOI21X1 U58 ( .A(data_size_reg[6]), .B(n58), .C(n64), .Y(n62) );
  OAI22X1 U60 ( .A(n53), .B(n65), .C(n51), .D(n66), .Y(n64) );
  OAI21X1 U61 ( .A(n67), .B(n56), .C(n68), .Y(nxt_prdata[5]) );
  NAND2X1 U62 ( .A(data[5]), .B(n149), .Y(n68) );
  AOI21X1 U63 ( .A(data_size_reg[5]), .B(n58), .C(n69), .Y(n67) );
  OAI22X1 U64 ( .A(n53), .B(n70), .C(n51), .D(n71), .Y(n69) );
  OAI21X1 U65 ( .A(n72), .B(n56), .C(n73), .Y(nxt_prdata[4]) );
  NAND2X1 U66 ( .A(data[4]), .B(n149), .Y(n73) );
  AOI21X1 U67 ( .A(data_size_reg[4]), .B(n58), .C(n74), .Y(n72) );
  OAI22X1 U68 ( .A(n53), .B(n75), .C(n51), .D(n76), .Y(n74) );
  OAI21X1 U69 ( .A(n77), .B(n56), .C(n78), .Y(nxt_prdata[3]) );
  NAND2X1 U70 ( .A(data[3]), .B(n149), .Y(n78) );
  AOI21X1 U71 ( .A(data_size[3]), .B(n58), .C(n79), .Y(n77) );
  OAI22X1 U72 ( .A(n53), .B(n80), .C(n51), .D(n81), .Y(n79) );
  OAI21X1 U73 ( .A(n82), .B(n56), .C(n83), .Y(nxt_prdata[2]) );
  NAND2X1 U74 ( .A(data[2]), .B(n149), .Y(n83) );
  AOI21X1 U75 ( .A(data_size[2]), .B(n58), .C(n84), .Y(n82) );
  OAI22X1 U76 ( .A(n53), .B(n85), .C(n51), .D(n86), .Y(n84) );
  INVX1 U77 ( .A(n54), .Y(n58) );
  OAI21X1 U78 ( .A(n87), .B(n88), .C(n89), .Y(nxt_prdata[1]) );
  OAI21X1 U79 ( .A(n90), .B(n91), .C(n49), .Y(n89) );
  OAI22X1 U80 ( .A(n54), .B(n92), .C(n53), .D(n93), .Y(n91) );
  OAI21X1 U81 ( .A(n51), .B(n94), .C(n95), .Y(n90) );
  NAND3X1 U82 ( .A(n96), .B(paddr[0]), .C(error_status[1]), .Y(n95) );
  INVX1 U83 ( .A(n97), .Y(n96) );
  INVX1 U84 ( .A(data[1]), .Y(n88) );
  OAI21X1 U85 ( .A(n87), .B(n98), .C(n99), .Y(nxt_prdata[0]) );
  OAI21X1 U86 ( .A(n100), .B(n101), .C(n49), .Y(n99) );
  OAI22X1 U87 ( .A(n54), .B(n102), .C(n53), .D(n103), .Y(n101) );
  OAI22X1 U88 ( .A(n51), .B(n104), .C(n97), .D(n105), .Y(n100) );
  MUX2X1 U89 ( .B(\data_status[0] ), .A(error_status[0]), .S(paddr[0]), .Y(
        n105) );
  INVX1 U90 ( .A(data[0]), .Y(n98) );
  NOR2X1 U91 ( .A(n106), .B(n107), .Y(nxt_data[7]) );
  OAI22X1 U92 ( .A(n107), .B(n108), .C(n106), .D(n109), .Y(nxt_data[6]) );
  OAI22X1 U93 ( .A(n109), .B(n108), .C(n106), .D(n110), .Y(nxt_data[5]) );
  OAI21X1 U94 ( .A(n107), .B(n111), .C(n112), .Y(nxt_data[4]) );
  AOI22X1 U95 ( .A(rx_data[4]), .B(n113), .C(rx_data[5]), .D(n114), .Y(n112)
         );
  INVX1 U96 ( .A(rx_data[7]), .Y(n107) );
  OAI21X1 U97 ( .A(n109), .B(n111), .C(n115), .Y(nxt_data[3]) );
  AOI22X1 U98 ( .A(rx_data[3]), .B(n113), .C(rx_data[4]), .D(n114), .Y(n115)
         );
  INVX1 U99 ( .A(rx_data[6]), .Y(n109) );
  OAI21X1 U100 ( .A(n110), .B(n111), .C(n116), .Y(nxt_data[2]) );
  AOI22X1 U101 ( .A(rx_data[2]), .B(n113), .C(rx_data[3]), .D(n114), .Y(n116)
         );
  INVX1 U102 ( .A(rx_data[5]), .Y(n110) );
  OAI21X1 U103 ( .A(n117), .B(n111), .C(n118), .Y(nxt_data[1]) );
  AOI22X1 U104 ( .A(rx_data[1]), .B(n113), .C(rx_data[2]), .D(n114), .Y(n118)
         );
  INVX1 U105 ( .A(rx_data[4]), .Y(n117) );
  OAI21X1 U106 ( .A(n111), .B(n119), .C(n120), .Y(nxt_data[0]) );
  AOI22X1 U107 ( .A(rx_data[0]), .B(n113), .C(rx_data[1]), .D(n114), .Y(n120)
         );
  INVX1 U108 ( .A(n108), .Y(n114) );
  INVX1 U109 ( .A(n106), .Y(n113) );
  NAND2X1 U110 ( .A(n111), .B(n108), .Y(n106) );
  NAND3X1 U111 ( .A(data_size[0]), .B(data_size[1]), .C(n121), .Y(n108) );
  NOR2X1 U112 ( .A(data_size[3]), .B(n122), .Y(n121) );
  INVX1 U113 ( .A(rx_data[3]), .Y(n119) );
  NAND3X1 U114 ( .A(data_size[0]), .B(data_size[2]), .C(n123), .Y(n111) );
  NOR2X1 U115 ( .A(data_size[3]), .B(data_size[1]), .Y(n123) );
  INVX1 U116 ( .A(n124), .Y(n148) );
  OAI21X1 U117 ( .A(n125), .B(n126), .C(data_ready), .Y(n124) );
  NAND2X1 U118 ( .A(n49), .B(n53), .Y(n126) );
  NAND3X1 U119 ( .A(n97), .B(n127), .C(n54), .Y(n125) );
  NAND2X1 U120 ( .A(n128), .B(n129), .Y(n97) );
  INVX1 U121 ( .A(n87), .Y(n149) );
  NAND3X1 U122 ( .A(n49), .B(paddr[1]), .C(n130), .Y(n87) );
  NOR2X1 U123 ( .A(paddr[0]), .B(n129), .Y(n130) );
  INVX1 U124 ( .A(n56), .Y(n49) );
  NAND2X1 U125 ( .A(psel), .B(n131), .Y(n56) );
  INVX1 U126 ( .A(pwrite), .Y(n131) );
  MUX2X1 U127 ( .B(n104), .A(n132), .S(n133), .Y(n187) );
  INVX1 U128 ( .A(bit_period[8]), .Y(n104) );
  MUX2X1 U129 ( .B(n94), .A(n134), .S(n133), .Y(n186) );
  INVX1 U130 ( .A(bit_period[9]), .Y(n94) );
  MUX2X1 U131 ( .B(n86), .A(n135), .S(n133), .Y(n185) );
  INVX1 U132 ( .A(bit_period[10]), .Y(n86) );
  MUX2X1 U133 ( .B(n81), .A(n136), .S(n133), .Y(n184) );
  INVX1 U134 ( .A(bit_period[11]), .Y(n81) );
  MUX2X1 U135 ( .B(n76), .A(n137), .S(n133), .Y(n183) );
  INVX1 U136 ( .A(bit_period[12]), .Y(n76) );
  MUX2X1 U137 ( .B(n71), .A(n138), .S(n133), .Y(n182) );
  INVX1 U138 ( .A(bit_period[13]), .Y(n71) );
  MUX2X1 U139 ( .B(n66), .A(n139), .S(n133), .Y(n181) );
  INVX1 U140 ( .A(bit_period_msb[6]), .Y(n66) );
  MUX2X1 U141 ( .B(n61), .A(n140), .S(n133), .Y(n180) );
  NOR2X1 U142 ( .A(n51), .B(n52), .Y(n133) );
  NAND3X1 U143 ( .A(paddr[1]), .B(n129), .C(paddr[0]), .Y(n51) );
  INVX1 U144 ( .A(bit_period_msb[7]), .Y(n61) );
  MUX2X1 U145 ( .B(n103), .A(n132), .S(n141), .Y(n179) );
  INVX1 U146 ( .A(bit_period[0]), .Y(n103) );
  MUX2X1 U147 ( .B(n93), .A(n134), .S(n141), .Y(n178) );
  INVX1 U148 ( .A(bit_period[1]), .Y(n93) );
  MUX2X1 U149 ( .B(n85), .A(n135), .S(n141), .Y(n177) );
  INVX1 U150 ( .A(bit_period[2]), .Y(n85) );
  MUX2X1 U151 ( .B(n80), .A(n136), .S(n141), .Y(n176) );
  INVX1 U152 ( .A(bit_period[3]), .Y(n80) );
  MUX2X1 U153 ( .B(n75), .A(n137), .S(n141), .Y(n175) );
  INVX1 U154 ( .A(bit_period[4]), .Y(n75) );
  MUX2X1 U155 ( .B(n70), .A(n138), .S(n141), .Y(n174) );
  INVX1 U156 ( .A(bit_period[5]), .Y(n70) );
  MUX2X1 U157 ( .B(n65), .A(n139), .S(n141), .Y(n173) );
  INVX1 U158 ( .A(bit_period[6]), .Y(n65) );
  MUX2X1 U159 ( .B(n60), .A(n140), .S(n141), .Y(n172) );
  NOR2X1 U160 ( .A(n53), .B(n52), .Y(n141) );
  NAND3X1 U161 ( .A(n127), .B(n129), .C(paddr[1]), .Y(n53) );
  INVX1 U162 ( .A(paddr[2]), .Y(n129) );
  INVX1 U163 ( .A(bit_period[7]), .Y(n60) );
  MUX2X1 U164 ( .B(n102), .A(n132), .S(n142), .Y(n171) );
  INVX1 U165 ( .A(pwdata[0]), .Y(n132) );
  INVX1 U166 ( .A(data_size[0]), .Y(n102) );
  MUX2X1 U167 ( .B(n92), .A(n134), .S(n142), .Y(n170) );
  INVX1 U168 ( .A(pwdata[1]), .Y(n134) );
  INVX1 U169 ( .A(data_size[1]), .Y(n92) );
  MUX2X1 U170 ( .B(n122), .A(n135), .S(n142), .Y(n169) );
  INVX1 U171 ( .A(pwdata[2]), .Y(n135) );
  INVX1 U172 ( .A(data_size[2]), .Y(n122) );
  MUX2X1 U173 ( .B(n143), .A(n136), .S(n142), .Y(n168) );
  INVX1 U174 ( .A(pwdata[3]), .Y(n136) );
  INVX1 U175 ( .A(data_size[3]), .Y(n143) );
  MUX2X1 U176 ( .B(n144), .A(n137), .S(n142), .Y(n167) );
  INVX1 U177 ( .A(pwdata[4]), .Y(n137) );
  INVX1 U178 ( .A(data_size_reg[4]), .Y(n144) );
  MUX2X1 U179 ( .B(n145), .A(n138), .S(n142), .Y(n166) );
  INVX1 U180 ( .A(pwdata[5]), .Y(n138) );
  INVX1 U181 ( .A(data_size_reg[5]), .Y(n145) );
  MUX2X1 U182 ( .B(n146), .A(n139), .S(n142), .Y(n165) );
  INVX1 U183 ( .A(pwdata[6]), .Y(n139) );
  INVX1 U184 ( .A(data_size_reg[6]), .Y(n146) );
  MUX2X1 U185 ( .B(n147), .A(n140), .S(n142), .Y(n164) );
  NOR2X1 U186 ( .A(n54), .B(n52), .Y(n142) );
  NAND2X1 U187 ( .A(pwrite), .B(psel), .Y(n52) );
  NAND3X1 U188 ( .A(n127), .B(n128), .C(paddr[2]), .Y(n54) );
  INVX1 U189 ( .A(paddr[1]), .Y(n128) );
  INVX1 U190 ( .A(paddr[0]), .Y(n127) );
  INVX1 U191 ( .A(pwdata[7]), .Y(n140) );
  INVX1 U192 ( .A(data_size_reg[7]), .Y(n147) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \Q_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \Q_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \Q_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \Q_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \Q_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \Q_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \Q_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \Q_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \Q_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 sr ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_package_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_package_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_package_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_dec_0 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;
  wire   n2, n4, n6, n8, n10, n12, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;

  INVX2 U1 ( .A(n29), .Y(SUM[13]) );
  INVX2 U2 ( .A(A[12]), .Y(n2) );
  INVX2 U3 ( .A(n32), .Y(SUM[11]) );
  INVX2 U4 ( .A(A[10]), .Y(n4) );
  INVX2 U5 ( .A(n15), .Y(SUM[9]) );
  INVX2 U6 ( .A(A[8]), .Y(n6) );
  INVX2 U7 ( .A(n19), .Y(SUM[7]) );
  INVX2 U8 ( .A(A[6]), .Y(n8) );
  INVX2 U9 ( .A(n22), .Y(SUM[5]) );
  INVX2 U10 ( .A(A[4]), .Y(n10) );
  INVX2 U11 ( .A(n25), .Y(SUM[3]) );
  INVX2 U12 ( .A(A[2]), .Y(n12) );
  INVX2 U13 ( .A(n28), .Y(SUM[1]) );
  INVX2 U14 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U15 ( .A(n16), .B(A[9]), .C(n17), .Y(n15) );
  OAI21X1 U16 ( .A(n18), .B(n6), .C(n16), .Y(SUM[8]) );
  AOI21X1 U17 ( .A(n20), .B(A[7]), .C(n18), .Y(n19) );
  OAI21X1 U18 ( .A(n21), .B(n8), .C(n20), .Y(SUM[6]) );
  AOI21X1 U19 ( .A(n23), .B(A[5]), .C(n21), .Y(n22) );
  OAI21X1 U20 ( .A(n24), .B(n10), .C(n23), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n26), .B(A[3]), .C(n24), .Y(n25) );
  OAI21X1 U22 ( .A(n27), .B(n12), .C(n26), .Y(SUM[2]) );
  AOI21X1 U23 ( .A(A[0]), .B(A[1]), .C(n27), .Y(n28) );
  AOI21X1 U24 ( .A(n30), .B(A[13]), .C(SUM[14]), .Y(n29) );
  NOR2X1 U25 ( .A(n30), .B(A[13]), .Y(SUM[14]) );
  OAI21X1 U26 ( .A(n31), .B(n2), .C(n30), .Y(SUM[12]) );
  NAND2X1 U27 ( .A(n31), .B(n2), .Y(n30) );
  AOI21X1 U28 ( .A(n33), .B(A[11]), .C(n31), .Y(n32) );
  NOR2X1 U29 ( .A(n33), .B(A[11]), .Y(n31) );
  OAI21X1 U30 ( .A(n17), .B(n4), .C(n33), .Y(SUM[10]) );
  NAND2X1 U31 ( .A(n17), .B(n4), .Y(n33) );
  NOR2X1 U32 ( .A(n16), .B(A[9]), .Y(n17) );
  NAND2X1 U33 ( .A(n18), .B(n6), .Y(n16) );
  NOR2X1 U34 ( .A(n20), .B(A[7]), .Y(n18) );
  NAND2X1 U35 ( .A(n21), .B(n8), .Y(n20) );
  NOR2X1 U36 ( .A(n23), .B(A[5]), .Y(n21) );
  NAND2X1 U37 ( .A(n24), .B(n10), .Y(n23) );
  NOR2X1 U38 ( .A(n26), .B(A[3]), .Y(n24) );
  NAND2X1 U39 ( .A(n27), .B(n12), .Y(n26) );
  NOR2X1 U40 ( .A(A[1]), .B(A[0]), .Y(n27) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n1, n2, n4, n5, n6, n7, n8, n9, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114;

  DFFSR \count_out_reg[0]  ( .D(n99), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[13]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  DFFSR \count_out_reg[12]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR \count_out_reg[11]  ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[10]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[9]  ( .D(n90), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(n91), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n92), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(n93), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n94), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n95), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n96), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n97), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n98), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n114), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 r315 ( .A(count_out), .SUM({N37, N36, 
        N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24}) );
  flex_counter_NUM_CNT_BITS14_DW01_dec_0 sub_37 ( .A({1'b0, rollover_val}), 
        .SUM({N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, 
        N5}) );
  OR2X2 U8 ( .A(count_enable), .B(clear), .Y(n7) );
  INVX1 U20 ( .A(n1), .Y(n114) );
  AOI22X1 U21 ( .A(n2), .B(n4), .C(rollover_flag), .D(n5), .Y(n1) );
  OAI21X1 U22 ( .A(clear), .B(n6), .C(n7), .Y(n5) );
  INVX1 U23 ( .A(n8), .Y(n6) );
  NOR2X1 U24 ( .A(n9), .B(n25), .Y(n4) );
  NAND3X1 U25 ( .A(n26), .B(n27), .C(n28), .Y(n25) );
  NOR2X1 U26 ( .A(n29), .B(n30), .Y(n28) );
  XOR2X1 U27 ( .A(count_out[1]), .B(N6), .Y(n30) );
  XOR2X1 U28 ( .A(count_out[0]), .B(N5), .Y(n29) );
  XOR2X1 U29 ( .A(n31), .B(N7), .Y(n27) );
  XOR2X1 U30 ( .A(n32), .B(N12), .Y(n26) );
  NAND3X1 U31 ( .A(n33), .B(n34), .C(n35), .Y(n9) );
  NOR2X1 U32 ( .A(N19), .B(n36), .Y(n35) );
  XOR2X1 U33 ( .A(n37), .B(N16), .Y(n34) );
  XOR2X1 U34 ( .A(n38), .B(N11), .Y(n33) );
  NOR2X1 U35 ( .A(n39), .B(n40), .Y(n2) );
  NAND3X1 U36 ( .A(n41), .B(n42), .C(n43), .Y(n40) );
  NOR2X1 U37 ( .A(n44), .B(n45), .Y(n43) );
  XOR2X1 U38 ( .A(count_out[8]), .B(N13), .Y(n45) );
  XOR2X1 U39 ( .A(count_out[5]), .B(N10), .Y(n44) );
  XOR2X1 U40 ( .A(n46), .B(N14), .Y(n42) );
  XOR2X1 U41 ( .A(n47), .B(N15), .Y(n41) );
  NAND3X1 U42 ( .A(n48), .B(n49), .C(n50), .Y(n39) );
  NOR2X1 U43 ( .A(n51), .B(n52), .Y(n50) );
  XOR2X1 U44 ( .A(count_out[3]), .B(N8), .Y(n52) );
  XOR2X1 U45 ( .A(count_out[13]), .B(N18), .Y(n51) );
  XOR2X1 U46 ( .A(n53), .B(N9), .Y(n49) );
  XOR2X1 U47 ( .A(n54), .B(N17), .Y(n48) );
  OAI21X1 U48 ( .A(n36), .B(n55), .C(n56), .Y(n99) );
  MUX2X1 U49 ( .B(count_out[0]), .A(n57), .S(n7), .Y(n56) );
  NOR2X1 U50 ( .A(clear), .B(n8), .Y(n57) );
  INVX1 U51 ( .A(N24), .Y(n55) );
  OAI21X1 U52 ( .A(n58), .B(n7), .C(n59), .Y(n98) );
  NAND2X1 U53 ( .A(N25), .B(n60), .Y(n59) );
  OAI21X1 U54 ( .A(n31), .B(n7), .C(n61), .Y(n97) );
  NAND2X1 U55 ( .A(N26), .B(n60), .Y(n61) );
  OAI21X1 U56 ( .A(n62), .B(n7), .C(n63), .Y(n96) );
  NAND2X1 U57 ( .A(N27), .B(n60), .Y(n63) );
  OAI21X1 U58 ( .A(n53), .B(n7), .C(n64), .Y(n95) );
  NAND2X1 U59 ( .A(N28), .B(n60), .Y(n64) );
  OAI21X1 U60 ( .A(n65), .B(n7), .C(n66), .Y(n94) );
  NAND2X1 U61 ( .A(N29), .B(n60), .Y(n66) );
  OAI21X1 U62 ( .A(n38), .B(n7), .C(n67), .Y(n93) );
  NAND2X1 U63 ( .A(N30), .B(n60), .Y(n67) );
  INVX1 U64 ( .A(count_out[6]), .Y(n38) );
  OAI21X1 U65 ( .A(n32), .B(n7), .C(n68), .Y(n92) );
  NAND2X1 U66 ( .A(N31), .B(n60), .Y(n68) );
  INVX1 U67 ( .A(count_out[7]), .Y(n32) );
  OAI21X1 U68 ( .A(n69), .B(n7), .C(n70), .Y(n91) );
  NAND2X1 U69 ( .A(N32), .B(n60), .Y(n70) );
  OAI21X1 U70 ( .A(n46), .B(n7), .C(n71), .Y(n90) );
  NAND2X1 U71 ( .A(N33), .B(n60), .Y(n71) );
  OAI21X1 U72 ( .A(n47), .B(n7), .C(n72), .Y(n89) );
  NAND2X1 U73 ( .A(N34), .B(n60), .Y(n72) );
  OAI21X1 U74 ( .A(n37), .B(n7), .C(n73), .Y(n88) );
  NAND2X1 U75 ( .A(N35), .B(n60), .Y(n73) );
  OAI21X1 U76 ( .A(n54), .B(n7), .C(n74), .Y(n87) );
  NAND2X1 U77 ( .A(N36), .B(n60), .Y(n74) );
  OAI21X1 U78 ( .A(n75), .B(n7), .C(n76), .Y(n86) );
  NAND2X1 U79 ( .A(N37), .B(n60), .Y(n76) );
  INVX1 U80 ( .A(n36), .Y(n60) );
  NAND3X1 U81 ( .A(n7), .B(n77), .C(n8), .Y(n36) );
  NAND2X1 U82 ( .A(n78), .B(n79), .Y(n8) );
  NOR2X1 U83 ( .A(n80), .B(n81), .Y(n79) );
  NAND3X1 U84 ( .A(n82), .B(n83), .C(n84), .Y(n81) );
  XOR2X1 U85 ( .A(n37), .B(rollover_val[11]), .Y(n84) );
  INVX1 U86 ( .A(count_out[11]), .Y(n37) );
  XOR2X1 U87 ( .A(n54), .B(rollover_val[12]), .Y(n83) );
  INVX1 U88 ( .A(count_out[12]), .Y(n54) );
  XOR2X1 U89 ( .A(n47), .B(rollover_val[10]), .Y(n82) );
  INVX1 U90 ( .A(count_out[10]), .Y(n47) );
  NAND3X1 U91 ( .A(n85), .B(n100), .C(n101), .Y(n80) );
  NOR2X1 U92 ( .A(n102), .B(n103), .Y(n101) );
  XOR2X1 U93 ( .A(rollover_val[7]), .B(count_out[7]), .Y(n103) );
  XOR2X1 U94 ( .A(rollover_val[6]), .B(count_out[6]), .Y(n102) );
  XOR2X1 U95 ( .A(n69), .B(rollover_val[8]), .Y(n100) );
  INVX1 U96 ( .A(count_out[8]), .Y(n69) );
  XOR2X1 U97 ( .A(n46), .B(rollover_val[9]), .Y(n85) );
  INVX1 U98 ( .A(count_out[9]), .Y(n46) );
  NOR2X1 U99 ( .A(n104), .B(n105), .Y(n78) );
  NAND3X1 U100 ( .A(n106), .B(n107), .C(n108), .Y(n105) );
  XOR2X1 U101 ( .A(n53), .B(rollover_val[4]), .Y(n108) );
  INVX1 U102 ( .A(count_out[4]), .Y(n53) );
  XOR2X1 U103 ( .A(n65), .B(rollover_val[5]), .Y(n107) );
  INVX1 U104 ( .A(count_out[5]), .Y(n65) );
  XOR2X1 U105 ( .A(n62), .B(rollover_val[3]), .Y(n106) );
  INVX1 U106 ( .A(count_out[3]), .Y(n62) );
  NAND3X1 U107 ( .A(n109), .B(n110), .C(n111), .Y(n104) );
  NOR2X1 U108 ( .A(n112), .B(n113), .Y(n111) );
  XOR2X1 U109 ( .A(rollover_val[13]), .B(count_out[13]), .Y(n113) );
  XOR2X1 U110 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n112) );
  XOR2X1 U111 ( .A(n58), .B(rollover_val[1]), .Y(n110) );
  INVX1 U112 ( .A(count_out[1]), .Y(n58) );
  XOR2X1 U113 ( .A(n31), .B(rollover_val[2]), .Y(n109) );
  INVX1 U114 ( .A(count_out[2]), .Y(n31) );
  INVX1 U115 ( .A(clear), .Y(n77) );
  INVX1 U116 ( .A(count_out[13]), .Y(n75) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
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


module timer ( clk, n_rst, enable_timer, bit_period, data_size, shift_enable, 
        packet_done );
  input [13:0] bit_period;
  input [3:0] data_size;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_2_net_[3] , \_2_net_[2] , \_2_net_[0] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58;
  wire   [13:0] count;
  assign \_2_net_[0]  = data_size[0];

  flex_counter_NUM_CNT_BITS14 clkdiv ( .clk(clk), .n_rst(n_rst), .clear(n57), 
        .count_enable(enable_timer), .rollover_val(bit_period), .count_out(
        count) );
  flex_counter_NUM_CNT_BITS4 bitcnt ( .clk(clk), .n_rst(n_rst), .clear(n57), 
        .count_enable(shift_enable), .rollover_val({\_2_net_[3] , \_2_net_[2] , 
        n58, \_2_net_[0] }), .rollover_flag(packet_done) );
  INVX1 U3 ( .A(n1), .Y(shift_enable) );
  AOI22X1 U4 ( .A(n2), .B(n3), .C(n4), .D(n5), .Y(n1) );
  NOR2X1 U5 ( .A(n6), .B(n7), .Y(n5) );
  NAND3X1 U6 ( .A(n8), .B(n9), .C(n10), .Y(n7) );
  NOR2X1 U7 ( .A(n11), .B(n12), .Y(n10) );
  XNOR2X1 U8 ( .A(n13), .B(bit_period[8]), .Y(n12) );
  XNOR2X1 U9 ( .A(count[5]), .B(n14), .Y(n11) );
  XNOR2X1 U10 ( .A(bit_period[9]), .B(count[7]), .Y(n9) );
  XNOR2X1 U11 ( .A(bit_period[10]), .B(count[8]), .Y(n8) );
  NAND3X1 U12 ( .A(n15), .B(n16), .C(n17), .Y(n6) );
  XNOR2X1 U13 ( .A(bit_period[6]), .B(count[4]), .Y(n15) );
  NOR2X1 U14 ( .A(n18), .B(n19), .Y(n4) );
  NAND3X1 U15 ( .A(n20), .B(n21), .C(n22), .Y(n19) );
  XNOR2X1 U16 ( .A(bit_period[4]), .B(count[2]), .Y(n22) );
  XNOR2X1 U17 ( .A(bit_period[5]), .B(count[3]), .Y(n21) );
  XNOR2X1 U18 ( .A(bit_period[13]), .B(count[11]), .Y(n20) );
  NAND3X1 U19 ( .A(n23), .B(n24), .C(n25), .Y(n18) );
  NOR2X1 U20 ( .A(n26), .B(n27), .Y(n25) );
  XNOR2X1 U21 ( .A(n28), .B(bit_period[12]), .Y(n27) );
  XNOR2X1 U22 ( .A(count[9]), .B(n29), .Y(n26) );
  XNOR2X1 U23 ( .A(bit_period[2]), .B(count[0]), .Y(n24) );
  XNOR2X1 U24 ( .A(bit_period[3]), .B(count[1]), .Y(n23) );
  NOR2X1 U25 ( .A(n30), .B(n31), .Y(n3) );
  INVX1 U26 ( .A(n32), .Y(n31) );
  NOR3X1 U27 ( .A(count[4]), .B(count[5]), .C(count[2]), .Y(n32) );
  NAND3X1 U28 ( .A(n13), .B(n33), .C(n34), .Y(n30) );
  NOR2X1 U29 ( .A(count[9]), .B(count[8]), .Y(n34) );
  INVX1 U30 ( .A(count[7]), .Y(n33) );
  INVX1 U31 ( .A(count[6]), .Y(n13) );
  NOR2X1 U32 ( .A(n35), .B(n36), .Y(n2) );
  NAND3X1 U33 ( .A(n37), .B(n38), .C(n39), .Y(n36) );
  INVX1 U34 ( .A(n40), .Y(n39) );
  MUX2X1 U35 ( .B(count[1]), .A(n41), .S(count[3]), .Y(n40) );
  INVX1 U36 ( .A(count[0]), .Y(n38) );
  OAI21X1 U37 ( .A(count[1]), .B(n16), .C(n41), .Y(n37) );
  NAND3X1 U38 ( .A(n42), .B(n43), .C(n44), .Y(n41) );
  AOI21X1 U39 ( .A(bit_period[0]), .B(n45), .C(bit_period[4]), .Y(n44) );
  INVX1 U40 ( .A(n46), .Y(n45) );
  INVX1 U41 ( .A(n47), .Y(n42) );
  OR2X1 U42 ( .A(n47), .B(n48), .Y(n16) );
  OAI21X1 U43 ( .A(n46), .B(n49), .C(n43), .Y(n48) );
  INVX1 U44 ( .A(n50), .Y(n43) );
  NAND3X1 U45 ( .A(n51), .B(n29), .C(n52), .Y(n50) );
  NOR2X1 U46 ( .A(bit_period[13]), .B(bit_period[12]), .Y(n52) );
  INVX1 U47 ( .A(bit_period[11]), .Y(n29) );
  INVX1 U48 ( .A(bit_period[10]), .Y(n51) );
  INVX1 U49 ( .A(bit_period[4]), .Y(n49) );
  NAND3X1 U50 ( .A(bit_period[2]), .B(bit_period[1]), .C(bit_period[3]), .Y(
        n46) );
  NAND3X1 U51 ( .A(n53), .B(n14), .C(n54), .Y(n47) );
  NOR2X1 U52 ( .A(bit_period[6]), .B(bit_period[5]), .Y(n54) );
  INVX1 U53 ( .A(bit_period[7]), .Y(n14) );
  NOR2X1 U54 ( .A(bit_period[9]), .B(bit_period[8]), .Y(n53) );
  NAND3X1 U55 ( .A(n28), .B(n55), .C(n17), .Y(n35) );
  NOR2X1 U56 ( .A(count[13]), .B(count[12]), .Y(n17) );
  INVX1 U57 ( .A(count[11]), .Y(n55) );
  INVX1 U58 ( .A(count[10]), .Y(n28) );
  INVX1 U59 ( .A(enable_timer), .Y(n57) );
  XOR2X1 U60 ( .A(data_size[3]), .B(n56), .Y(\_2_net_[3] ) );
  AND2X1 U61 ( .A(data_size[1]), .B(data_size[2]), .Y(n56) );
  XNOR2X1 U62 ( .A(data_size[2]), .B(n58), .Y(\_2_net_[2] ) );
  INVX1 U63 ( .A(data_size[1]), .Y(n58) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n20, n21, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [2:0] state;

  DFFSR \state_reg[0]  ( .D(n21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR \state_reg[1]  ( .D(enable_timer), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  INVX1 U6 ( .A(n4), .Y(sbc_enable) );
  NOR2X1 U7 ( .A(n5), .B(n6), .Y(n21) );
  OAI21X1 U8 ( .A(packet_done), .B(n7), .C(n8), .Y(n6) );
  MUX2X1 U9 ( .B(n9), .A(n10), .S(state[2]), .Y(n5) );
  NOR2X1 U10 ( .A(state[1]), .B(framing_error), .Y(n10) );
  OR2X1 U11 ( .A(state[1]), .B(start_bit_detected), .Y(n9) );
  OAI21X1 U12 ( .A(n11), .B(n12), .C(n4), .Y(n20) );
  NAND3X1 U13 ( .A(state[0]), .B(n13), .C(state[1]), .Y(n4) );
  NAND2X1 U14 ( .A(state[2]), .B(n14), .Y(n12) );
  OR2X1 U15 ( .A(framing_error), .B(state[1]), .Y(n11) );
  NOR2X1 U16 ( .A(n14), .B(n13), .Y(load_buffer) );
  NAND2X1 U17 ( .A(n15), .B(n7), .Y(enable_timer) );
  NAND3X1 U18 ( .A(n8), .B(n13), .C(state[1]), .Y(n7) );
  INVX1 U19 ( .A(state[2]), .Y(n13) );
  INVX1 U20 ( .A(sbc_clear), .Y(n15) );
  NOR2X1 U21 ( .A(n14), .B(state[2]), .Y(sbc_clear) );
  OR2X1 U22 ( .A(n8), .B(state[1]), .Y(n14) );
  INVX1 U23 ( .A(state[0]), .Y(n8) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, bit_period, data_size, 
        rx_data, data_ready, overrun_error, framing_error );
  input [13:0] bit_period;
  input [3:0] data_size;
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   shift_strobe, stop_bit, load_buffer, start_bit_detected, sbc_clear,
         sbc_enable, enable_timer, packet_done;
  wire   [7:0] packet_data;

  sr_9bit sr_in ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  rx_data_buff rx ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  start_bit_det startdet ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start_bit_detected) );
  stop_bit_chk stopchk ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  timer TCU ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .bit_period(bit_period), .data_size(data_size), .shift_enable(
        shift_strobe), .packet_done(packet_done) );
  rcu RCU ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start_bit_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, penable, pwrite, paddr, 
        pwdata, pslverr, prdata );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [13:0] bit_period;
  wire   [3:0] data_size;

  apb_slave apb_inter ( .clk(clk), .n_rst(n_rst), .data_ready(data_ready), 
        .overrun_error(overrun_error), .framing_error(framing_error), .psel(
        psel), .penable(penable), .pwrite(pwrite), .paddr(paddr), .rx_data(
        rx_data), .pwdata(pwdata), .data_read(data_read), .pslverr(pslverr), 
        .prdata(prdata), .data_size(data_size), .bit_period(bit_period) );
  rcv_block uart ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .data_read(data_read), .bit_period(bit_period), .data_size(data_size), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
endmodule

