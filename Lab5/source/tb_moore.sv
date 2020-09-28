// $Id: $
// File name:   tb_moore.sv
// Created:     9/27/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Test bench for Moore 1101 Detector

`timescale 1ns / 10ps

module tb_moore();

  localparam CLK_PERIOD = 2.5;
  localparam PROPAGATION_DELAY = 0.9;
  localparam RESET_OUTPUT_VALUE = 0;

  // Declare Test Case Signals
  integer tb_test_num;
  string  tb_test_case;
  string  tb_stream_check_tag;
  int     tb_bit_num;
  logic   tb_mismatch;
  logic   tb_check;

  // Declare the Test Bench Signals for Expected Results
  logic tb_test_data [];
  logic tb_expected_out [];

  logic tb_clk;
  logic tb_n_rst;
  logic tb_i;
  logic tb_o;

  task reset_dut;
  begin
    // Activate the reset
    tb_n_rst = 1'b0;
    
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  task check_output;
    input bit expected_o;
    input string check_tag;
  begin
    tb_mismatch = 1'b0;
    tb_check    = 1'b1;
    if (expected_o == tb_o)
      $info("Correct output %s during %s test case", check_tag, tb_test_case);
    else begin
      tb_mismatch = 1'b1;
      $error("Incorrect output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

  task send_bit;
    input logic bit_to_send;
  begin
    // Synchronize to the negative edge fo clock to prevent timing errors
    @(negedge tb_clk);

    // Set the value of the bit
    tb_i = bit_to_send;

    // Wait for the value to have been shifted in on the rising clock edge
    @(posedge tb_clk);
    #(PROPAGATION_DELAY);

  end
  endtask

  task test_stream;
    input logic bit_stream [];
    input logic expected_outs [];
    input string check_tag;
  begin
    for (tb_bit_num = 0; tb_bit_num < bit_stream.size(); tb_bit_num++) begin
      send_bit(bit_stream[tb_bit_num]);

      $sformat(check_tag, "for bit %0d", bit_stream[tb_bit_num]);
      check_output(expected_outs[tb_bit_num], check_tag);
    end
  end
  endtask

  always begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block
    #(CLK_PERIOD/2.0);
  end

  moore DUT (.clk(tb_clk), .n_rst(tb_n_rst), .i(tb_i), .o(tb_o));

  initial begin
  // Initialize all of the test inputs
  tb_n_rst            = 1'b1;
  tb_i                = 1'b0;
  tb_test_num         = 0;
  tb_test_case        = "Test bench initialization";
  tb_stream_check_tag = "N/A";
  tb_bit_num          = -1;
  tb_mismatch         = 1'b0;
  tb_check            = 1'b0;
  // Wait some time before starting first test case
  #(0.1);
  
  // ************************************************************************
  // Test Case 1: Power-on Reset of the DUT
  // ************************************************************************
  tb_test_num = tb_test_num + 1;
  tb_test_case = "Power on Reset";

  // Cannot use reset task during reset test case since we need to specifically check
  // behavior during reset
  // Wait some time before applying test case stimulus
  #(0.1);
  // Apply test case initial stimulus
  tb_i = 1'b0;
  tb_n_rst = 1'b0;

  // Wait for a bit before checking for correct functionality
  #(CLK_PERIOD * 0.5);

  // Check that internal state was correctly reset
  check_output(RESET_OUTPUT_VALUE, "after reset applied");

  // Check that the reset value is maintained during a clock cycle
  #(CLK_PERIOD);
  check_output(RESET_OUTPUT_VALUE, "after clock cycle while in reset");

  // Release the reset away from a clock edge
  @(negedge tb_clk);

  // ************************************************************************
  // Test Case 2: Basic
  // ************************************************************************
  tb_test_num  = tb_test_num + 1;
  tb_test_case = "Contiguous Zero Fill";
  // Start out with inactive value and reset the DUT to isolate from prior tests
  tb_i = 1'b0;
  reset_dut();

  // Define the test data stream for this test case
  //tb_test_data = {0,1,1,0,1,1,0,1,0,1,1};
  tb_test_data = {1,1,0,1};

  // Define the expected result
  tb_expected_out = {0,0,0,1};

  test_stream(tb_test_data, tb_expected_out, tb_stream_check_tag);

  // ************************************************************************
  // Test Case 3: Intersecting 1101
  // ************************************************************************
  tb_test_num = tb_test_num + 1;
  tb_test_case = "Intersecting 1101";
  tb_i = 1'b0;
  reset_dut();

  tb_test_data    = {0,1,1,0,1,1,0,1,1};
  tb_expected_out = {0,0,0,0,1,0,0,1,0};
  test_stream(tb_test_data, tb_expected_out, tb_stream_check_tag);

  // ************************************************************************
  // Test Case 4: Go Back to WAITING
  // ************************************************************************
  tb_test_num = tb_test_num + 1;
  tb_test_case = "Back to WAITING State";
  tb_i = 1'b0;
  reset_dut();

  tb_test_data    = {0,1,1,0,0,1,1,0,0,0,1,0};
  tb_expected_out = {0,0,0,0,0,0,0,0,0,0,0,0};
  test_stream(tb_test_data, tb_expected_out, tb_stream_check_tag);

  end
endmodule
