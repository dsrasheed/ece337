/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Sep 15 17:21:37 2020
/////////////////////////////////////////////////////////////


module sync_low ( clk, async_in, n_rst, sync_out );
  input clk, async_in, n_rst;
  output sync_out;
  wire   first;

  DFFSR first_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(first) );
  DFFSR second_reg ( .D(first), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule

