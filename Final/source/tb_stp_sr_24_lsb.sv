// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_stp_sr_24_lsb();

  // Declare DUT portmap signals

  logic clk, n_rst, serial_in, shift_enable;
  wire [23:0] parallel_out;
  
  // DUT Port map
  stp_sr_24_lsb DUT(.clk(clk), .n_rst(n_rst), .serial_in(serial_in), .shift_enable(shift_enable), .parallel_out(parallel_out));
  
endmodule
