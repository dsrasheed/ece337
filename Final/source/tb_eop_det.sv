// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_eop_det();

  // Define local parameters used by the test bench
  localparam  CHECK_DELAY  = 0.8; // Check right before the setup time starts
  
  // Declare DUT portmap signals
  reg tb_d_plus_sync;
  reg tb_d_minus_sync;
  wire tb_eop;
  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;

  // Task to cleanly and consistently check DUT output values
  task check_output;
    input logic expected_eop;
    input string check_tag;
  begin
    if(expected_eop == tb_eop) begin // Check passed
      $info("Correct eop output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect eop output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask
  
  // DUT Port map
  eop_det DUT(.eop(tb_eop), .d_plus_sync(tb_d_plus_sync), .d_minus_sync(tb_d_minus_sync));
  
  // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_d_plus_sync  = 1'b1;
    tb_d_minus_sync = 1'b0;
    tb_test_num = 0;                  // Initialize test case counter
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;
    tb_stream_check_tag = "N/A";

    // Wait some time before starting first test case
    #(0.1);
    
    // ************************************************************************
    // Test Case 1: Normal Operation
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Normal Operation";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus

    #(0.1);
    
    tb_d_plus_sync = 1'b1;
    tb_d_minus_sync = 1'b0;

    #(CHECK_DELAY);
    check_output(1'b0, "after plus = 1, minus = 0");

    tb_d_plus_sync = 1'b0;
    tb_d_plus_sync = 1'b1;

    #(CHECK_DELAY);
    check_output(1'b0, "after plus = 0, minus = 1");

    tb_d_plus_sync = 1'b0;
    tb_d_minus_sync = 1'b0;

    #(CHECK_DELAY);
    check_output(1'b1, "after plus = 0, minus = 0");

  end
endmodule
