// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_rcu();

  // Declare DUT portmap signals
  logic tb_clk;
  logic tb_n_rst;
  logic tb_d_edge;
  logic tb_eop;
  logic tb_shift_enable;
  logic tb_byte_received;
  logic [7:0] tb_rcv_data;
  wire pid_reset, pid_save, rcving, r_error, w_enable;
  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;
  
  // DUT Port map
  rcu DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_edge(tb_d_edge), .eop(tb_eop), .shift_enable(tb_shift_enable), .byte_received(tb_byte_received), 
  .rcv_data(tb_rcv_data), .pid_reset(pid_reset), .pid_save(pid_save), .rcving(rcving), .r_error(r_error), .w_enable(w_enable));
  
endmodule
