// $Id: $
// File name:   tb_apb_slave.sv
// Created:     10/1/2018
// Author:      Tim Pritchett
// Lab Section: 9999
// Version:     1.0  Initial Design Entry
// Description: Starter bus model based test bench for the apb-slave module

`timescale 1ns / 10ps

module tb_apb_uart_rx();

// Timing related constants
localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay

// UART parameters
parameter  NORM_DATA_PERIOD  = (10 * CLK_PERIOD);
localparam OUTPUT_CHECK_DELAY = (CLK_PERIOD - 0.2);
localparam WORST_FAST_DATA_PERIOD = (NORM_DATA_PERIOD * 0.96);
localparam WORST_SLOW_DATA_PERIOD = (NORM_DATA_PERIOD * 1.04);

// Sizing related constants
localparam DATA_WIDTH      = 1;
localparam ADDR_WIDTH      = 3;
localparam DATA_WIDTH_BITS = DATA_WIDTH * 8;
localparam DATA_MAX_BIT    = DATA_WIDTH_BITS - 1;
localparam ADDR_MAX_BIT    = ADDR_WIDTH - 1;

// Define our address mapping scheme via constants
localparam ADDR_DATA_SR  = 3'd0;
localparam ADDR_ERROR_SR = 3'd1;
localparam ADDR_BIT_CR0  = 3'd2;
localparam ADDR_BIT_CR1  = ADDR_BIT_CR0 + 1;
localparam ADDR_DATA_CR  = 3'd4;
localparam ADDR_RX_DATA  = 3'd6;

// APB-Slave reset value constants
// Student TODO: Update these based on the reset values for your config registers
localparam RESET_BIT_PERIOD = '0;
localparam RESET_DATA_SIZE  = '0;

//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
// Testing setup signals
logic                          tb_enqueue_transaction;
logic                          tb_transaction_write;
logic                          tb_transaction_fake;
logic [(ADDR_WIDTH - 1):0]     tb_transaction_addr;
logic [((DATA_WIDTH*8) - 1):0] tb_transaction_data;
logic                          tb_transaction_error;
// Testing control signal(s)
logic    tb_enable_transactions;
integer  tb_current_transaction_num;
logic    tb_model_reset;
string   tb_test_case;
integer  tb_test_case_num;
integer  tb_i;
logic [13:0]     tb_test_bit_period;
logic [DATA_MAX_BIT:0] tb_test_data;
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;
logic [7:0] test_packets [];


//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;

//*****************************************************************************
// Signals
//*****************************************************************************
logic                          tb_psel;
logic [(ADDR_WIDTH - 1):0]     tb_paddr;
logic                          tb_penable;
logic                          tb_pwrite;
logic [((DATA_WIDTH*8) - 1):0] tb_pwdata;
logic [((DATA_WIDTH*8) - 1):0] tb_prdata;
logic                          tb_pslverr;
logic                          tb_serial_in;

//*****************************************************************************
// Expected Signals
//*****************************************************************************
logic [((DATA_WIDTH*8) - 1):0] tb_expected_prdata;
// Expected slave error is handled by bus module

//*****************************************************************************
// Clock Generation Block
//*****************************************************************************
// Clock generation block
always begin
  // Start with clock low to avoid false rising edge events at t=0
  tb_clk = 1'b0;
  // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
  tb_clk = 1'b1;
  // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
end

//*****************************************************************************
// Bus Model Instance
//*****************************************************************************
apb_bus BFM ( .clk(tb_clk),
          // Testing setup signals
          .enqueue_transaction(tb_enqueue_transaction),
          .transaction_write(tb_transaction_write),
          .transaction_fake(tb_transaction_fake),
          .transaction_addr(tb_transaction_addr),
          .transaction_data(tb_transaction_data),
          .transaction_error(tb_transaction_error),
          // Testing controls
          .model_reset(tb_model_reset),
          .enable_transactions(tb_enable_transactions),
          .current_transaction_num(tb_current_transaction_num),
          // APB-Slave Side
          .psel(tb_psel),
          .paddr(tb_paddr),
          .penable(tb_penable),
          .pwrite(tb_pwrite),
          .pwdata(tb_pwdata),
          .prdata(tb_prdata),
          .pslverr(tb_pslverr));


//*****************************************************************************
// DUT Instance
//*****************************************************************************
apb_uart_rx DUT ( .clk(tb_clk), .n_rst(tb_n_rst),
            // UART Operation signals
            .serial_in(tb_serial_in),
            // APB-Slave bus signals
            .psel(tb_psel),
            .paddr(tb_paddr),
            .penable(tb_penable),
            .pwrite(tb_pwrite),
            .pwdata(tb_pwdata),
            .prdata(tb_prdata),
            .pslverr(tb_pslverr));

//*****************************************************************************
// DUT Related TB Tasks
//*****************************************************************************
// Task for standard DUT reset procedure
task reset_dut;
begin
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
task check_outputs;
  input string check_tag;
begin
  tb_mismatch = 1'b0;
  tb_check    = 1'b1;

  if (tb_expected_prdata == tb_prdata) begin
    $info("Correct 'prdata' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin
    tb_mismatch = 1'b1;
    $error("Incorrect 'prdata' output %s during %s test case", check_tag, tb_test_case);
    $error("'prdata' was %d instead of %d", tb_prdata, tb_expected_prdata);
  end

  // Wait some small amount of time so check pulse timing is visible on waves
  #(0.1);
  tb_check =1'b0;
end
endtask

//*****************************************************************************
// Bus Model Usage Related TB Tasks
//*****************************************************************************
// Task to pulse the reset for the bus model
task reset_model;
begin
  tb_model_reset = 1'b1;
  #(0.1);
  tb_model_reset = 1'b0;
end
endtask

// Task to enqueue a new transaction
task enqueue_transaction;
  input logic for_dut;
  input logic write_mode;
  input logic [ADDR_MAX_BIT:0] address;
  input logic [DATA_MAX_BIT:0] data;
  input logic expected_error;
begin
  // Make sure enqueue flag is low (will need a 0->1 pulse later)
  tb_enqueue_transaction = 1'b0;
  #0.1ns;

  // Setup info about transaction
  tb_transaction_fake  = ~for_dut;
  tb_transaction_write = write_mode;
  tb_transaction_addr  = address;
  tb_transaction_data  = data;
  tb_transaction_error = expected_error;

  // Pulse the enqueue flag
  tb_enqueue_transaction = 1'b1;
  #0.1ns;
  tb_enqueue_transaction = 1'b0;
end
endtask

// Task to wait for multiple transactions to happen
task execute_transactions;
  input integer num_transactions;
  integer wait_var;
begin
  // Activate the bus model
  tb_enable_transactions = 1'b1;
  @(posedge tb_clk);

  // Process the transactions
  for(wait_var = 0; wait_var < num_transactions; wait_var++) begin
    @(posedge tb_clk);
    @(posedge tb_clk);
  end

  // Turn off the bus model
  @(negedge tb_clk);
  tb_enable_transactions = 1'b0;
end
endtask

task configure_dut;
  input logic [13:0] bit_period;
  input logic [3:0]  data_size;
begin
  enqueue_transaction(1'b1, 1'b1, ADDR_BIT_CR0, bit_period[7:0], 1'b0);
  enqueue_transaction(1'b1, 1'b1, ADDR_BIT_CR1, {2'b00, bit_period[13:8]},  1'b0);
  enqueue_transaction(1'b1, 1'b1, ADDR_DATA_CR, {4'b0, data_size},  1'b0);

  execute_transactions(3);
end
endtask

task send_packet;
    input  [7:0] data;
    input  stop_bit;
    input  time data_period;
    input  int  data_size;
    
    integer i;
  begin
    // First synchronize to away from clock's rising edge
    @(negedge tb_clk)
    
    // Send start bit
    tb_serial_in = 1'b0;
    #data_period;
    
    // Send data bits
    for(i = 0; i < data_size; i = i + 1)
    begin
      tb_serial_in = data[i];
      #data_period;
    end
    
    // Send stop bit
    tb_serial_in = stop_bit;
    #data_period;
  end
endtask

task poll;
begin
  tb_expected_prdata = 8'd0;
  while (tb_prdata == 8'd0) begin
    enqueue_transaction(1'b1, 1'b0, ADDR_DATA_SR, tb_expected_prdata, 1'b0);
    execute_transactions(1);
  end
end
endtask

//*****************************************************************************
//*****************************************************************************
// Main TB Process
//*****************************************************************************
//*****************************************************************************
initial begin
  // Initialize Test Case Navigation Signals
  tb_test_case       = "Initilization";
  tb_test_case_num   = -1;
  tb_test_data       = '0;
  tb_check_tag       = "N/A";
  tb_check           = 1'b0;
  tb_mismatch        = 1'b0;
  tb_test_bit_period = '0;
  // Initialize all of the directly controled DUT inputs
  tb_n_rst          = 1'b1;
  tb_serial_in      = 1'b1;
  // Initialize all of the bus model control inputs
  tb_model_reset          = 1'b0;
  tb_enable_transactions  = 1'b0;
  tb_enqueue_transaction  = 1'b0;
  tb_transaction_write    = 1'b0;
  tb_transaction_fake     = 1'b0;
  tb_transaction_addr     = '0;
  tb_transaction_data     = '0;
  tb_transaction_error    = 1'b0;

  // Wait some time before starting first test case
  #(0.1);

  // Clear the bus model
  reset_model();

  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;
    
  // Reset the DUT
  reset_dut();

  // Check outputs for reset state
  tb_expected_prdata     = '0;
  check_outputs("after DUT reset");

  //*****************************************************************************
  // Configure Design Test Case
  //*****************************************************************************
  tb_test_case = "Configure Design";
  tb_test_case_num = tb_test_case_num + 1;

  reset_dut();

  configure_dut(13'd10, 8'd8);

  tb_expected_prdata = 8'd10;
  enqueue_transaction(1'b1, 1'b0, ADDR_BIT_CR0, tb_expected_prdata, 1'b0);
  execute_transactions(1);
  check_outputs("after reading the least signficant bits of bit period");

  tb_expected_prdata = 8'd0;
  enqueue_transaction(1'b1, 1'b0, ADDR_BIT_CR1, tb_expected_prdata, 1'b0);
  execute_transactions(1);
  check_outputs("after reading the most signficant bits of bit period");

  tb_expected_prdata = 8'd8;
  enqueue_transaction(1'b1, 1'b0, ADDR_DATA_CR, tb_expected_prdata, 1'b0);
  execute_transactions(1);
  check_outputs("after reading the data size register");

  //*****************************************************************************
  // UART 10 cycle period, 8 bit size
  //*****************************************************************************
  tb_test_case = "10 cycle bit period, 8 bit size, Single Packet";
  tb_test_case_num = tb_test_case_num + 1;

  reset_dut();

  tb_test_bit_period = 13'd10;
  configure_dut(13'd10, 8'd8);

  fork
    send_packet(8'd170, 1'b1, 10 * CLK_PERIOD, 8);
  join_none

  poll;

  tb_expected_prdata = 8'd170;
  enqueue_transaction(1'b1, 1'b0, ADDR_RX_DATA, tb_expected_prdata, 1'b0);
  execute_transactions(1);

  check_outputs("after reading from rx data buffer");

  tb_expected_prdata = 8'b0;
  enqueue_transaction(1'b1, 1'b0, ADDR_ERROR_SR, tb_expected_prdata, 1'b0);
  execute_transactions(1);

  check_outputs("after reading from error status register");

  //*****************************************************************************
  // UART 10 cycle period, 8 bit size, framing error
  //*****************************************************************************
  tb_test_case = "10 cycle, 8 bit size, framing error";
  tb_test_case_num = tb_test_case_num + 1;

  reset_dut();

  configure_dut(13'd10, 8'd8);

  send_packet(8'b10101010, 1'b0, 10 * CLK_PERIOD, 4'd8);

  tb_expected_prdata = '1;
  enqueue_transaction(1'b1, 1'b0, ADDR_RX_DATA, tb_expected_prdata, 1'b0);
  execute_transactions(1);

  check_outputs("after reading from rx data buffer");

  tb_expected_prdata = 8'b1;
  enqueue_transaction(1'b1, 1'b0, ADDR_ERROR_SR, tb_expected_prdata, 1'b0);
  execute_transactions(1);

  check_outputs("after reading from error status register");

  //*****************************************************************************
  // UART 10 cycle period, 8 bit size, Multiple Fast Packets
  //*****************************************************************************
  tb_test_case = "10 cycle bit period, 8 bit size, Multiple Fast Packets";
  tb_test_case_num = tb_test_case_num + 1;

  reset_dut();

  configure_dut(13'd10, 8'd8);

  test_packets = new[4];
  test_packets[0] = 8'b11101010;
  test_packets[1] = 8'b11101111;
  test_packets[2] = 8'b01101101;
  test_packets[3] = 8'b01100101;

  fork begin
    for (integer i = 0; i < 4; i++) begin
      send_packet(test_packets[i], 1'b1, 10 * CLK_PERIOD * 1.04, 8);
    end
  end
  join_none

  for (integer i = 0; i < 4; i++) begin
    poll;

    tb_expected_prdata = test_packets[i];
    enqueue_transaction(1'b1, 1'b0, ADDR_RX_DATA, tb_expected_prdata, 1'b0);
    execute_transactions(1);

    check_outputs("after reading from rx data buffer");

    tb_expected_prdata = 8'b0;
    enqueue_transaction(1'b1, 1'b0, ADDR_ERROR_SR, tb_expected_prdata, 1'b0);
    execute_transactions(1);

    check_outputs("after reading from error status register");
  end

  //*****************************************************************************
  // UART 1000 cycle period, 5 bit size
  //*****************************************************************************
  tb_test_case = "1000 cycle bit period, 5 bit size, Single Packet";
  tb_test_case_num = tb_test_case_num + 1;

  reset_dut();

  configure_dut(13'd1000, 8'd5);

  test_packets = new[1];
  test_packets[0] = 8'b10100101; // Only send last 5 bits (00101)

  fork begin
    for (integer i = 0; i < test_packets.size; i++) begin
      send_packet(test_packets[i], 1'b1, 1000 * CLK_PERIOD, 5);
    end
  end
  join_none

  for (integer i = 0; i < test_packets.size; i++) begin
    poll;

    tb_expected_prdata = {3'b0, test_packets[i][4:0]};
    enqueue_transaction(1'b1, 1'b0, ADDR_RX_DATA, tb_expected_prdata, 1'b0);
    execute_transactions(1);

    check_outputs("after reading from rx data buffer");

    tb_expected_prdata = 8'b0;
    enqueue_transaction(1'b1, 1'b0, ADDR_ERROR_SR, tb_expected_prdata, 1'b0);
    execute_transactions(1);

    check_outputs("after reading from error status register");
  end

end

endmodule
