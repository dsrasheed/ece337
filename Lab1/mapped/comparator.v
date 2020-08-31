/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Aug 25 21:14:56 2020
/////////////////////////////////////////////////////////////


module comparator_DW01_cmp6_0 ( A, B, TC, LT, GT, EQ, LE, GE, NE );
  input [15:0] A;
  input [15:0] B;
  input TC;
  output LT, GT, EQ, LE, GE, NE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98;

  INVX2 U1 ( .A(n30), .Y(n1) );
  INVX2 U2 ( .A(n76), .Y(n2) );
  INVX2 U3 ( .A(A[15]), .Y(n3) );
  INVX2 U4 ( .A(n77), .Y(n4) );
  INVX2 U5 ( .A(n32), .Y(n5) );
  INVX2 U6 ( .A(n37), .Y(n6) );
  INVX2 U7 ( .A(A[12]), .Y(n7) );
  INVX2 U8 ( .A(n38), .Y(n8) );
  INVX2 U9 ( .A(A[10]), .Y(n9) );
  INVX2 U10 ( .A(n45), .Y(n10) );
  INVX2 U11 ( .A(A[8]), .Y(n11) );
  INVX2 U12 ( .A(n52), .Y(n12) );
  INVX2 U13 ( .A(A[6]), .Y(n13) );
  INVX2 U14 ( .A(n59), .Y(n14) );
  INVX2 U15 ( .A(A[4]), .Y(n15) );
  INVX2 U16 ( .A(n66), .Y(n16) );
  INVX2 U17 ( .A(A[2]), .Y(n17) );
  INVX2 U18 ( .A(n98), .Y(n18) );
  INVX2 U19 ( .A(A[1]), .Y(n19) );
  INVX2 U20 ( .A(n73), .Y(n20) );
  INVX2 U21 ( .A(B[14]), .Y(n21) );
  INVX2 U22 ( .A(B[13]), .Y(n22) );
  INVX2 U23 ( .A(B[11]), .Y(n23) );
  INVX2 U24 ( .A(B[9]), .Y(n24) );
  INVX2 U25 ( .A(B[7]), .Y(n25) );
  INVX2 U26 ( .A(B[5]), .Y(n26) );
  INVX2 U27 ( .A(B[3]), .Y(n27) );
  INVX2 U28 ( .A(B[0]), .Y(n28) );
  NOR2X1 U29 ( .A(LT), .B(GT), .Y(EQ) );
  OAI21X1 U30 ( .A(n2), .B(n29), .C(n1), .Y(GT) );
  AOI22X1 U31 ( .A(A[14]), .B(n21), .C(n31), .D(n32), .Y(n29) );
  AOI21X1 U32 ( .A(n33), .B(n34), .C(n35), .Y(n31) );
  NAND3X1 U33 ( .A(n36), .B(n8), .C(n6), .Y(n34) );
  OAI21X1 U34 ( .A(n39), .B(n40), .C(n41), .Y(n36) );
  AND2X1 U35 ( .A(n42), .B(n43), .Y(n41) );
  NAND2X1 U36 ( .A(n44), .B(n10), .Y(n40) );
  OAI21X1 U37 ( .A(n46), .B(n47), .C(n48), .Y(n44) );
  AND2X1 U38 ( .A(n49), .B(n50), .Y(n48) );
  NAND2X1 U39 ( .A(n51), .B(n12), .Y(n47) );
  OAI21X1 U40 ( .A(n53), .B(n54), .C(n55), .Y(n51) );
  AND2X1 U41 ( .A(n56), .B(n57), .Y(n55) );
  NAND2X1 U42 ( .A(n58), .B(n14), .Y(n54) );
  OAI21X1 U43 ( .A(n60), .B(n61), .C(n62), .Y(n58) );
  AND2X1 U44 ( .A(n63), .B(n64), .Y(n62) );
  NAND2X1 U45 ( .A(n65), .B(n16), .Y(n61) );
  OAI21X1 U46 ( .A(n67), .B(n68), .C(n69), .Y(n65) );
  AND2X1 U47 ( .A(n70), .B(n71), .Y(n69) );
  OAI21X1 U48 ( .A(A[1]), .B(n20), .C(n72), .Y(n68) );
  OAI21X1 U49 ( .A(n19), .B(n73), .C(B[1]), .Y(n72) );
  NAND2X1 U50 ( .A(A[0]), .B(n28), .Y(n73) );
  AND2X1 U51 ( .A(n74), .B(n75), .Y(n33) );
  OAI21X1 U52 ( .A(n30), .B(n4), .C(n76), .Y(LT) );
  NAND2X1 U53 ( .A(B[15]), .B(n3), .Y(n76) );
  OAI22X1 U54 ( .A(n5), .B(n78), .C(A[14]), .D(n21), .Y(n77) );
  OAI21X1 U55 ( .A(n35), .B(n79), .C(n75), .Y(n78) );
  NAND2X1 U56 ( .A(A[13]), .B(n22), .Y(n75) );
  OAI21X1 U57 ( .A(n37), .B(n80), .C(n81), .Y(n79) );
  OAI21X1 U58 ( .A(n38), .B(n82), .C(n43), .Y(n80) );
  NAND2X1 U59 ( .A(A[11]), .B(n23), .Y(n43) );
  OAI21X1 U60 ( .A(n39), .B(n83), .C(n84), .Y(n82) );
  OAI21X1 U61 ( .A(n45), .B(n85), .C(n50), .Y(n83) );
  NAND2X1 U62 ( .A(A[9]), .B(n24), .Y(n50) );
  OAI21X1 U63 ( .A(n46), .B(n86), .C(n87), .Y(n85) );
  OAI21X1 U64 ( .A(n52), .B(n88), .C(n57), .Y(n86) );
  NAND2X1 U65 ( .A(A[7]), .B(n25), .Y(n57) );
  OAI21X1 U66 ( .A(n53), .B(n89), .C(n90), .Y(n88) );
  OAI21X1 U67 ( .A(n59), .B(n91), .C(n64), .Y(n89) );
  NAND2X1 U68 ( .A(A[5]), .B(n26), .Y(n64) );
  OAI21X1 U69 ( .A(n60), .B(n92), .C(n93), .Y(n91) );
  OAI21X1 U70 ( .A(n66), .B(n94), .C(n71), .Y(n92) );
  NAND2X1 U71 ( .A(A[3]), .B(n27), .Y(n71) );
  OAI21X1 U72 ( .A(n67), .B(n95), .C(n96), .Y(n94) );
  OAI21X1 U73 ( .A(n97), .B(n19), .C(n18), .Y(n95) );
  AOI21X1 U74 ( .A(n19), .B(n97), .C(B[1]), .Y(n98) );
  NOR2X1 U75 ( .A(n28), .B(A[0]), .Y(n97) );
  NAND2X1 U76 ( .A(n70), .B(n96), .Y(n67) );
  NAND2X1 U77 ( .A(B[2]), .B(n17), .Y(n96) );
  OR2X1 U78 ( .A(n17), .B(B[2]), .Y(n70) );
  NOR2X1 U79 ( .A(n27), .B(A[3]), .Y(n66) );
  NAND2X1 U80 ( .A(n63), .B(n93), .Y(n60) );
  NAND2X1 U81 ( .A(B[4]), .B(n15), .Y(n93) );
  OR2X1 U82 ( .A(n15), .B(B[4]), .Y(n63) );
  NOR2X1 U83 ( .A(n26), .B(A[5]), .Y(n59) );
  NAND2X1 U84 ( .A(n56), .B(n90), .Y(n53) );
  NAND2X1 U85 ( .A(B[6]), .B(n13), .Y(n90) );
  OR2X1 U86 ( .A(n13), .B(B[6]), .Y(n56) );
  NOR2X1 U87 ( .A(n25), .B(A[7]), .Y(n52) );
  NAND2X1 U88 ( .A(n49), .B(n87), .Y(n46) );
  NAND2X1 U89 ( .A(B[8]), .B(n11), .Y(n87) );
  OR2X1 U90 ( .A(n11), .B(B[8]), .Y(n49) );
  NOR2X1 U91 ( .A(n24), .B(A[9]), .Y(n45) );
  NAND2X1 U92 ( .A(n42), .B(n84), .Y(n39) );
  NAND2X1 U93 ( .A(B[10]), .B(n9), .Y(n84) );
  OR2X1 U94 ( .A(n9), .B(B[10]), .Y(n42) );
  NOR2X1 U95 ( .A(n23), .B(A[11]), .Y(n38) );
  NAND2X1 U96 ( .A(n74), .B(n81), .Y(n37) );
  NAND2X1 U97 ( .A(B[12]), .B(n7), .Y(n81) );
  OR2X1 U98 ( .A(n7), .B(B[12]), .Y(n74) );
  NOR2X1 U99 ( .A(n22), .B(A[13]), .Y(n35) );
  XOR2X1 U100 ( .A(A[14]), .B(n21), .Y(n32) );
  NOR2X1 U101 ( .A(n3), .B(B[15]), .Y(n30) );
endmodule


module comparator ( a, b, gt, lt, eq );
  input [15:0] a;
  input [15:0] b;
  output gt, lt, eq;
  wire   N0, N1, N2;
  assign gt = N0;
  assign lt = N1;
  assign eq = N2;

  comparator_DW01_cmp6_0 r300 ( .A(a), .B(b), .TC(1'b0), .LT(N1), .GT(N0), 
        .EQ(N2) );
endmodule

