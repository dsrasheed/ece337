/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Dec  5 19:20:42 2020
/////////////////////////////////////////////////////////////


module rcu ( clk, n_rst, d_edge, eop, shift_enable, byte_received, rcv_data, 
        pid_reset, pid_save, rcving, r_error, w_enable );
  input [7:0] rcv_data;
  input clk, n_rst, d_edge, eop, shift_enable, byte_received;
  output pid_reset, pid_save, rcving, r_error, w_enable;
  wire   n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261;
  wire   [4:0] state;

  DFFSR \state_reg[0]  ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(n133), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(n132), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(n134), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  INVX1 U142 ( .A(n136), .Y(w_enable) );
  OAI21X1 U143 ( .A(n137), .B(n138), .C(n139), .Y(rcving) );
  MUX2X1 U144 ( .B(n140), .A(n141), .S(state[3]), .Y(n139) );
  NOR2X1 U145 ( .A(state[2]), .B(n142), .Y(n140) );
  OAI21X1 U146 ( .A(state[4]), .B(n143), .C(n144), .Y(r_error) );
  NOR2X1 U147 ( .A(n138), .B(n145), .Y(pid_save) );
  NAND2X1 U148 ( .A(state[3]), .B(n146), .Y(n145) );
  OAI21X1 U149 ( .A(n147), .B(n148), .C(n149), .Y(n135) );
  OAI21X1 U150 ( .A(n150), .B(n151), .C(n152), .Y(n149) );
  OR2X1 U151 ( .A(n153), .B(n154), .Y(n151) );
  OAI21X1 U152 ( .A(n138), .B(n155), .C(n156), .Y(n154) );
  OAI21X1 U153 ( .A(n157), .B(n158), .C(n159), .Y(n153) );
  AOI21X1 U154 ( .A(n160), .B(n161), .C(n162), .Y(n159) );
  NAND3X1 U155 ( .A(n163), .B(n136), .C(n164), .Y(n150) );
  NOR2X1 U156 ( .A(n165), .B(n166), .Y(n164) );
  AND2X1 U157 ( .A(n167), .B(n144), .Y(n163) );
  OAI21X1 U158 ( .A(n147), .B(n137), .C(n168), .Y(n134) );
  OAI21X1 U159 ( .A(n169), .B(n170), .C(n152), .Y(n168) );
  NAND3X1 U160 ( .A(n171), .B(n157), .C(n172), .Y(n170) );
  INVX1 U161 ( .A(n173), .Y(n171) );
  NAND2X1 U162 ( .A(n174), .B(n156), .Y(n169) );
  AOI22X1 U163 ( .A(n175), .B(n176), .C(byte_received), .D(pid_reset), .Y(n174) );
  OAI21X1 U164 ( .A(n147), .B(n177), .C(n178), .Y(n133) );
  AOI22X1 U165 ( .A(n179), .B(n158), .C(n152), .D(n180), .Y(n178) );
  NAND3X1 U166 ( .A(n181), .B(n182), .C(n183), .Y(n180) );
  NOR2X1 U167 ( .A(n184), .B(n185), .Y(n183) );
  NAND2X1 U168 ( .A(n172), .B(n156), .Y(n185) );
  INVX1 U169 ( .A(n186), .Y(n156) );
  OAI21X1 U170 ( .A(n138), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U171 ( .A(n189), .B(n190), .Y(n188) );
  INVX1 U172 ( .A(n191), .Y(n189) );
  OAI21X1 U173 ( .A(n192), .B(n193), .C(n161), .Y(n191) );
  AOI22X1 U174 ( .A(n161), .B(n165), .C(n194), .D(n193), .Y(n172) );
  OAI22X1 U175 ( .A(n195), .B(n196), .C(n197), .D(n198), .Y(n184) );
  OAI21X1 U176 ( .A(n199), .B(n200), .C(pid_reset), .Y(n198) );
  NAND3X1 U177 ( .A(rcv_data[7]), .B(n201), .C(n202), .Y(n200) );
  NOR2X1 U178 ( .A(rcv_data[2]), .B(rcv_data[1]), .Y(n202) );
  NAND3X1 U179 ( .A(n203), .B(n204), .C(n205), .Y(n199) );
  NOR2X1 U180 ( .A(rcv_data[6]), .B(rcv_data[5]), .Y(n205) );
  INVX1 U181 ( .A(rcv_data[3]), .Y(n203) );
  AND2X1 U182 ( .A(n143), .B(n206), .Y(n182) );
  AOI22X1 U183 ( .A(n207), .B(n158), .C(n161), .D(n173), .Y(n181) );
  NAND2X1 U184 ( .A(n208), .B(n209), .Y(n173) );
  INVX1 U185 ( .A(n210), .Y(n207) );
  INVX1 U186 ( .A(n211), .Y(n179) );
  OAI21X1 U187 ( .A(n208), .B(n197), .C(n212), .Y(n132) );
  AOI22X1 U188 ( .A(n176), .B(n213), .C(state[3]), .D(n214), .Y(n212) );
  OAI21X1 U189 ( .A(n215), .B(n216), .C(n175), .Y(n213) );
  NOR2X1 U190 ( .A(n217), .B(n195), .Y(n175) );
  INVX1 U191 ( .A(n218), .Y(n195) );
  NAND3X1 U192 ( .A(n219), .B(n220), .C(n221), .Y(n218) );
  NOR2X1 U193 ( .A(n201), .B(n222), .Y(n221) );
  INVX1 U194 ( .A(rcv_data[0]), .Y(n201) );
  NOR2X1 U195 ( .A(rcv_data[4]), .B(rcv_data[1]), .Y(n219) );
  INVX1 U196 ( .A(n223), .Y(n217) );
  NAND3X1 U197 ( .A(n224), .B(n220), .C(n225), .Y(n223) );
  AND2X1 U198 ( .A(rcv_data[1]), .B(rcv_data[4]), .Y(n225) );
  NOR2X1 U199 ( .A(rcv_data[5]), .B(rcv_data[0]), .Y(n224) );
  NAND2X1 U200 ( .A(rcv_data[0]), .B(rcv_data[1]), .Y(n216) );
  NAND3X1 U201 ( .A(n204), .B(n222), .C(n220), .Y(n215) );
  XOR2X1 U202 ( .A(rcv_data[3]), .B(rcv_data[7]), .Y(n220) );
  INVX1 U203 ( .A(rcv_data[5]), .Y(n222) );
  INVX1 U204 ( .A(rcv_data[4]), .Y(n204) );
  INVX1 U205 ( .A(n196), .Y(n176) );
  NAND3X1 U206 ( .A(n226), .B(n193), .C(byte_received), .Y(n196) );
  INVX1 U207 ( .A(n227), .Y(n193) );
  INVX1 U208 ( .A(n194), .Y(n226) );
  NAND2X1 U209 ( .A(rcv_data[6]), .B(n228), .Y(n194) );
  INVX1 U210 ( .A(rcv_data[2]), .Y(n228) );
  OR2X1 U211 ( .A(n229), .B(n230), .Y(n131) );
  OAI22X1 U212 ( .A(n231), .B(n197), .C(n147), .D(n141), .Y(n230) );
  INVX1 U213 ( .A(n214), .Y(n147) );
  NAND2X1 U214 ( .A(n232), .B(n152), .Y(n214) );
  AOI21X1 U215 ( .A(n158), .B(n233), .C(n234), .Y(n152) );
  INVX1 U216 ( .A(n235), .Y(n234) );
  AOI21X1 U217 ( .A(n236), .B(n237), .C(n238), .Y(n235) );
  AOI21X1 U218 ( .A(n239), .B(n167), .C(d_edge), .Y(n238) );
  NAND2X1 U219 ( .A(n240), .B(n142), .Y(n167) );
  NOR2X1 U220 ( .A(byte_received), .B(n161), .Y(n236) );
  NOR2X1 U221 ( .A(n158), .B(byte_received), .Y(n161) );
  OAI21X1 U222 ( .A(shift_enable), .B(n157), .C(n241), .Y(n233) );
  NOR2X1 U223 ( .A(n190), .B(n242), .Y(n241) );
  INVX1 U224 ( .A(n206), .Y(n242) );
  NOR2X1 U225 ( .A(n143), .B(n138), .Y(n190) );
  NAND2X1 U226 ( .A(n243), .B(state[1]), .Y(n143) );
  INVX1 U227 ( .A(n244), .Y(n157) );
  INVX1 U228 ( .A(eop), .Y(n158) );
  MUX2X1 U229 ( .B(n245), .A(n197), .S(pid_reset), .Y(n232) );
  NOR2X1 U230 ( .A(n246), .B(n247), .Y(pid_reset) );
  NOR2X1 U231 ( .A(n248), .B(n249), .Y(n245) );
  OR2X1 U232 ( .A(n237), .B(n244), .Y(n249) );
  NAND3X1 U233 ( .A(n210), .B(n250), .C(n211), .Y(n244) );
  NAND3X1 U234 ( .A(n251), .B(state[2]), .C(n252), .Y(n211) );
  NAND3X1 U235 ( .A(state[3]), .B(n253), .C(n251), .Y(n210) );
  NAND3X1 U236 ( .A(n231), .B(n227), .C(n208), .Y(n237) );
  NOR2X1 U237 ( .A(n160), .B(n162), .Y(n208) );
  INVX1 U238 ( .A(n254), .Y(n162) );
  NAND3X1 U239 ( .A(state[3]), .B(n253), .C(n142), .Y(n254) );
  INVX1 U240 ( .A(n146), .Y(n253) );
  INVX1 U241 ( .A(n255), .Y(n160) );
  NAND3X1 U242 ( .A(n251), .B(n177), .C(n252), .Y(n255) );
  INVX1 U243 ( .A(n155), .Y(n252) );
  NAND2X1 U244 ( .A(state[3]), .B(n137), .Y(n155) );
  NAND2X1 U245 ( .A(n142), .B(n256), .Y(n227) );
  NAND3X1 U246 ( .A(n206), .B(n136), .C(n239), .Y(n248) );
  INVX1 U247 ( .A(n257), .Y(n239) );
  OAI21X1 U248 ( .A(n258), .B(n259), .C(n144), .Y(n257) );
  NAND2X1 U249 ( .A(n251), .B(n243), .Y(n144) );
  INVX1 U250 ( .A(n258), .Y(n243) );
  NAND2X1 U251 ( .A(n142), .B(n137), .Y(n259) );
  INVX1 U252 ( .A(n138), .Y(n142) );
  NAND2X1 U253 ( .A(n148), .B(n141), .Y(n138) );
  NAND2X1 U254 ( .A(state[2]), .B(n260), .Y(n258) );
  NAND2X1 U255 ( .A(n251), .B(n256), .Y(n206) );
  INVX1 U256 ( .A(n247), .Y(n251) );
  INVX1 U257 ( .A(byte_received), .Y(n197) );
  NOR3X1 U258 ( .A(n165), .B(n192), .C(n166), .Y(n231) );
  INVX1 U259 ( .A(n209), .Y(n166) );
  NAND3X1 U260 ( .A(n256), .B(n148), .C(state[4]), .Y(n209) );
  NOR2X1 U261 ( .A(n187), .B(n247), .Y(n192) );
  NAND2X1 U262 ( .A(state[0]), .B(n141), .Y(n247) );
  INVX1 U263 ( .A(state[4]), .Y(n141) );
  NAND3X1 U264 ( .A(state[3]), .B(state[1]), .C(state[2]), .Y(n187) );
  INVX1 U265 ( .A(n261), .Y(n165) );
  NAND3X1 U266 ( .A(state[4]), .B(n148), .C(n240), .Y(n261) );
  INVX1 U267 ( .A(state[0]), .Y(n148) );
  OAI21X1 U268 ( .A(eop), .B(n250), .C(n136), .Y(n229) );
  NAND3X1 U269 ( .A(state[0]), .B(n256), .C(state[4]), .Y(n136) );
  NOR2X1 U270 ( .A(n146), .B(state[3]), .Y(n256) );
  NAND2X1 U271 ( .A(state[1]), .B(n177), .Y(n146) );
  NAND3X1 U272 ( .A(state[4]), .B(state[0]), .C(n240), .Y(n250) );
  INVX1 U273 ( .A(n246), .Y(n240) );
  NAND3X1 U274 ( .A(n177), .B(n260), .C(n137), .Y(n246) );
  INVX1 U275 ( .A(state[1]), .Y(n137) );
  INVX1 U276 ( .A(state[3]), .Y(n260) );
  INVX1 U277 ( .A(state[2]), .Y(n177) );
endmodule

