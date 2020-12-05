// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_decoder();

  // Define local parameters used by the test bench
  localparam  CLK_PERIOD    = 10;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts
  
  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_d_plus_sync;
  reg tb_shift_enable;
  reg tb_eop;
  wire tb_d_orig;
  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;
  
  // Task for standard DUT reset procedure
  task reset_dut;
  begin
    @(negedge tb_clk);
    // Activate the reset
    tb_n_rst = 1'b0;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  // Task to cleanly and consistently check DUT output values
  task check_output;
    input logic expected_d_orig;
    input string check_tag;
  begin
    if(expected_d_orig == tb_d_orig) begin // Check passed
      $info("Correct decoder output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect decoder output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

  // Task to sychronously clear the counter
  task clear_dut;
  begin
    @(negedge tb_clk);
    tb_eop = 1'b1;
    @(negedge tb_clk);
    tb_eop = 1'b0;
  end
  endtask

  // Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end
  
  // DUT Port map
  decoder DUT(.clk(tb_clk), .n_rst(tb_n_rst), .eop(tb_eop), .shift_enable(tb_shift_enable), .d_plus_sync(tb_d_plus_sync), .d_orig(tb_d_orig));
  
  // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;                 // Initialize reset to be inactive
    tb_eop    = 1'b0;
    tb_shift_enable = 1'b0;
    tb_d_plus_sync  = 1'b1;
    tb_test_num = 0;                  // Initialize test case counter
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;
    tb_stream_check_tag = "N/A";

    // Wait some time before starting first test case
    #(0.1);
    
    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus

    #(0.1);
    // Apply test case initial stimulus
    tb_eop  = 1'b0; // Set to be the the non-reset value
    tb_shift_enable = 1'b0;
    tb_d_plus_sync = 1'b1;
    tb_n_rst  = 1'b0;    // Activate reset
    
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_output(1'b1, "after reset applied");
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output(1'b1, "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    #(2 * FF_HOLD_TIME);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_output(1'b1, "after reset was released");

    // ************************************************************************
    // Test Case 2: Normal Operation
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Normal Operation";

    tb_eop = 1'b0;
    tb_shift_enable = 1'b0;
    tb_d_plus_sync = 1'b1;

    reset_dut();

    tb_d_plus_sync = 1'b0;
    tb_shift_enable = 1'b0;

    #(CHECK_DELAY);
    check_output(1'b0, "after setting d_plus_sync low");

    @(negedge tb_clk);
    tb_shift_enable = 1'b1;
    @(posedge tb_clk);
    
    #(CHECK_DELAY);
    check_output(1'b1, "after setting shifting in");

    @(negedge tb_clk);
    tb_eop = 1'b1;
    @(posedge tb_clk);
    
    #(CHECK_DELAY);
    check_output(1'b0, "after setting eop high");

    @(negedge tb_clk);
    tb_eop = 1'b0;
    @(posedge tb_clk);

    #(CHECK_DELAY);
    check_output(1'b1, "after setting eop low");

  end
endmodule
