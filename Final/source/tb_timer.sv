// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_timer();

  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_d_edge;
  reg tb_bit_stuff_det;
  reg tb_rcving;
  wire tb_shift_enable;
  wire tb_byte_received;
  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;
  
  // DUT Port map
  timer DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_edge(tb_d_edge), .bit_stuff_det(tb_but_stuff_det), .rcving(tb_rcving), .shift_enable(tb_shift_enable), 
  .byte_received(tb_byte_received));
  
endmodule
