/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Sep  9 01:27:57 2020
/////////////////////////////////////////////////////////////


module edge_det ( clk, reset, D, detect );
  input clk, reset, D;
  output detect;
  wire   \S_Reg[1] , N14, n2, n3, n7;
  wire   [1:0] S_next;
  assign S_next[0] = D;
  assign detect = N14;

  DFFSR \S_Reg_reg[0]  ( .D(S_next[0]), .CLK(clk), .R(n2), .S(n3), .Q(
        S_next[1]) );
  DFFSR \S_Reg_reg[1]  ( .D(S_next[1]), .CLK(clk), .R(n2), .S(n3), .Q(
        \S_Reg[1] ) );
  NAND2X1 U9 ( .A(reset), .B(S_next[0]), .Y(n3) );
  NAND2X1 U10 ( .A(reset), .B(n7), .Y(n2) );
  INVX1 U11 ( .A(S_next[0]), .Y(n7) );
  XOR2X1 U12 ( .A(S_next[1]), .B(\S_Reg[1] ), .Y(N14) );
endmodule

