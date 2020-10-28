/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Oct 27 17:05:54 2020
/////////////////////////////////////////////////////////////


module ahb_lite_slave ( clk, n_rst, data_ready, sample_data, 
        new_coefficient_set, fir_coefficient, coefficient_num, modwait, 
        fir_out, err, hsel, haddr, hsize, htrans, hwrite, hwdata, hrdata, 
        hresp );
  output [15:0] sample_data;
  output [15:0] fir_coefficient;
  input [1:0] coefficient_num;
  input [15:0] fir_out;
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, modwait, err, hsel, hsize, hwrite;
  output data_ready, new_coefficient_set, hresp;
  wire   N66, \nxt_status[0] , n350, n352, n354, n356, n358, n360, n362, n364,
         n366, n368, n370, n372, n374, n376, n378, n380, n382, n384, n386,
         n388, n390, n392, n394, n396, n398, n400, n402, n404, n406, n408,
         n410, n412, n414, n416, n418, n420, n422, n424, n426, n428, n430,
         n432, n434, n436, n438, n440, n442, n444, n446, n448, n450, n452,
         n454, n456, n458, n460, n462, n464, n466, n468, n470, n472, n474,
         n476, n478, n480, n482, n484, n486, n488, n490, n492, n494, n496,
         n498, n500, n502, n504, n506, n508, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739,
         n740, n741, n742, n743, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n757, n758, n759, n760, n761,
         n762, n763, n764, n765, n766, n767, n768, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n816,
         n817, n818, n819, n820, n821, n822, n823, n824, n825, n826, n827,
         n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, n838,
         n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         n872, n873, n874, n875, n876, n877, n878, n879, n880, n881;
  wire   [5:0] wsel_even;
  wire   [4:0] wsel_odd;
  wire   [5:0] delay_wsel_even;
  wire   [4:0] delay_wsel_odd;
  wire   [15:0] status;
  wire   [15:0] result;
  wire   [15:0] F0;
  wire   [15:0] F1;
  wire   [15:0] F2;
  wire   [15:0] F3;
  wire   [7:1] new_coeff_confirm;
  assign N66 = haddr[1];

  DFFSR \delay_wsel_odd_reg[4]  ( .D(wsel_odd[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_odd[4]) );
  DFFSR \delay_wsel_odd_reg[3]  ( .D(wsel_odd[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_odd[3]) );
  DFFSR \delay_wsel_odd_reg[2]  ( .D(wsel_odd[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_odd[2]) );
  DFFSR \delay_wsel_odd_reg[1]  ( .D(wsel_odd[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_odd[1]) );
  DFFSR \delay_wsel_odd_reg[0]  ( .D(wsel_odd[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_odd[0]) );
  DFFSR \delay_wsel_even_reg[5]  ( .D(wsel_even[5]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_even[5]) );
  DFFSR \delay_wsel_even_reg[4]  ( .D(wsel_even[4]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_even[4]) );
  DFFSR \delay_wsel_even_reg[3]  ( .D(wsel_even[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_even[3]) );
  DFFSR \delay_wsel_even_reg[2]  ( .D(wsel_even[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_even[2]) );
  DFFSR \delay_wsel_even_reg[1]  ( .D(wsel_even[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_even[1]) );
  DFFSR \delay_wsel_even_reg[0]  ( .D(wsel_even[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(delay_wsel_even[0]) );
  DFFSR \status_reg[8]  ( .D(err), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        status[8]) );
  DFFSR \result_reg[15]  ( .D(fir_out[15]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(result[15]) );
  DFFSR \result_reg[14]  ( .D(fir_out[14]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(result[14]) );
  DFFSR \result_reg[13]  ( .D(fir_out[13]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(result[13]) );
  DFFSR \result_reg[12]  ( .D(fir_out[12]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(result[12]) );
  DFFSR \result_reg[11]  ( .D(fir_out[11]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(result[11]) );
  DFFSR \result_reg[10]  ( .D(fir_out[10]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(result[10]) );
  DFFSR \result_reg[9]  ( .D(fir_out[9]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[9]) );
  DFFSR \result_reg[8]  ( .D(fir_out[8]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[8]) );
  DFFSR \result_reg[7]  ( .D(fir_out[7]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[7]) );
  DFFSR \result_reg[6]  ( .D(fir_out[6]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[6]) );
  DFFSR \result_reg[5]  ( .D(fir_out[5]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[5]) );
  DFFSR \result_reg[4]  ( .D(fir_out[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[4]) );
  DFFSR \result_reg[3]  ( .D(fir_out[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[3]) );
  DFFSR \result_reg[2]  ( .D(fir_out[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[2]) );
  DFFSR \result_reg[1]  ( .D(fir_out[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[1]) );
  DFFSR \result_reg[0]  ( .D(fir_out[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        result[0]) );
  DFFSR \F3_reg[15]  ( .D(n508), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[15]) );
  DFFSR \F3_reg[14]  ( .D(n506), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[14]) );
  DFFSR \F3_reg[13]  ( .D(n504), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[13]) );
  DFFSR \F3_reg[12]  ( .D(n502), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[12]) );
  DFFSR \F3_reg[11]  ( .D(n500), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[11]) );
  DFFSR \F3_reg[10]  ( .D(n498), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[10]) );
  DFFSR \F3_reg[9]  ( .D(n496), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[9]) );
  DFFSR \F3_reg[8]  ( .D(n494), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[8]) );
  DFFSR \F3_reg[7]  ( .D(n492), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[7]) );
  DFFSR \F3_reg[6]  ( .D(n490), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[6]) );
  DFFSR \F3_reg[5]  ( .D(n488), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[5]) );
  DFFSR \F3_reg[4]  ( .D(n486), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[4]) );
  DFFSR \F3_reg[3]  ( .D(n484), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[3]) );
  DFFSR \F3_reg[2]  ( .D(n482), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[2]) );
  DFFSR \F3_reg[1]  ( .D(n480), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[1]) );
  DFFSR \F3_reg[0]  ( .D(n478), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F3[0]) );
  DFFSR \new_sample_reg[15]  ( .D(n476), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[15]) );
  DFFSR \new_sample_reg[14]  ( .D(n474), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[14]) );
  DFFSR \new_sample_reg[13]  ( .D(n472), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[13]) );
  DFFSR \new_sample_reg[12]  ( .D(n470), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[12]) );
  DFFSR \new_sample_reg[11]  ( .D(n468), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[11]) );
  DFFSR \new_sample_reg[10]  ( .D(n466), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[10]) );
  DFFSR \new_sample_reg[9]  ( .D(n464), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[9]) );
  DFFSR \new_sample_reg[8]  ( .D(n462), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[8]) );
  DFFSR \new_sample_reg[7]  ( .D(n460), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[7]) );
  DFFSR \new_sample_reg[6]  ( .D(n458), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[6]) );
  DFFSR \new_sample_reg[5]  ( .D(n456), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[5]) );
  DFFSR \new_sample_reg[4]  ( .D(n454), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[4]) );
  DFFSR \new_sample_reg[3]  ( .D(n452), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[3]) );
  DFFSR \new_sample_reg[2]  ( .D(n450), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[2]) );
  DFFSR \new_sample_reg[1]  ( .D(n448), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[1]) );
  DFFSR \new_sample_reg[0]  ( .D(n446), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[0]) );
  DFFSR \F0_reg[15]  ( .D(n444), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[15]) );
  DFFSR \F0_reg[14]  ( .D(n442), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[14]) );
  DFFSR \F0_reg[13]  ( .D(n440), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[13]) );
  DFFSR \F0_reg[12]  ( .D(n438), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[12]) );
  DFFSR \F0_reg[11]  ( .D(n436), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[11]) );
  DFFSR \F0_reg[10]  ( .D(n434), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[10]) );
  DFFSR \F0_reg[9]  ( .D(n432), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[9]) );
  DFFSR \F0_reg[8]  ( .D(n430), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[8]) );
  DFFSR \F0_reg[7]  ( .D(n428), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[7]) );
  DFFSR \F0_reg[6]  ( .D(n426), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[6]) );
  DFFSR \F0_reg[5]  ( .D(n424), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[5]) );
  DFFSR \F0_reg[4]  ( .D(n422), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[4]) );
  DFFSR \F0_reg[3]  ( .D(n420), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[3]) );
  DFFSR \F0_reg[2]  ( .D(n418), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[2]) );
  DFFSR \F0_reg[1]  ( .D(n416), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[1]) );
  DFFSR \F0_reg[0]  ( .D(n414), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F0[0]) );
  DFFSR \F1_reg[15]  ( .D(n412), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[15]) );
  DFFSR \F1_reg[14]  ( .D(n410), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[14]) );
  DFFSR \F1_reg[13]  ( .D(n408), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[13]) );
  DFFSR \F1_reg[12]  ( .D(n406), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[12]) );
  DFFSR \F1_reg[11]  ( .D(n404), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[11]) );
  DFFSR \F1_reg[10]  ( .D(n402), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[10]) );
  DFFSR \F1_reg[9]  ( .D(n400), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[9]) );
  DFFSR \F1_reg[8]  ( .D(n398), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[8]) );
  DFFSR \F1_reg[7]  ( .D(n396), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[7]) );
  DFFSR \F1_reg[6]  ( .D(n394), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[6]) );
  DFFSR \F1_reg[5]  ( .D(n392), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[5]) );
  DFFSR \F1_reg[4]  ( .D(n390), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[4]) );
  DFFSR \F1_reg[3]  ( .D(n388), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[3]) );
  DFFSR \F1_reg[2]  ( .D(n386), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[2]) );
  DFFSR \F1_reg[1]  ( .D(n384), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[1]) );
  DFFSR \F1_reg[0]  ( .D(n382), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F1[0]) );
  DFFSR \F2_reg[15]  ( .D(n380), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[15]) );
  DFFSR \F2_reg[14]  ( .D(n378), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[14]) );
  DFFSR \F2_reg[13]  ( .D(n376), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[13]) );
  DFFSR \F2_reg[12]  ( .D(n374), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[12]) );
  DFFSR \F2_reg[11]  ( .D(n372), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[11]) );
  DFFSR \F2_reg[10]  ( .D(n370), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[10]) );
  DFFSR \F2_reg[9]  ( .D(n368), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[9]) );
  DFFSR \F2_reg[8]  ( .D(n366), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[8]) );
  DFFSR \F2_reg[7]  ( .D(n364), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[7]) );
  DFFSR \F2_reg[6]  ( .D(n362), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[6]) );
  DFFSR \F2_reg[5]  ( .D(n360), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[5]) );
  DFFSR \F2_reg[4]  ( .D(n358), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[4]) );
  DFFSR \F2_reg[3]  ( .D(n356), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[3]) );
  DFFSR \F2_reg[2]  ( .D(n354), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[2]) );
  DFFSR \F2_reg[1]  ( .D(n352), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[1]) );
  DFFSR \F2_reg[0]  ( .D(n350), .CLK(clk), .R(n_rst), .S(1'b1), .Q(F2[0]) );
  DFFSR \new_coeff_confirm_reg[7]  ( .D(n561), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coeff_confirm[7]) );
  DFFSR \new_coeff_confirm_reg[6]  ( .D(n560), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coeff_confirm[6]) );
  DFFSR \new_coeff_confirm_reg[5]  ( .D(n559), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coeff_confirm[5]) );
  DFFSR \new_coeff_confirm_reg[4]  ( .D(n558), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coeff_confirm[4]) );
  DFFSR \new_coeff_confirm_reg[3]  ( .D(n557), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coeff_confirm[3]) );
  DFFSR \new_coeff_confirm_reg[2]  ( .D(n556), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coeff_confirm[2]) );
  DFFSR \new_coeff_confirm_reg[1]  ( .D(n555), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coeff_confirm[1]) );
  DFFSR \new_coeff_confirm_reg[0]  ( .D(n554), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coefficient_set) );
  DFFSR \status_reg[0]  ( .D(\nxt_status[0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(status[0]) );
  DFFSR data_ready_reg ( .D(n537), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR \hrdata_reg[15]  ( .D(n553), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[15]) );
  DFFSR \hrdata_reg[14]  ( .D(n552), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[14]) );
  DFFSR \hrdata_reg[13]  ( .D(n551), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[13]) );
  DFFSR \hrdata_reg[12]  ( .D(n550), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[12]) );
  DFFSR \hrdata_reg[11]  ( .D(n549), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[11]) );
  DFFSR \hrdata_reg[10]  ( .D(n548), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[10]) );
  DFFSR \hrdata_reg[9]  ( .D(n547), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[9]) );
  DFFSR \hrdata_reg[8]  ( .D(n546), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[8]) );
  DFFSR \hrdata_reg[7]  ( .D(n545), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[7]) );
  DFFSR \hrdata_reg[6]  ( .D(n544), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[6]) );
  DFFSR \hrdata_reg[5]  ( .D(n543), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[5]) );
  DFFSR \hrdata_reg[4]  ( .D(n542), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[4]) );
  DFFSR \hrdata_reg[3]  ( .D(n541), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[3]) );
  DFFSR \hrdata_reg[2]  ( .D(n540), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[2]) );
  DFFSR \hrdata_reg[1]  ( .D(n539), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[1]) );
  DFFSR \hrdata_reg[0]  ( .D(n538), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        hrdata[0]) );
  AND2X2 U589 ( .A(coefficient_num[0]), .B(n881), .Y(n849) );
  INVX2 U590 ( .A(n602), .Y(n847) );
  INVX2 U591 ( .A(n677), .Y(n616) );
  INVX2 U592 ( .A(n753), .Y(n611) );
  BUFX2 U593 ( .A(n848), .Y(n562) );
  INVX2 U594 ( .A(n675), .Y(n617) );
  INVX2 U595 ( .A(n751), .Y(n612) );
  BUFX2 U596 ( .A(n850), .Y(n563) );
  INVX2 U597 ( .A(n737), .Y(n581) );
  NOR2X1 U598 ( .A(n564), .B(n565), .Y(wsel_odd[4]) );
  NOR2X1 U599 ( .A(n566), .B(n567), .Y(wsel_odd[3]) );
  NAND2X1 U600 ( .A(n568), .B(n569), .Y(n567) );
  INVX1 U601 ( .A(n570), .Y(n568) );
  NOR2X1 U602 ( .A(n564), .B(n570), .Y(wsel_odd[2]) );
  NOR2X1 U603 ( .A(n571), .B(n572), .Y(wsel_odd[1]) );
  NAND2X1 U604 ( .A(N66), .B(n569), .Y(n572) );
  NOR2X1 U605 ( .A(n564), .B(n571), .Y(wsel_odd[0]) );
  NAND2X1 U606 ( .A(n566), .B(n569), .Y(n564) );
  NOR2X1 U607 ( .A(n565), .B(n573), .Y(wsel_even[5]) );
  NOR2X1 U608 ( .A(n565), .B(n574), .Y(wsel_even[4]) );
  NAND3X1 U609 ( .A(n575), .B(haddr[2]), .C(n576), .Y(n565) );
  INVX1 U610 ( .A(n577), .Y(n575) );
  NOR2X1 U611 ( .A(n570), .B(n573), .Y(wsel_even[3]) );
  NOR2X1 U612 ( .A(n570), .B(n574), .Y(wsel_even[2]) );
  NAND3X1 U613 ( .A(n577), .B(n578), .C(n576), .Y(n570) );
  NOR2X1 U614 ( .A(n571), .B(n573), .Y(wsel_even[1]) );
  NAND2X1 U615 ( .A(N66), .B(n579), .Y(n573) );
  NOR2X1 U616 ( .A(n571), .B(n574), .Y(wsel_even[0]) );
  NAND2X1 U617 ( .A(n566), .B(n579), .Y(n574) );
  NAND3X1 U618 ( .A(haddr[2]), .B(n577), .C(n576), .Y(n571) );
  INVX1 U619 ( .A(n580), .Y(n576) );
  NAND3X1 U620 ( .A(hsel), .B(n581), .C(hwrite), .Y(n580) );
  XNOR2X1 U621 ( .A(n582), .B(haddr[2]), .Y(n577) );
  NAND2X1 U622 ( .A(n583), .B(n584), .Y(\nxt_status[0] ) );
  OAI22X1 U623 ( .A(n585), .B(n586), .C(n587), .D(n588), .Y(n561) );
  OAI22X1 U624 ( .A(n585), .B(n589), .C(n587), .D(n590), .Y(n560) );
  OAI22X1 U625 ( .A(n585), .B(n591), .C(n587), .D(n592), .Y(n559) );
  OAI22X1 U626 ( .A(n585), .B(n593), .C(n587), .D(n594), .Y(n558) );
  OAI22X1 U627 ( .A(n585), .B(n595), .C(n587), .D(n596), .Y(n557) );
  OAI22X1 U628 ( .A(n585), .B(n597), .C(n587), .D(n598), .Y(n556) );
  OAI22X1 U629 ( .A(n585), .B(n599), .C(n587), .D(n600), .Y(n555) );
  OAI22X1 U630 ( .A(n585), .B(n601), .C(n587), .D(n583), .Y(n554) );
  INVX1 U631 ( .A(new_coefficient_set), .Y(n583) );
  OAI21X1 U632 ( .A(n602), .B(n584), .C(n585), .Y(n587) );
  INVX1 U633 ( .A(delay_wsel_even[5]), .Y(n585) );
  OAI21X1 U634 ( .A(n581), .B(n603), .C(n604), .Y(n553) );
  OAI21X1 U635 ( .A(n605), .B(n606), .C(n607), .Y(n604) );
  OAI21X1 U636 ( .A(n608), .B(n609), .C(n610), .Y(n606) );
  AOI22X1 U637 ( .A(F0[15]), .B(n611), .C(sample_data[15]), .D(n612), .Y(n610)
         );
  INVX1 U638 ( .A(result[15]), .Y(n609) );
  OAI21X1 U639 ( .A(n613), .B(n614), .C(n615), .Y(n605) );
  AOI22X1 U640 ( .A(F3[15]), .B(n616), .C(F2[15]), .D(n617), .Y(n615) );
  INVX1 U641 ( .A(hrdata[15]), .Y(n603) );
  OAI21X1 U642 ( .A(n581), .B(n618), .C(n619), .Y(n552) );
  OAI21X1 U643 ( .A(n620), .B(n621), .C(n607), .Y(n619) );
  OAI21X1 U644 ( .A(n608), .B(n622), .C(n623), .Y(n621) );
  AOI22X1 U645 ( .A(F0[14]), .B(n611), .C(sample_data[14]), .D(n612), .Y(n623)
         );
  INVX1 U646 ( .A(result[14]), .Y(n622) );
  OAI21X1 U647 ( .A(n613), .B(n624), .C(n625), .Y(n620) );
  AOI22X1 U648 ( .A(F3[14]), .B(n616), .C(F2[14]), .D(n617), .Y(n625) );
  INVX1 U649 ( .A(hrdata[14]), .Y(n618) );
  OAI21X1 U650 ( .A(n581), .B(n626), .C(n627), .Y(n551) );
  OAI21X1 U651 ( .A(n628), .B(n629), .C(n607), .Y(n627) );
  OAI21X1 U652 ( .A(n608), .B(n630), .C(n631), .Y(n629) );
  AOI22X1 U653 ( .A(F0[13]), .B(n611), .C(sample_data[13]), .D(n612), .Y(n631)
         );
  INVX1 U654 ( .A(result[13]), .Y(n630) );
  OAI21X1 U655 ( .A(n613), .B(n632), .C(n633), .Y(n628) );
  AOI22X1 U656 ( .A(F3[13]), .B(n616), .C(F2[13]), .D(n617), .Y(n633) );
  INVX1 U657 ( .A(hrdata[13]), .Y(n626) );
  OAI21X1 U658 ( .A(n581), .B(n634), .C(n635), .Y(n550) );
  OAI21X1 U659 ( .A(n636), .B(n637), .C(n607), .Y(n635) );
  OAI21X1 U660 ( .A(n608), .B(n638), .C(n639), .Y(n637) );
  AOI22X1 U661 ( .A(F0[12]), .B(n611), .C(sample_data[12]), .D(n612), .Y(n639)
         );
  INVX1 U662 ( .A(result[12]), .Y(n638) );
  OAI21X1 U663 ( .A(n613), .B(n640), .C(n641), .Y(n636) );
  AOI22X1 U664 ( .A(F3[12]), .B(n616), .C(F2[12]), .D(n617), .Y(n641) );
  INVX1 U665 ( .A(hrdata[12]), .Y(n634) );
  OAI21X1 U666 ( .A(n581), .B(n642), .C(n643), .Y(n549) );
  OAI21X1 U667 ( .A(n644), .B(n645), .C(n607), .Y(n643) );
  OAI21X1 U668 ( .A(n608), .B(n646), .C(n647), .Y(n645) );
  AOI22X1 U669 ( .A(F0[11]), .B(n611), .C(sample_data[11]), .D(n612), .Y(n647)
         );
  INVX1 U670 ( .A(result[11]), .Y(n646) );
  OAI21X1 U671 ( .A(n613), .B(n648), .C(n649), .Y(n644) );
  AOI22X1 U672 ( .A(F3[11]), .B(n616), .C(F2[11]), .D(n617), .Y(n649) );
  INVX1 U673 ( .A(hrdata[11]), .Y(n642) );
  OAI21X1 U674 ( .A(n581), .B(n650), .C(n651), .Y(n548) );
  OAI21X1 U675 ( .A(n652), .B(n653), .C(n607), .Y(n651) );
  OAI21X1 U676 ( .A(n608), .B(n654), .C(n655), .Y(n653) );
  AOI22X1 U677 ( .A(F0[10]), .B(n611), .C(sample_data[10]), .D(n612), .Y(n655)
         );
  INVX1 U678 ( .A(result[10]), .Y(n654) );
  OAI21X1 U679 ( .A(n613), .B(n656), .C(n657), .Y(n652) );
  AOI22X1 U680 ( .A(F3[10]), .B(n616), .C(F2[10]), .D(n617), .Y(n657) );
  INVX1 U681 ( .A(hrdata[10]), .Y(n650) );
  OAI21X1 U682 ( .A(n581), .B(n658), .C(n659), .Y(n547) );
  OAI21X1 U683 ( .A(n660), .B(n661), .C(n607), .Y(n659) );
  OAI21X1 U684 ( .A(n608), .B(n662), .C(n663), .Y(n661) );
  AOI22X1 U685 ( .A(F0[9]), .B(n611), .C(sample_data[9]), .D(n612), .Y(n663)
         );
  INVX1 U686 ( .A(result[9]), .Y(n662) );
  OAI21X1 U687 ( .A(n613), .B(n664), .C(n665), .Y(n660) );
  AOI22X1 U688 ( .A(F3[9]), .B(n616), .C(F2[9]), .D(n617), .Y(n665) );
  INVX1 U689 ( .A(hrdata[9]), .Y(n658) );
  OAI21X1 U690 ( .A(n581), .B(n666), .C(n667), .Y(n546) );
  OAI21X1 U691 ( .A(n668), .B(n669), .C(n607), .Y(n667) );
  AND2X1 U692 ( .A(n581), .B(n569), .Y(n607) );
  OR2X1 U693 ( .A(hsize), .B(haddr[0]), .Y(n569) );
  OAI21X1 U694 ( .A(n608), .B(n670), .C(n671), .Y(n669) );
  AOI22X1 U695 ( .A(F0[8]), .B(n611), .C(sample_data[8]), .D(n612), .Y(n671)
         );
  INVX1 U696 ( .A(result[8]), .Y(n670) );
  OR2X1 U697 ( .A(n672), .B(n673), .Y(n668) );
  OAI22X1 U698 ( .A(n613), .B(n674), .C(n675), .D(n676), .Y(n673) );
  OAI21X1 U699 ( .A(n677), .B(n678), .C(n679), .Y(n672) );
  NAND3X1 U700 ( .A(status[8]), .B(n680), .C(n681), .Y(n679) );
  INVX1 U701 ( .A(hrdata[8]), .Y(n666) );
  OAI21X1 U702 ( .A(n581), .B(n682), .C(n683), .Y(n545) );
  OAI21X1 U703 ( .A(n684), .B(n685), .C(n686), .Y(n683) );
  OAI21X1 U704 ( .A(n588), .B(n687), .C(n688), .Y(n685) );
  AOI22X1 U705 ( .A(sample_data[7]), .B(n612), .C(result[7]), .D(n689), .Y(
        n688) );
  INVX1 U706 ( .A(new_coeff_confirm[7]), .Y(n588) );
  NAND2X1 U707 ( .A(n690), .B(n691), .Y(n684) );
  AOI22X1 U708 ( .A(F3[7]), .B(n616), .C(F2[7]), .D(n617), .Y(n691) );
  AOI22X1 U709 ( .A(F1[7]), .B(n692), .C(F0[7]), .D(n611), .Y(n690) );
  INVX1 U710 ( .A(hrdata[7]), .Y(n682) );
  OAI21X1 U711 ( .A(n581), .B(n693), .C(n694), .Y(n544) );
  OAI21X1 U712 ( .A(n695), .B(n696), .C(n686), .Y(n694) );
  OAI21X1 U713 ( .A(n590), .B(n687), .C(n697), .Y(n696) );
  AOI22X1 U714 ( .A(sample_data[6]), .B(n612), .C(result[6]), .D(n689), .Y(
        n697) );
  INVX1 U715 ( .A(new_coeff_confirm[6]), .Y(n590) );
  NAND2X1 U716 ( .A(n698), .B(n699), .Y(n695) );
  AOI22X1 U717 ( .A(F3[6]), .B(n616), .C(F2[6]), .D(n617), .Y(n699) );
  AOI22X1 U718 ( .A(F1[6]), .B(n692), .C(F0[6]), .D(n611), .Y(n698) );
  INVX1 U719 ( .A(hrdata[6]), .Y(n693) );
  OAI21X1 U720 ( .A(n581), .B(n700), .C(n701), .Y(n543) );
  OAI21X1 U721 ( .A(n702), .B(n703), .C(n686), .Y(n701) );
  OAI21X1 U722 ( .A(n592), .B(n687), .C(n704), .Y(n703) );
  AOI22X1 U723 ( .A(sample_data[5]), .B(n612), .C(result[5]), .D(n689), .Y(
        n704) );
  INVX1 U724 ( .A(new_coeff_confirm[5]), .Y(n592) );
  NAND2X1 U725 ( .A(n705), .B(n706), .Y(n702) );
  AOI22X1 U726 ( .A(F3[5]), .B(n616), .C(F2[5]), .D(n617), .Y(n706) );
  AOI22X1 U727 ( .A(F1[5]), .B(n692), .C(F0[5]), .D(n611), .Y(n705) );
  INVX1 U728 ( .A(hrdata[5]), .Y(n700) );
  OAI21X1 U729 ( .A(n581), .B(n707), .C(n708), .Y(n542) );
  OAI21X1 U730 ( .A(n709), .B(n710), .C(n686), .Y(n708) );
  OAI21X1 U731 ( .A(n594), .B(n687), .C(n711), .Y(n710) );
  AOI22X1 U732 ( .A(sample_data[4]), .B(n612), .C(result[4]), .D(n689), .Y(
        n711) );
  INVX1 U733 ( .A(new_coeff_confirm[4]), .Y(n594) );
  NAND2X1 U734 ( .A(n712), .B(n713), .Y(n709) );
  AOI22X1 U735 ( .A(F3[4]), .B(n616), .C(F2[4]), .D(n617), .Y(n713) );
  AOI22X1 U736 ( .A(F1[4]), .B(n692), .C(F0[4]), .D(n611), .Y(n712) );
  INVX1 U737 ( .A(hrdata[4]), .Y(n707) );
  OAI21X1 U738 ( .A(n581), .B(n714), .C(n715), .Y(n541) );
  OAI21X1 U739 ( .A(n716), .B(n717), .C(n686), .Y(n715) );
  OAI21X1 U740 ( .A(n596), .B(n687), .C(n718), .Y(n717) );
  AOI22X1 U741 ( .A(sample_data[3]), .B(n612), .C(result[3]), .D(n689), .Y(
        n718) );
  INVX1 U742 ( .A(new_coeff_confirm[3]), .Y(n596) );
  NAND2X1 U743 ( .A(n719), .B(n720), .Y(n716) );
  AOI22X1 U744 ( .A(F3[3]), .B(n616), .C(F2[3]), .D(n617), .Y(n720) );
  AOI22X1 U745 ( .A(F1[3]), .B(n692), .C(F0[3]), .D(n611), .Y(n719) );
  INVX1 U746 ( .A(hrdata[3]), .Y(n714) );
  OAI21X1 U747 ( .A(n581), .B(n721), .C(n722), .Y(n540) );
  OAI21X1 U748 ( .A(n723), .B(n724), .C(n686), .Y(n722) );
  OAI21X1 U749 ( .A(n598), .B(n687), .C(n725), .Y(n724) );
  AOI22X1 U750 ( .A(sample_data[2]), .B(n612), .C(result[2]), .D(n689), .Y(
        n725) );
  INVX1 U751 ( .A(new_coeff_confirm[2]), .Y(n598) );
  NAND2X1 U752 ( .A(n726), .B(n727), .Y(n723) );
  AOI22X1 U753 ( .A(F3[2]), .B(n616), .C(F2[2]), .D(n617), .Y(n727) );
  AOI22X1 U754 ( .A(F1[2]), .B(n692), .C(F0[2]), .D(n611), .Y(n726) );
  INVX1 U755 ( .A(hrdata[2]), .Y(n721) );
  OAI21X1 U756 ( .A(n581), .B(n728), .C(n729), .Y(n539) );
  OAI21X1 U757 ( .A(n730), .B(n731), .C(n686), .Y(n729) );
  OAI21X1 U758 ( .A(n600), .B(n687), .C(n732), .Y(n731) );
  AOI22X1 U759 ( .A(sample_data[1]), .B(n612), .C(result[1]), .D(n689), .Y(
        n732) );
  INVX1 U760 ( .A(new_coeff_confirm[1]), .Y(n600) );
  NAND2X1 U761 ( .A(n733), .B(n734), .Y(n730) );
  AOI22X1 U762 ( .A(F3[1]), .B(n616), .C(F2[1]), .D(n617), .Y(n734) );
  AOI22X1 U763 ( .A(F1[1]), .B(n692), .C(F0[1]), .D(n611), .Y(n733) );
  INVX1 U764 ( .A(n613), .Y(n692) );
  INVX1 U765 ( .A(hrdata[1]), .Y(n728) );
  INVX1 U766 ( .A(n735), .Y(n538) );
  AOI22X1 U767 ( .A(n686), .B(n736), .C(hrdata[0]), .D(n737), .Y(n735) );
  NAND3X1 U768 ( .A(n738), .B(n739), .C(n740), .Y(n736) );
  NOR2X1 U769 ( .A(n741), .B(n742), .Y(n740) );
  OAI22X1 U770 ( .A(n613), .B(n743), .C(n675), .D(n744), .Y(n742) );
  NAND3X1 U771 ( .A(n745), .B(n746), .C(n747), .Y(n675) );
  NAND3X1 U772 ( .A(n680), .B(n746), .C(n745), .Y(n613) );
  OAI21X1 U773 ( .A(n677), .B(n748), .C(n749), .Y(n741) );
  NAND3X1 U774 ( .A(status[0]), .B(n680), .C(n681), .Y(n749) );
  NOR2X1 U775 ( .A(n750), .B(n745), .Y(n681) );
  NAND3X1 U776 ( .A(n745), .B(n680), .C(n750), .Y(n677) );
  AOI22X1 U777 ( .A(F0[0]), .B(n611), .C(sample_data[0]), .D(n612), .Y(n739)
         );
  NAND3X1 U778 ( .A(n680), .B(n752), .C(n750), .Y(n751) );
  INVX1 U779 ( .A(n747), .Y(n680) );
  NAND3X1 U780 ( .A(n750), .B(n752), .C(n747), .Y(n753) );
  AOI22X1 U781 ( .A(result[0]), .B(n689), .C(n754), .D(new_coefficient_set), 
        .Y(n738) );
  INVX1 U782 ( .A(n687), .Y(n754) );
  NAND3X1 U783 ( .A(n750), .B(n745), .C(n747), .Y(n687) );
  INVX1 U784 ( .A(n608), .Y(n689) );
  NAND3X1 U785 ( .A(n752), .B(n746), .C(n747), .Y(n608) );
  NOR2X1 U786 ( .A(n755), .B(n566), .Y(n747) );
  INVX1 U787 ( .A(N66), .Y(n566) );
  INVX1 U788 ( .A(n750), .Y(n746) );
  NOR2X1 U789 ( .A(n755), .B(n578), .Y(n750) );
  INVX1 U790 ( .A(n745), .Y(n752) );
  NOR2X1 U791 ( .A(n755), .B(n582), .Y(n745) );
  NAND3X1 U792 ( .A(n756), .B(n757), .C(hsel), .Y(n755) );
  NOR2X1 U793 ( .A(n737), .B(n758), .Y(n686) );
  OAI21X1 U794 ( .A(n759), .B(n760), .C(n761), .Y(n537) );
  NAND2X1 U795 ( .A(data_ready), .B(n584), .Y(n761) );
  INVX1 U796 ( .A(modwait), .Y(n584) );
  INVX1 U797 ( .A(delay_wsel_odd[0]), .Y(n760) );
  INVX1 U798 ( .A(delay_wsel_even[0]), .Y(n759) );
  MUX2X1 U799 ( .B(n762), .A(n763), .S(delay_wsel_odd[4]), .Y(n508) );
  INVX1 U800 ( .A(F3[15]), .Y(n762) );
  MUX2X1 U801 ( .B(n764), .A(n765), .S(delay_wsel_odd[4]), .Y(n506) );
  INVX1 U802 ( .A(F3[14]), .Y(n764) );
  MUX2X1 U803 ( .B(n766), .A(n767), .S(delay_wsel_odd[4]), .Y(n504) );
  INVX1 U804 ( .A(F3[13]), .Y(n766) );
  MUX2X1 U805 ( .B(n768), .A(n769), .S(delay_wsel_odd[4]), .Y(n502) );
  INVX1 U806 ( .A(F3[12]), .Y(n768) );
  MUX2X1 U807 ( .B(n770), .A(n771), .S(delay_wsel_odd[4]), .Y(n500) );
  INVX1 U808 ( .A(F3[11]), .Y(n770) );
  MUX2X1 U809 ( .B(n772), .A(n773), .S(delay_wsel_odd[4]), .Y(n498) );
  INVX1 U810 ( .A(F3[10]), .Y(n772) );
  MUX2X1 U811 ( .B(n774), .A(n775), .S(delay_wsel_odd[4]), .Y(n496) );
  INVX1 U812 ( .A(F3[9]), .Y(n774) );
  MUX2X1 U813 ( .B(n678), .A(n776), .S(delay_wsel_odd[4]), .Y(n494) );
  INVX1 U814 ( .A(F3[8]), .Y(n678) );
  MUX2X1 U815 ( .B(n777), .A(n586), .S(delay_wsel_even[4]), .Y(n492) );
  INVX1 U816 ( .A(F3[7]), .Y(n777) );
  MUX2X1 U817 ( .B(n778), .A(n589), .S(delay_wsel_even[4]), .Y(n490) );
  INVX1 U818 ( .A(F3[6]), .Y(n778) );
  MUX2X1 U819 ( .B(n779), .A(n591), .S(delay_wsel_even[4]), .Y(n488) );
  INVX1 U820 ( .A(F3[5]), .Y(n779) );
  MUX2X1 U821 ( .B(n780), .A(n593), .S(delay_wsel_even[4]), .Y(n486) );
  INVX1 U822 ( .A(F3[4]), .Y(n780) );
  MUX2X1 U823 ( .B(n781), .A(n595), .S(delay_wsel_even[4]), .Y(n484) );
  INVX1 U824 ( .A(F3[3]), .Y(n781) );
  MUX2X1 U825 ( .B(n782), .A(n597), .S(delay_wsel_even[4]), .Y(n482) );
  INVX1 U826 ( .A(F3[2]), .Y(n782) );
  MUX2X1 U827 ( .B(n783), .A(n599), .S(delay_wsel_even[4]), .Y(n480) );
  INVX1 U828 ( .A(F3[1]), .Y(n783) );
  MUX2X1 U829 ( .B(n748), .A(n601), .S(delay_wsel_even[4]), .Y(n478) );
  INVX1 U830 ( .A(F3[0]), .Y(n748) );
  INVX1 U831 ( .A(n784), .Y(n476) );
  MUX2X1 U832 ( .B(sample_data[15]), .A(hwdata[15]), .S(delay_wsel_odd[0]), 
        .Y(n784) );
  INVX1 U833 ( .A(n785), .Y(n474) );
  MUX2X1 U834 ( .B(sample_data[14]), .A(hwdata[14]), .S(delay_wsel_odd[0]), 
        .Y(n785) );
  INVX1 U835 ( .A(n786), .Y(n472) );
  MUX2X1 U836 ( .B(sample_data[13]), .A(hwdata[13]), .S(delay_wsel_odd[0]), 
        .Y(n786) );
  INVX1 U837 ( .A(n787), .Y(n470) );
  MUX2X1 U838 ( .B(sample_data[12]), .A(hwdata[12]), .S(delay_wsel_odd[0]), 
        .Y(n787) );
  INVX1 U839 ( .A(n788), .Y(n468) );
  MUX2X1 U840 ( .B(sample_data[11]), .A(hwdata[11]), .S(delay_wsel_odd[0]), 
        .Y(n788) );
  INVX1 U841 ( .A(n789), .Y(n466) );
  MUX2X1 U842 ( .B(sample_data[10]), .A(hwdata[10]), .S(delay_wsel_odd[0]), 
        .Y(n789) );
  INVX1 U843 ( .A(n790), .Y(n464) );
  MUX2X1 U844 ( .B(sample_data[9]), .A(hwdata[9]), .S(delay_wsel_odd[0]), .Y(
        n790) );
  INVX1 U845 ( .A(n791), .Y(n462) );
  MUX2X1 U846 ( .B(sample_data[8]), .A(hwdata[8]), .S(delay_wsel_odd[0]), .Y(
        n791) );
  INVX1 U847 ( .A(n792), .Y(n460) );
  MUX2X1 U848 ( .B(sample_data[7]), .A(hwdata[7]), .S(delay_wsel_even[0]), .Y(
        n792) );
  INVX1 U849 ( .A(n793), .Y(n458) );
  MUX2X1 U850 ( .B(sample_data[6]), .A(hwdata[6]), .S(delay_wsel_even[0]), .Y(
        n793) );
  INVX1 U851 ( .A(n794), .Y(n456) );
  MUX2X1 U852 ( .B(sample_data[5]), .A(hwdata[5]), .S(delay_wsel_even[0]), .Y(
        n794) );
  INVX1 U853 ( .A(n795), .Y(n454) );
  MUX2X1 U854 ( .B(sample_data[4]), .A(hwdata[4]), .S(delay_wsel_even[0]), .Y(
        n795) );
  INVX1 U855 ( .A(n796), .Y(n452) );
  MUX2X1 U856 ( .B(sample_data[3]), .A(hwdata[3]), .S(delay_wsel_even[0]), .Y(
        n796) );
  INVX1 U857 ( .A(n797), .Y(n450) );
  MUX2X1 U858 ( .B(sample_data[2]), .A(hwdata[2]), .S(delay_wsel_even[0]), .Y(
        n797) );
  INVX1 U859 ( .A(n798), .Y(n448) );
  MUX2X1 U860 ( .B(sample_data[1]), .A(hwdata[1]), .S(delay_wsel_even[0]), .Y(
        n798) );
  INVX1 U861 ( .A(n799), .Y(n446) );
  MUX2X1 U862 ( .B(sample_data[0]), .A(hwdata[0]), .S(delay_wsel_even[0]), .Y(
        n799) );
  MUX2X1 U863 ( .B(n800), .A(n763), .S(delay_wsel_odd[1]), .Y(n444) );
  INVX1 U864 ( .A(F0[15]), .Y(n800) );
  MUX2X1 U865 ( .B(n801), .A(n765), .S(delay_wsel_odd[1]), .Y(n442) );
  INVX1 U866 ( .A(F0[14]), .Y(n801) );
  MUX2X1 U867 ( .B(n802), .A(n767), .S(delay_wsel_odd[1]), .Y(n440) );
  INVX1 U868 ( .A(F0[13]), .Y(n802) );
  MUX2X1 U869 ( .B(n803), .A(n769), .S(delay_wsel_odd[1]), .Y(n438) );
  INVX1 U870 ( .A(F0[12]), .Y(n803) );
  MUX2X1 U871 ( .B(n804), .A(n771), .S(delay_wsel_odd[1]), .Y(n436) );
  INVX1 U872 ( .A(F0[11]), .Y(n804) );
  MUX2X1 U873 ( .B(n805), .A(n773), .S(delay_wsel_odd[1]), .Y(n434) );
  INVX1 U874 ( .A(F0[10]), .Y(n805) );
  MUX2X1 U875 ( .B(n806), .A(n775), .S(delay_wsel_odd[1]), .Y(n432) );
  INVX1 U876 ( .A(F0[9]), .Y(n806) );
  MUX2X1 U877 ( .B(n807), .A(n776), .S(delay_wsel_odd[1]), .Y(n430) );
  INVX1 U878 ( .A(F0[8]), .Y(n807) );
  MUX2X1 U879 ( .B(n808), .A(n586), .S(delay_wsel_even[1]), .Y(n428) );
  INVX1 U880 ( .A(F0[7]), .Y(n808) );
  MUX2X1 U881 ( .B(n809), .A(n589), .S(delay_wsel_even[1]), .Y(n426) );
  INVX1 U882 ( .A(F0[6]), .Y(n809) );
  MUX2X1 U883 ( .B(n810), .A(n591), .S(delay_wsel_even[1]), .Y(n424) );
  INVX1 U884 ( .A(F0[5]), .Y(n810) );
  MUX2X1 U885 ( .B(n811), .A(n593), .S(delay_wsel_even[1]), .Y(n422) );
  INVX1 U886 ( .A(F0[4]), .Y(n811) );
  MUX2X1 U887 ( .B(n812), .A(n595), .S(delay_wsel_even[1]), .Y(n420) );
  INVX1 U888 ( .A(F0[3]), .Y(n812) );
  MUX2X1 U889 ( .B(n813), .A(n597), .S(delay_wsel_even[1]), .Y(n418) );
  INVX1 U890 ( .A(F0[2]), .Y(n813) );
  MUX2X1 U891 ( .B(n814), .A(n599), .S(delay_wsel_even[1]), .Y(n416) );
  INVX1 U892 ( .A(F0[1]), .Y(n814) );
  MUX2X1 U893 ( .B(n815), .A(n601), .S(delay_wsel_even[1]), .Y(n414) );
  INVX1 U894 ( .A(F0[0]), .Y(n815) );
  MUX2X1 U895 ( .B(n614), .A(n763), .S(delay_wsel_odd[2]), .Y(n412) );
  INVX1 U896 ( .A(F1[15]), .Y(n614) );
  MUX2X1 U897 ( .B(n624), .A(n765), .S(delay_wsel_odd[2]), .Y(n410) );
  INVX1 U898 ( .A(F1[14]), .Y(n624) );
  MUX2X1 U899 ( .B(n632), .A(n767), .S(delay_wsel_odd[2]), .Y(n408) );
  INVX1 U900 ( .A(F1[13]), .Y(n632) );
  MUX2X1 U901 ( .B(n640), .A(n769), .S(delay_wsel_odd[2]), .Y(n406) );
  INVX1 U902 ( .A(F1[12]), .Y(n640) );
  MUX2X1 U903 ( .B(n648), .A(n771), .S(delay_wsel_odd[2]), .Y(n404) );
  INVX1 U904 ( .A(F1[11]), .Y(n648) );
  MUX2X1 U905 ( .B(n656), .A(n773), .S(delay_wsel_odd[2]), .Y(n402) );
  INVX1 U906 ( .A(F1[10]), .Y(n656) );
  MUX2X1 U907 ( .B(n664), .A(n775), .S(delay_wsel_odd[2]), .Y(n400) );
  INVX1 U908 ( .A(F1[9]), .Y(n664) );
  MUX2X1 U909 ( .B(n674), .A(n776), .S(delay_wsel_odd[2]), .Y(n398) );
  INVX1 U910 ( .A(F1[8]), .Y(n674) );
  MUX2X1 U911 ( .B(n816), .A(n586), .S(delay_wsel_even[2]), .Y(n396) );
  INVX1 U912 ( .A(F1[7]), .Y(n816) );
  MUX2X1 U913 ( .B(n817), .A(n589), .S(delay_wsel_even[2]), .Y(n394) );
  INVX1 U914 ( .A(F1[6]), .Y(n817) );
  MUX2X1 U915 ( .B(n818), .A(n591), .S(delay_wsel_even[2]), .Y(n392) );
  INVX1 U916 ( .A(F1[5]), .Y(n818) );
  MUX2X1 U917 ( .B(n819), .A(n593), .S(delay_wsel_even[2]), .Y(n390) );
  INVX1 U918 ( .A(F1[4]), .Y(n819) );
  MUX2X1 U919 ( .B(n820), .A(n595), .S(delay_wsel_even[2]), .Y(n388) );
  INVX1 U920 ( .A(F1[3]), .Y(n820) );
  MUX2X1 U921 ( .B(n821), .A(n597), .S(delay_wsel_even[2]), .Y(n386) );
  INVX1 U922 ( .A(F1[2]), .Y(n821) );
  MUX2X1 U923 ( .B(n822), .A(n599), .S(delay_wsel_even[2]), .Y(n384) );
  INVX1 U924 ( .A(F1[1]), .Y(n822) );
  MUX2X1 U925 ( .B(n743), .A(n601), .S(delay_wsel_even[2]), .Y(n382) );
  INVX1 U926 ( .A(F1[0]), .Y(n743) );
  MUX2X1 U927 ( .B(n823), .A(n763), .S(delay_wsel_odd[3]), .Y(n380) );
  INVX1 U928 ( .A(hwdata[15]), .Y(n763) );
  INVX1 U929 ( .A(F2[15]), .Y(n823) );
  MUX2X1 U930 ( .B(n824), .A(n765), .S(delay_wsel_odd[3]), .Y(n378) );
  INVX1 U931 ( .A(hwdata[14]), .Y(n765) );
  INVX1 U932 ( .A(F2[14]), .Y(n824) );
  MUX2X1 U933 ( .B(n825), .A(n767), .S(delay_wsel_odd[3]), .Y(n376) );
  INVX1 U934 ( .A(hwdata[13]), .Y(n767) );
  INVX1 U935 ( .A(F2[13]), .Y(n825) );
  MUX2X1 U936 ( .B(n826), .A(n769), .S(delay_wsel_odd[3]), .Y(n374) );
  INVX1 U937 ( .A(hwdata[12]), .Y(n769) );
  INVX1 U938 ( .A(F2[12]), .Y(n826) );
  MUX2X1 U939 ( .B(n827), .A(n771), .S(delay_wsel_odd[3]), .Y(n372) );
  INVX1 U940 ( .A(hwdata[11]), .Y(n771) );
  INVX1 U941 ( .A(F2[11]), .Y(n827) );
  MUX2X1 U942 ( .B(n828), .A(n773), .S(delay_wsel_odd[3]), .Y(n370) );
  INVX1 U943 ( .A(hwdata[10]), .Y(n773) );
  INVX1 U944 ( .A(F2[10]), .Y(n828) );
  MUX2X1 U945 ( .B(n829), .A(n775), .S(delay_wsel_odd[3]), .Y(n368) );
  INVX1 U946 ( .A(hwdata[9]), .Y(n775) );
  INVX1 U947 ( .A(F2[9]), .Y(n829) );
  MUX2X1 U948 ( .B(n676), .A(n776), .S(delay_wsel_odd[3]), .Y(n366) );
  INVX1 U949 ( .A(hwdata[8]), .Y(n776) );
  INVX1 U950 ( .A(F2[8]), .Y(n676) );
  MUX2X1 U951 ( .B(n830), .A(n586), .S(delay_wsel_even[3]), .Y(n364) );
  INVX1 U952 ( .A(hwdata[7]), .Y(n586) );
  INVX1 U953 ( .A(F2[7]), .Y(n830) );
  MUX2X1 U954 ( .B(n831), .A(n589), .S(delay_wsel_even[3]), .Y(n362) );
  INVX1 U955 ( .A(hwdata[6]), .Y(n589) );
  INVX1 U956 ( .A(F2[6]), .Y(n831) );
  MUX2X1 U957 ( .B(n832), .A(n591), .S(delay_wsel_even[3]), .Y(n360) );
  INVX1 U958 ( .A(hwdata[5]), .Y(n591) );
  INVX1 U959 ( .A(F2[5]), .Y(n832) );
  MUX2X1 U960 ( .B(n833), .A(n593), .S(delay_wsel_even[3]), .Y(n358) );
  INVX1 U961 ( .A(hwdata[4]), .Y(n593) );
  INVX1 U962 ( .A(F2[4]), .Y(n833) );
  MUX2X1 U963 ( .B(n834), .A(n595), .S(delay_wsel_even[3]), .Y(n356) );
  INVX1 U964 ( .A(hwdata[3]), .Y(n595) );
  INVX1 U965 ( .A(F2[3]), .Y(n834) );
  MUX2X1 U966 ( .B(n835), .A(n597), .S(delay_wsel_even[3]), .Y(n354) );
  INVX1 U967 ( .A(hwdata[2]), .Y(n597) );
  INVX1 U968 ( .A(F2[2]), .Y(n835) );
  MUX2X1 U969 ( .B(n836), .A(n599), .S(delay_wsel_even[3]), .Y(n352) );
  INVX1 U970 ( .A(hwdata[1]), .Y(n599) );
  INVX1 U971 ( .A(F2[1]), .Y(n836) );
  MUX2X1 U972 ( .B(n744), .A(n601), .S(delay_wsel_even[3]), .Y(n350) );
  INVX1 U973 ( .A(hwdata[0]), .Y(n601) );
  INVX1 U974 ( .A(F2[0]), .Y(n744) );
  NOR2X1 U975 ( .A(n837), .B(n838), .Y(hresp) );
  OAI21X1 U976 ( .A(n839), .B(n840), .C(n581), .Y(n838) );
  NAND2X1 U977 ( .A(htrans[1]), .B(n841), .Y(n737) );
  INVX1 U978 ( .A(htrans[0]), .Y(n841) );
  INVX1 U979 ( .A(n756), .Y(n840) );
  NAND3X1 U980 ( .A(n758), .B(N66), .C(n842), .Y(n756) );
  NOR2X1 U981 ( .A(n582), .B(n578), .Y(n842) );
  INVX1 U982 ( .A(n579), .Y(n758) );
  NAND2X1 U983 ( .A(haddr[0]), .B(n843), .Y(n579) );
  INVX1 U984 ( .A(hsize), .Y(n843) );
  NOR2X1 U985 ( .A(n757), .B(n844), .Y(n839) );
  NAND2X1 U986 ( .A(n578), .B(n582), .Y(n844) );
  INVX1 U987 ( .A(haddr[3]), .Y(n582) );
  INVX1 U988 ( .A(haddr[2]), .Y(n578) );
  INVX1 U989 ( .A(hwrite), .Y(n757) );
  INVX1 U990 ( .A(hsel), .Y(n837) );
  NAND2X1 U991 ( .A(n845), .B(n846), .Y(fir_coefficient[9]) );
  AOI22X1 U992 ( .A(F3[9]), .B(n847), .C(n562), .D(F2[9]), .Y(n846) );
  AOI22X1 U993 ( .A(n849), .B(F1[9]), .C(n563), .D(F0[9]), .Y(n845) );
  NAND2X1 U994 ( .A(n851), .B(n852), .Y(fir_coefficient[8]) );
  AOI22X1 U995 ( .A(F3[8]), .B(n847), .C(n562), .D(F2[8]), .Y(n852) );
  AOI22X1 U996 ( .A(n849), .B(F1[8]), .C(n563), .D(F0[8]), .Y(n851) );
  NAND2X1 U997 ( .A(n853), .B(n854), .Y(fir_coefficient[7]) );
  AOI22X1 U998 ( .A(F3[7]), .B(n847), .C(n562), .D(F2[7]), .Y(n854) );
  AOI22X1 U999 ( .A(n849), .B(F1[7]), .C(n563), .D(F0[7]), .Y(n853) );
  NAND2X1 U1000 ( .A(n855), .B(n856), .Y(fir_coefficient[6]) );
  AOI22X1 U1001 ( .A(F3[6]), .B(n847), .C(n562), .D(F2[6]), .Y(n856) );
  AOI22X1 U1002 ( .A(n849), .B(F1[6]), .C(n563), .D(F0[6]), .Y(n855) );
  NAND2X1 U1003 ( .A(n857), .B(n858), .Y(fir_coefficient[5]) );
  AOI22X1 U1004 ( .A(F3[5]), .B(n847), .C(n562), .D(F2[5]), .Y(n858) );
  AOI22X1 U1005 ( .A(n849), .B(F1[5]), .C(n563), .D(F0[5]), .Y(n857) );
  NAND2X1 U1006 ( .A(n859), .B(n860), .Y(fir_coefficient[4]) );
  AOI22X1 U1007 ( .A(F3[4]), .B(n847), .C(n562), .D(F2[4]), .Y(n860) );
  AOI22X1 U1008 ( .A(n849), .B(F1[4]), .C(n563), .D(F0[4]), .Y(n859) );
  NAND2X1 U1009 ( .A(n861), .B(n862), .Y(fir_coefficient[3]) );
  AOI22X1 U1010 ( .A(F3[3]), .B(n847), .C(n562), .D(F2[3]), .Y(n862) );
  AOI22X1 U1011 ( .A(n849), .B(F1[3]), .C(n563), .D(F0[3]), .Y(n861) );
  NAND2X1 U1012 ( .A(n863), .B(n864), .Y(fir_coefficient[2]) );
  AOI22X1 U1013 ( .A(F3[2]), .B(n847), .C(n562), .D(F2[2]), .Y(n864) );
  AOI22X1 U1014 ( .A(n849), .B(F1[2]), .C(n563), .D(F0[2]), .Y(n863) );
  NAND2X1 U1015 ( .A(n865), .B(n866), .Y(fir_coefficient[1]) );
  AOI22X1 U1016 ( .A(F3[1]), .B(n847), .C(n562), .D(F2[1]), .Y(n866) );
  AOI22X1 U1017 ( .A(n849), .B(F1[1]), .C(n563), .D(F0[1]), .Y(n865) );
  NAND2X1 U1018 ( .A(n867), .B(n868), .Y(fir_coefficient[15]) );
  AOI22X1 U1019 ( .A(F3[15]), .B(n847), .C(n562), .D(F2[15]), .Y(n868) );
  AOI22X1 U1020 ( .A(n849), .B(F1[15]), .C(n563), .D(F0[15]), .Y(n867) );
  NAND2X1 U1021 ( .A(n869), .B(n870), .Y(fir_coefficient[14]) );
  AOI22X1 U1022 ( .A(F3[14]), .B(n847), .C(n562), .D(F2[14]), .Y(n870) );
  AOI22X1 U1023 ( .A(n849), .B(F1[14]), .C(n563), .D(F0[14]), .Y(n869) );
  NAND2X1 U1024 ( .A(n871), .B(n872), .Y(fir_coefficient[13]) );
  AOI22X1 U1025 ( .A(F3[13]), .B(n847), .C(n562), .D(F2[13]), .Y(n872) );
  AOI22X1 U1026 ( .A(n849), .B(F1[13]), .C(n563), .D(F0[13]), .Y(n871) );
  NAND2X1 U1027 ( .A(n873), .B(n874), .Y(fir_coefficient[12]) );
  AOI22X1 U1028 ( .A(F3[12]), .B(n847), .C(n562), .D(F2[12]), .Y(n874) );
  AOI22X1 U1029 ( .A(n849), .B(F1[12]), .C(n563), .D(F0[12]), .Y(n873) );
  NAND2X1 U1030 ( .A(n875), .B(n876), .Y(fir_coefficient[11]) );
  AOI22X1 U1031 ( .A(F3[11]), .B(n847), .C(n562), .D(F2[11]), .Y(n876) );
  AOI22X1 U1032 ( .A(n849), .B(F1[11]), .C(n563), .D(F0[11]), .Y(n875) );
  NAND2X1 U1033 ( .A(n877), .B(n878), .Y(fir_coefficient[10]) );
  AOI22X1 U1034 ( .A(F3[10]), .B(n847), .C(n562), .D(F2[10]), .Y(n878) );
  AOI22X1 U1035 ( .A(n849), .B(F1[10]), .C(n563), .D(F0[10]), .Y(n877) );
  NAND2X1 U1036 ( .A(n879), .B(n880), .Y(fir_coefficient[0]) );
  AOI22X1 U1037 ( .A(F3[0]), .B(n847), .C(n562), .D(F2[0]), .Y(n880) );
  NOR2X1 U1038 ( .A(n881), .B(coefficient_num[0]), .Y(n848) );
  NAND2X1 U1039 ( .A(coefficient_num[1]), .B(coefficient_num[0]), .Y(n602) );
  AOI22X1 U1040 ( .A(n849), .B(F1[0]), .C(n563), .D(F0[0]), .Y(n879) );
  NOR2X1 U1041 ( .A(coefficient_num[0]), .B(coefficient_num[1]), .Y(n850) );
  INVX1 U1042 ( .A(coefficient_num[1]), .Y(n881) );
endmodule

