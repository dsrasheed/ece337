/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Dec  5 17:40:30 2020
/////////////////////////////////////////////////////////////


module comparator ( a, b, gt, lt, eq );
  input [15:0] a;
  input [15:0] b;
  output gt, lt, eq;
  wire   N4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63;
  assign gt = N4;
  assign lt = 1'b0;

  INVX1 U8 ( .A(N4), .Y(eq) );
  OAI21X1 U9 ( .A(b[15]), .B(n6), .C(n7), .Y(N4) );
  OAI21X1 U10 ( .A(a[15]), .B(n8), .C(n9), .Y(n7) );
  AOI22X1 U11 ( .A(n10), .B(n11), .C(b[14]), .D(n12), .Y(n9) );
  OR2X1 U12 ( .A(n12), .B(b[14]), .Y(n11) );
  INVX1 U13 ( .A(a[14]), .Y(n12) );
  OAI21X1 U14 ( .A(a[13]), .B(n13), .C(n14), .Y(n10) );
  OAI21X1 U15 ( .A(b[13]), .B(n15), .C(n16), .Y(n14) );
  AOI21X1 U16 ( .A(a[12]), .B(n17), .C(n18), .Y(n16) );
  AOI21X1 U17 ( .A(n19), .B(n20), .C(b[12]), .Y(n18) );
  INVX1 U18 ( .A(a[12]), .Y(n19) );
  INVX1 U19 ( .A(n20), .Y(n17) );
  OAI21X1 U20 ( .A(a[11]), .B(n21), .C(n22), .Y(n20) );
  OAI21X1 U21 ( .A(b[11]), .B(n23), .C(n24), .Y(n22) );
  AOI21X1 U22 ( .A(a[10]), .B(n25), .C(n26), .Y(n24) );
  AOI21X1 U23 ( .A(b[9]), .B(n27), .C(n28), .Y(n26) );
  OAI21X1 U24 ( .A(a[10]), .B(n25), .C(n29), .Y(n28) );
  OAI21X1 U25 ( .A(b[9]), .B(n27), .C(n30), .Y(n29) );
  AOI21X1 U26 ( .A(a[8]), .B(n31), .C(n32), .Y(n30) );
  AOI21X1 U27 ( .A(n33), .B(n34), .C(b[8]), .Y(n32) );
  INVX1 U28 ( .A(a[8]), .Y(n33) );
  INVX1 U29 ( .A(n34), .Y(n31) );
  OAI21X1 U30 ( .A(a[7]), .B(n35), .C(n36), .Y(n34) );
  OAI21X1 U31 ( .A(b[7]), .B(n37), .C(n38), .Y(n36) );
  AOI21X1 U32 ( .A(a[6]), .B(n39), .C(n40), .Y(n38) );
  AOI21X1 U33 ( .A(n41), .B(n42), .C(b[6]), .Y(n40) );
  INVX1 U34 ( .A(a[6]), .Y(n41) );
  INVX1 U35 ( .A(n42), .Y(n39) );
  OAI21X1 U36 ( .A(a[5]), .B(n43), .C(n44), .Y(n42) );
  OAI21X1 U37 ( .A(b[5]), .B(n45), .C(n46), .Y(n44) );
  AOI21X1 U38 ( .A(a[4]), .B(n47), .C(n48), .Y(n46) );
  AOI21X1 U39 ( .A(n49), .B(n50), .C(b[4]), .Y(n48) );
  INVX1 U40 ( .A(a[4]), .Y(n49) );
  INVX1 U41 ( .A(n50), .Y(n47) );
  OAI21X1 U42 ( .A(a[3]), .B(n51), .C(n52), .Y(n50) );
  OAI21X1 U43 ( .A(b[3]), .B(n53), .C(n54), .Y(n52) );
  AOI21X1 U44 ( .A(a[2]), .B(n55), .C(n56), .Y(n54) );
  AOI21X1 U45 ( .A(n57), .B(n58), .C(b[2]), .Y(n56) );
  INVX1 U46 ( .A(a[2]), .Y(n57) );
  INVX1 U47 ( .A(n58), .Y(n55) );
  OAI21X1 U48 ( .A(a[1]), .B(n59), .C(n60), .Y(n58) );
  OAI21X1 U49 ( .A(n61), .B(n62), .C(b[1]), .Y(n60) );
  INVX1 U50 ( .A(a[1]), .Y(n62) );
  INVX1 U51 ( .A(n59), .Y(n61) );
  NOR2X1 U52 ( .A(n63), .B(b[0]), .Y(n59) );
  INVX1 U53 ( .A(a[0]), .Y(n63) );
  INVX1 U54 ( .A(a[3]), .Y(n53) );
  INVX1 U55 ( .A(b[3]), .Y(n51) );
  INVX1 U56 ( .A(a[5]), .Y(n45) );
  INVX1 U57 ( .A(b[5]), .Y(n43) );
  INVX1 U58 ( .A(a[7]), .Y(n37) );
  INVX1 U59 ( .A(b[7]), .Y(n35) );
  INVX1 U60 ( .A(a[9]), .Y(n27) );
  INVX1 U61 ( .A(b[10]), .Y(n25) );
  INVX1 U62 ( .A(a[11]), .Y(n23) );
  INVX1 U63 ( .A(b[11]), .Y(n21) );
  INVX1 U64 ( .A(a[13]), .Y(n15) );
  INVX1 U65 ( .A(b[13]), .Y(n13) );
  INVX1 U66 ( .A(b[15]), .Y(n8) );
  INVX1 U67 ( .A(a[15]), .Y(n6) );
endmodule

