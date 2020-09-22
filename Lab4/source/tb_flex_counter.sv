// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_flex_counter();

  // Define local parameters used by the test bench
  localparam  CLK_PERIOD    = 1;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts
  
  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg [1:0] tb_rollover_val;
  reg [1:0] tb_count_out;
  wire tb_rollover_flag;
  
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
    input logic [1:0] expected_count;
    input logic  expected_flag;
    input string check_tag;
  begin
    if(expected_count == tb_count_out && expected_flag == tb_rollover_flag) begin // Check passed
      $info("Correct synchronizer output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect synchronizer output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

  // Task to sychronously clear the counter
  task clear_DUT;
  begin
    @(negedge tb_clk);
    tb_clear = 1'b1;
    @(negedge tb_clk);
    tb_clear = 1'b0;
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
  flex_counter #(.NUM_CNT_BITS(2)) DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear),
	 .count_enable(tb_count_enable), .count_out(tb_count_out), .rollover_val(tb_rollover_val),
	 .rollover_flag(tb_rollover_flag));
  
  // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;                 // Initialize reset to be inactive
    tb_clear  = 1'b0;                 // Initialize clear to be inactive
    tb_count_enable = 1'b0;           // Initialize count_enable to be inactive
    tb_rollover_val = 2'b0;           // Initialize rollover_val to be inactive
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
    tb_clear  = 1'b0; // Set to be the the non-reset value
    tb_count_enable = 1'b0;
    tb_rollover_val = 2'b0;
    tb_n_rst  = 1'b0;    // Activate reset
    
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_output(2'b0, 1'b0, 
                  "after reset applied");
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output(2'b0, 1'b0, 
                 "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    #(2 * FF_HOLD_TIME);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_output(2'b0, 1'b0, 
                  "after reset was released");

    // ************************************************************************
    // Test Case 2: Continuous Counting
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Continuous counting from [0,2]";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = 1'b0;
    tb_count_enable = 1'b0;
    tb_rollover_val = 2'd3;
    reset_dut();
   
    check_output(2'd0, 1'b0, "initial count_out");

    // Assign test case stimulus
    @(negedge tb_clk);
    tb_count_enable = 1'b1;

    // Should be 1
    @(posedge tb_clk);
    #(CHECK_DELAY);
    check_output(2'd1, 1'b0, "after processing delay");

    @(posedge tb_clk);
    #(CHECK_DELAY);
    check_output(2'd2, 1'b0, "after processing delay");

    // ************************************************************************    
    // Test Case 3: Rollover at 3
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover at 3";

    @(posedge tb_clk);
    #(CHECK_DELAY);
    check_output(2'd3, 1'b1, "after processing delay");

    @(posedge tb_clk);
    #(CHECK_DELAY);
    check_output(2'd0, 1'b0, "after processing delay");

    // ************************************************************************
    // Test Case 4: Discontinuous Counting
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Discontinuous Counting";

    @(posedge tb_clk);
    #(CHECK_DELAY);
    check_output(2'd1, 1'b0, "after processing delay");
    
    @(negedge tb_clk);
    tb_count_enable = 1'b0;

    @(posedge tb_clk);
    #(CHECK_DELAY);
    check_output(2'd1, 1'b0, "after processing delay");
    
    @(negedge tb_clk);
    tb_count_enable = 1'b1;

    // ************************************************************************
    // Test Case 5: Clear over Count Enable Priority
    // ************************************************************************    
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Clear over Count Enable Priority";

    // Assign test case stimulus
    clear_DUT();
    check_output(1'b0, 1'b0, "after clearing");

  end
endmodule
