// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_bit_stuff_det();

  // Declare DUT portmap signals
	logic clk, n_rst, d_edge, shift_enable;
	wire bit_stuff;
  
  
  // DUT Port map
  bit_stuff_det DUT(.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .shift_enable(shift_enable), .bit_stuff_det(bit_stuff));
  
endmodule
