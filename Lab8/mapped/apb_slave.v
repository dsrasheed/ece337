/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Oct 19 13:07:41 2020
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
  wire   \data_status[0] , n79, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282;
  wire   [7:0] nxt_data;
  wire   [7:6] bit_period_msb;
  wire   [7:4] data_size_reg;
  wire   [7:0] nxt_prdata;
  wire   [7:0] error_status;
  wire   [7:0] data;

  DFFSR data_read_reg ( .D(n79), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data_read)
         );
  DFFSR \data_status_reg[0]  ( .D(data_ready), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\data_status[0] ) );
  DFFSR \error_status_reg[1]  ( .D(overrun_error), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(error_status[1]) );
  DFFSR \error_status_reg[0]  ( .D(framing_error), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(error_status[0]) );
  DFFSR \bit_period_msb_reg[7]  ( .D(n176), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period_msb[7]) );
  DFFSR \bit_period_msb_reg[6]  ( .D(n177), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period_msb[6]) );
  DFFSR \bit_period_msb_reg[5]  ( .D(n178), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[13]) );
  DFFSR \bit_period_msb_reg[4]  ( .D(n179), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[12]) );
  DFFSR \bit_period_msb_reg[3]  ( .D(n180), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[11]) );
  DFFSR \bit_period_msb_reg[2]  ( .D(n181), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[10]) );
  DFFSR \bit_period_msb_reg[1]  ( .D(n182), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[9]) );
  DFFSR \bit_period_msb_reg[0]  ( .D(n183), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[8]) );
  DFFSR \bit_period_lsb_reg[7]  ( .D(n168), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[7]) );
  DFFSR \bit_period_lsb_reg[6]  ( .D(n169), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[6]) );
  DFFSR \bit_period_lsb_reg[5]  ( .D(n170), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[5]) );
  DFFSR \bit_period_lsb_reg[4]  ( .D(n171), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[4]) );
  DFFSR \bit_period_lsb_reg[3]  ( .D(n172), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[3]) );
  DFFSR \bit_period_lsb_reg[2]  ( .D(n173), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[2]) );
  DFFSR \bit_period_lsb_reg[1]  ( .D(n174), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[1]) );
  DFFSR \bit_period_lsb_reg[0]  ( .D(n175), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[0]) );
  DFFSR \data_size_reg_reg[7]  ( .D(n160), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size_reg[7]) );
  DFFSR \data_size_reg_reg[6]  ( .D(n161), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size_reg[6]) );
  DFFSR \data_size_reg_reg[5]  ( .D(n162), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size_reg[5]) );
  DFFSR \data_size_reg_reg[4]  ( .D(n163), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size_reg[4]) );
  DFFSR \data_size_reg_reg[3]  ( .D(n164), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \data_size_reg_reg[2]  ( .D(n165), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \data_size_reg_reg[1]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[1]) );
  DFFSR \data_size_reg_reg[0]  ( .D(n167), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
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
  AND2X1 U216 ( .A(penable), .B(n184), .Y(pslverr) );
  OAI21X1 U217 ( .A(n185), .B(n186), .C(n187), .Y(n184) );
  NAND3X1 U218 ( .A(paddr[0]), .B(n188), .C(paddr[2]), .Y(n187) );
  OAI21X1 U219 ( .A(n189), .B(n190), .C(n191), .Y(nxt_prdata[7]) );
  NAND2X1 U220 ( .A(data[7]), .B(n79), .Y(n191) );
  AOI21X1 U221 ( .A(data_size_reg[7]), .B(n185), .C(n192), .Y(n189) );
  OAI22X1 U222 ( .A(n193), .B(n194), .C(n195), .D(n196), .Y(n192) );
  OAI21X1 U223 ( .A(n197), .B(n190), .C(n198), .Y(nxt_prdata[6]) );
  NAND2X1 U224 ( .A(data[6]), .B(n79), .Y(n198) );
  AOI21X1 U225 ( .A(data_size_reg[6]), .B(n185), .C(n199), .Y(n197) );
  OAI22X1 U226 ( .A(n193), .B(n200), .C(n195), .D(n201), .Y(n199) );
  OAI21X1 U227 ( .A(n202), .B(n190), .C(n203), .Y(nxt_prdata[5]) );
  NAND2X1 U228 ( .A(data[5]), .B(n79), .Y(n203) );
  AOI21X1 U229 ( .A(data_size_reg[5]), .B(n185), .C(n204), .Y(n202) );
  OAI22X1 U230 ( .A(n193), .B(n205), .C(n195), .D(n206), .Y(n204) );
  OAI21X1 U231 ( .A(n207), .B(n190), .C(n208), .Y(nxt_prdata[4]) );
  NAND2X1 U232 ( .A(data[4]), .B(n79), .Y(n208) );
  AOI21X1 U233 ( .A(data_size_reg[4]), .B(n185), .C(n209), .Y(n207) );
  OAI22X1 U234 ( .A(n193), .B(n210), .C(n195), .D(n211), .Y(n209) );
  OAI21X1 U235 ( .A(n212), .B(n190), .C(n213), .Y(nxt_prdata[3]) );
  NAND2X1 U236 ( .A(data[3]), .B(n79), .Y(n213) );
  AOI21X1 U237 ( .A(data_size[3]), .B(n185), .C(n214), .Y(n212) );
  OAI22X1 U238 ( .A(n193), .B(n215), .C(n195), .D(n216), .Y(n214) );
  OAI21X1 U239 ( .A(n217), .B(n190), .C(n218), .Y(nxt_prdata[2]) );
  NAND2X1 U240 ( .A(data[2]), .B(n79), .Y(n218) );
  AOI21X1 U241 ( .A(data_size[2]), .B(n185), .C(n219), .Y(n217) );
  OAI22X1 U242 ( .A(n193), .B(n220), .C(n195), .D(n221), .Y(n219) );
  INVX1 U243 ( .A(n222), .Y(n185) );
  OAI21X1 U244 ( .A(n223), .B(n224), .C(n225), .Y(nxt_prdata[1]) );
  OAI21X1 U245 ( .A(n226), .B(n227), .C(n188), .Y(n225) );
  OAI22X1 U246 ( .A(n222), .B(n228), .C(n193), .D(n229), .Y(n227) );
  OAI21X1 U247 ( .A(n195), .B(n230), .C(n231), .Y(n226) );
  NAND3X1 U248 ( .A(error_status[1]), .B(paddr[0]), .C(n232), .Y(n231) );
  NOR2X1 U249 ( .A(paddr[2]), .B(paddr[1]), .Y(n232) );
  INVX1 U250 ( .A(data[1]), .Y(n224) );
  OAI21X1 U251 ( .A(n223), .B(n233), .C(n234), .Y(nxt_prdata[0]) );
  OAI21X1 U252 ( .A(n235), .B(n236), .C(n188), .Y(n234) );
  OAI22X1 U253 ( .A(n222), .B(n237), .C(n193), .D(n238), .Y(n236) );
  OAI22X1 U254 ( .A(n195), .B(n239), .C(n240), .D(n241), .Y(n235) );
  NAND2X1 U255 ( .A(n242), .B(n243), .Y(n241) );
  MUX2X1 U256 ( .B(\data_status[0] ), .A(error_status[0]), .S(paddr[0]), .Y(
        n240) );
  INVX1 U257 ( .A(data[0]), .Y(n233) );
  NOR2X1 U258 ( .A(n244), .B(n245), .Y(nxt_data[7]) );
  OAI22X1 U259 ( .A(n245), .B(n246), .C(n244), .D(n247), .Y(nxt_data[6]) );
  OAI22X1 U260 ( .A(n247), .B(n246), .C(n244), .D(n248), .Y(nxt_data[5]) );
  OAI21X1 U261 ( .A(n245), .B(n249), .C(n250), .Y(nxt_data[4]) );
  AOI22X1 U262 ( .A(rx_data[4]), .B(n251), .C(rx_data[5]), .D(n252), .Y(n250)
         );
  INVX1 U263 ( .A(rx_data[7]), .Y(n245) );
  OAI21X1 U264 ( .A(n247), .B(n249), .C(n253), .Y(nxt_data[3]) );
  AOI22X1 U265 ( .A(rx_data[3]), .B(n251), .C(rx_data[4]), .D(n252), .Y(n253)
         );
  INVX1 U266 ( .A(rx_data[6]), .Y(n247) );
  OAI21X1 U267 ( .A(n248), .B(n249), .C(n254), .Y(nxt_data[2]) );
  AOI22X1 U268 ( .A(rx_data[2]), .B(n251), .C(rx_data[3]), .D(n252), .Y(n254)
         );
  INVX1 U269 ( .A(rx_data[5]), .Y(n248) );
  OAI21X1 U270 ( .A(n255), .B(n249), .C(n256), .Y(nxt_data[1]) );
  AOI22X1 U271 ( .A(rx_data[1]), .B(n251), .C(rx_data[2]), .D(n252), .Y(n256)
         );
  INVX1 U272 ( .A(rx_data[4]), .Y(n255) );
  OAI21X1 U273 ( .A(n249), .B(n257), .C(n258), .Y(nxt_data[0]) );
  AOI22X1 U274 ( .A(rx_data[0]), .B(n251), .C(rx_data[1]), .D(n252), .Y(n258)
         );
  INVX1 U275 ( .A(n246), .Y(n252) );
  INVX1 U276 ( .A(n244), .Y(n251) );
  NAND2X1 U277 ( .A(n249), .B(n246), .Y(n244) );
  NAND3X1 U278 ( .A(data_size[0]), .B(data_size[1]), .C(n259), .Y(n246) );
  NOR2X1 U279 ( .A(data_size[3]), .B(n260), .Y(n259) );
  INVX1 U280 ( .A(rx_data[3]), .Y(n257) );
  NAND3X1 U281 ( .A(data_size[0]), .B(data_size[2]), .C(n261), .Y(n249) );
  NOR2X1 U282 ( .A(data_size[3]), .B(data_size[1]), .Y(n261) );
  INVX1 U283 ( .A(n223), .Y(n79) );
  NAND3X1 U284 ( .A(n188), .B(n262), .C(n263), .Y(n223) );
  NOR2X1 U285 ( .A(n243), .B(n242), .Y(n263) );
  INVX1 U286 ( .A(n190), .Y(n188) );
  NAND2X1 U287 ( .A(psel), .B(n264), .Y(n190) );
  INVX1 U288 ( .A(pwrite), .Y(n264) );
  MUX2X1 U289 ( .B(n239), .A(n265), .S(n266), .Y(n183) );
  INVX1 U290 ( .A(bit_period[8]), .Y(n239) );
  MUX2X1 U291 ( .B(n230), .A(n267), .S(n266), .Y(n182) );
  INVX1 U292 ( .A(bit_period[9]), .Y(n230) );
  MUX2X1 U293 ( .B(n221), .A(n268), .S(n266), .Y(n181) );
  INVX1 U294 ( .A(bit_period[10]), .Y(n221) );
  MUX2X1 U295 ( .B(n216), .A(n269), .S(n266), .Y(n180) );
  INVX1 U296 ( .A(bit_period[11]), .Y(n216) );
  MUX2X1 U297 ( .B(n211), .A(n270), .S(n266), .Y(n179) );
  INVX1 U298 ( .A(bit_period[12]), .Y(n211) );
  MUX2X1 U299 ( .B(n206), .A(n271), .S(n266), .Y(n178) );
  INVX1 U300 ( .A(bit_period[13]), .Y(n206) );
  MUX2X1 U301 ( .B(n201), .A(n272), .S(n266), .Y(n177) );
  INVX1 U302 ( .A(bit_period_msb[6]), .Y(n201) );
  MUX2X1 U303 ( .B(n196), .A(n273), .S(n266), .Y(n176) );
  NOR2X1 U304 ( .A(n195), .B(n274), .Y(n266) );
  INVX1 U305 ( .A(bit_period_msb[7]), .Y(n196) );
  MUX2X1 U306 ( .B(n238), .A(n265), .S(n275), .Y(n175) );
  INVX1 U307 ( .A(bit_period[0]), .Y(n238) );
  MUX2X1 U308 ( .B(n229), .A(n267), .S(n275), .Y(n174) );
  INVX1 U309 ( .A(bit_period[1]), .Y(n229) );
  MUX2X1 U310 ( .B(n220), .A(n268), .S(n275), .Y(n173) );
  INVX1 U311 ( .A(bit_period[2]), .Y(n220) );
  MUX2X1 U312 ( .B(n215), .A(n269), .S(n275), .Y(n172) );
  INVX1 U313 ( .A(bit_period[3]), .Y(n215) );
  MUX2X1 U314 ( .B(n210), .A(n270), .S(n275), .Y(n171) );
  INVX1 U315 ( .A(bit_period[4]), .Y(n210) );
  MUX2X1 U316 ( .B(n205), .A(n271), .S(n275), .Y(n170) );
  INVX1 U317 ( .A(bit_period[5]), .Y(n205) );
  MUX2X1 U318 ( .B(n200), .A(n272), .S(n275), .Y(n169) );
  INVX1 U319 ( .A(bit_period[6]), .Y(n200) );
  MUX2X1 U320 ( .B(n194), .A(n273), .S(n275), .Y(n168) );
  NOR2X1 U321 ( .A(n193), .B(n274), .Y(n275) );
  INVX1 U322 ( .A(bit_period[7]), .Y(n194) );
  MUX2X1 U323 ( .B(n237), .A(n265), .S(n276), .Y(n167) );
  INVX1 U324 ( .A(pwdata[0]), .Y(n265) );
  INVX1 U325 ( .A(data_size[0]), .Y(n237) );
  MUX2X1 U326 ( .B(n228), .A(n267), .S(n276), .Y(n166) );
  INVX1 U327 ( .A(pwdata[1]), .Y(n267) );
  INVX1 U328 ( .A(data_size[1]), .Y(n228) );
  MUX2X1 U329 ( .B(n260), .A(n268), .S(n276), .Y(n165) );
  INVX1 U330 ( .A(pwdata[2]), .Y(n268) );
  INVX1 U331 ( .A(data_size[2]), .Y(n260) );
  MUX2X1 U332 ( .B(n277), .A(n269), .S(n276), .Y(n164) );
  INVX1 U333 ( .A(pwdata[3]), .Y(n269) );
  INVX1 U334 ( .A(data_size[3]), .Y(n277) );
  MUX2X1 U335 ( .B(n278), .A(n270), .S(n276), .Y(n163) );
  INVX1 U336 ( .A(pwdata[4]), .Y(n270) );
  INVX1 U337 ( .A(data_size_reg[4]), .Y(n278) );
  MUX2X1 U338 ( .B(n279), .A(n271), .S(n276), .Y(n162) );
  INVX1 U339 ( .A(pwdata[5]), .Y(n271) );
  INVX1 U340 ( .A(data_size_reg[5]), .Y(n279) );
  MUX2X1 U341 ( .B(n280), .A(n272), .S(n276), .Y(n161) );
  INVX1 U342 ( .A(pwdata[6]), .Y(n272) );
  INVX1 U343 ( .A(data_size_reg[6]), .Y(n280) );
  MUX2X1 U344 ( .B(n281), .A(n273), .S(n276), .Y(n160) );
  NOR2X1 U345 ( .A(n222), .B(n186), .Y(n276) );
  NAND3X1 U346 ( .A(n195), .B(n193), .C(n282), .Y(n186) );
  INVX1 U347 ( .A(n274), .Y(n282) );
  NAND2X1 U348 ( .A(pwrite), .B(psel), .Y(n274) );
  NAND3X1 U349 ( .A(n262), .B(n243), .C(paddr[1]), .Y(n193) );
  NAND3X1 U350 ( .A(paddr[0]), .B(n243), .C(paddr[1]), .Y(n195) );
  INVX1 U351 ( .A(paddr[2]), .Y(n243) );
  NAND3X1 U352 ( .A(n262), .B(n242), .C(paddr[2]), .Y(n222) );
  INVX1 U353 ( .A(paddr[1]), .Y(n242) );
  INVX1 U354 ( .A(paddr[0]), .Y(n262) );
  INVX1 U355 ( .A(pwdata[7]), .Y(n273) );
  INVX1 U356 ( .A(data_size_reg[7]), .Y(n281) );
endmodule

