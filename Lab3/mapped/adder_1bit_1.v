/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Sep 13 16:03:25 2020
/////////////////////////////////////////////////////////////


module adder_1bit ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n10, n11;

  XOR2X1 U10 ( .A(carry_in), .B(n10), .Y(sum) );
  INVX1 U11 ( .A(n11), .Y(carry_out) );
  MUX2X1 U12 ( .B(b), .A(carry_in), .S(n10), .Y(n11) );
  XOR2X1 U13 ( .A(b), .B(a), .Y(n10) );
endmodule

