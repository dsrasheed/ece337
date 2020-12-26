/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Dec  5 16:36:08 2020
/////////////////////////////////////////////////////////////


module eop_det ( d_plus_sync, d_minus_sync, eop );
  input d_plus_sync, d_minus_sync;
  output eop;


  NOR2X1 U2 ( .A(d_plus_sync), .B(d_minus_sync), .Y(eop) );
endmodule

