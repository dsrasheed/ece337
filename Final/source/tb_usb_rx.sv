// 337 TA Provided Lab 4 Testbench
// This code serves as a starer test bench for the synchronizer design
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

// 0.5um D-FlipFlop Timing Data Estimates:
// Data Propagation delay (clk->Q): 670ps
// Setup time for data relative to clock: 190ps
// Hold time for data relative to clock: 10ps

`timescale 1ns / 10ps

module tb_usb_rx();

  // Define local parameters used by the test bench
  localparam  CLK_PERIOD = 10;
  localparam  BIT_PERIOD = 83.33; // 12 MHz
  localparam  OUT   = {4'b1110, 4'b0001};
  localparam  IN    = {4'b0110, 4'b1001};
  localparam  DATA0 = {4'b1100, 4'b0011};
  localparam  DATA1 = {4'b0100, 4'b1011};
  localparam  ACK   = {4'b1101, 4'b0010};
  localparam  NAK   = {4'b0101, 4'b1010};
  localparam  STALL = {4'b0001, 4'b1110};
  localparam  SYNC_BYTE = 8'h80;
  localparam  VALID_ADDR = 8'b0;
  localparam  VALID_ENDP = 8'b0;
  
  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_d_plus;
  reg tb_d_minus;
  wire [3:0] rx_packet;
  wire [6:0] address;
  wire [3:0] endpoint;
  wire [7:0] packet_data;
  wire w_enable, rcving, r_error;
  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  
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
    // Wait for negativess clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  task check_token;
    input logic [3:0] expected_pid;
    input logic [6:0] expected_address;
    input logic [3:0] expected_endpoint;
    input logic expected_r_error;
    input logic expected_rcving;
    input string check_tag;
  begin
    check_output(expected_pid, expected_r_error, expected_rcving, check_tag);

    if (expected_address == address) begin
      $info("Correct address output %s during %s test case", check_tag, tb_test_case);
    end
    else begin
      $error("Incorrect address output %s during %s test case", check_tag, tb_test_case);
    end
    if (expected_endpoint == endpoint) begin
      $info("Correct endpoint output %s during %s test case", check_tag, tb_test_case);
    end
    else begin
      $error("Incorrect endpoint output %s during %s test case", check_tag, tb_test_case);
    end

  end
  endtask

  task check_output;
    input logic [3:0] expected_pid;
    input logic expected_r_error;
    input logic expected_rcving;
    input string check_tag;
  begin
    if (expected_r_error == r_error) begin
      $info("Correct r_error output %s during %s test case", check_tag, tb_test_case);
    end
    else begin
      $error("Incorrect r_error output %s during %s test case", check_tag, tb_test_case);
    end
    if (expected_rcving == rcving) begin
      $info("Correct rcving output %s during %s test case", check_tag, tb_test_case);
    end
    else begin
      $error("Incorrect rcving output %s during %s test case", check_tag, tb_test_case);
    end

    check_pid(expected_pid, check_tag);
  end
  endtask

  task check_pid;
    input logic [3:0] expected_rx_packet;
    input string check_tag;
  begin
    if(expected_rx_packet == rx_packet) begin // Check passed
      $info("Correct rx_packet output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect rx_packet output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask


  bit two_behind;
  bit one_behind;
  int num_ones;
  int stuff;
  int prev_was_stuff;
  task send_bits;
    input bit bits[]; // First bit must be 0.
  begin
    num_ones = 0;
    stuff = 0;
    prev_was_stuff = 0;

    num_ones = 0;

    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;
    #(BIT_PERIOD);

    one_behind = 1'b1;
    two_behind = 1'b1;

    for (int i = 0; i < bits.size(); i++) begin
      two_behind = one_behind;
      one_behind = tb_d_plus;
      if (prev_was_stuff) begin
        tb_d_plus = bits[i] == 1'b1 ? two_behind : ~two_behind;
      end
      else begin
        if (stuff == 1) begin
          tb_d_plus = ~one_behind;
          i--;
        end
        else begin
          tb_d_plus = bits[i] == 1'b1 ? one_behind : ~one_behind;
        end
      end

      if (bits[i] == 1 && !stuff && !prev_was_stuff) begin
        num_ones++;
      end
      else begin
        num_ones = 0;
      end

      if (prev_was_stuff) begin
        prev_was_stuff = 0;
      end

      if (stuff) begin
        prev_was_stuff = 1;
        stuff = 0;
      end

      if (num_ones == 5) begin
        stuff = 1;
      end

      tb_d_minus = ~tb_d_plus;
      
      #(BIT_PERIOD);
    end

  end
  endtask

  task send_eop;
  begin
    tb_d_plus = 1'b0;
    tb_d_minus = 1'b0;
    #(BIT_PERIOD * 2);

    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;
    #(BIT_PERIOD);
  end
  endtask

  task send_packet;
    input bit [7:0] bytes[];
  begin
    bit bits[];
    bits = new[bytes.size() * 8];

    for (int i = 0; i < bytes.size(); i++) begin
      for (int j = 0; j < 8; j++) begin
        bits[8*i+j] = bytes[i][j];
      end
    end

    send_bits(bits);
    send_eop();
  end
  endtask

  task check_data_packet;
    input bit [7:0] bytes[];
    input string check_tag;
  begin
    int i;
    int prev_time;
    i = 0;
    prev_time = 0;

    fork
      begin
        send_packet(bytes);
      end

      while (1'b1) begin
        @(negedge w_enable);

        if ($time != prev_time) begin

          if (packet_data == bytes[2+i]) begin
            $info("Correct packet data %s during %s test case", check_tag, tb_test_case);
          end
          else begin // Check failed
            $error("Incorrect packet data %s during %s test case", check_tag, tb_test_case);
          end

          i++;
          prev_time = $time;
        end
      end
    join_any

    if (i == bytes.size() - 4) begin
      $info("Correct w_enable did output the right # times %s during %s test case", check_tag, tb_test_case);
    end
    else begin
      $error("Incorrect w_enable did not output the right # times %s during %s test case", check_tag, tb_test_case);
    end

  end
  endtask

  task check_data_packet_bits;
    input bit bits[];
    input bit [7:0] bytes[];
    input string check_tag;
  begin
    int i;
    int prev_time;
    i = 0;
    prev_time = 0;

    fork
      begin
        send_bits(bits);
        send_eop();
      end

      while (1'b1) begin
        @(negedge w_enable);

        if ($time != prev_time) begin
          $info("%h == %h", packet_data, bytes[2+i]);
          if (packet_data == bytes[2+i]) begin
            $info("Correct packet data %s during %s test case", check_tag, tb_test_case);
          end
          else begin // Check failed
            $error("Incorrect packet data %s during %s test case", check_tag, tb_test_case);
          end

          i++;
          prev_time = $time;
        end
      end
    join_any

    if (i == bytes.size() - 4) begin
      $info("Correct w_enable did output the right # times %s during %s test case", check_tag, tb_test_case);
    end
    else begin
      $error("Incorrect w_enable did not output the right # times %s during %s test case", check_tag, tb_test_case);
    end
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
  usb_rx DUT(.clk(tb_clk), .n_rst(tb_n_rst), .d_plus(tb_d_plus), .d_minus(tb_d_minus), .rx_packet(rx_packet), .address(address), .endpoint(endpoint), 
        .packet_data(packet_data), .w_enable(w_enable), .rcving(rcving), .r_error(r_error));

  bit [7:0] packet[];
  
  // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;                 // Initialize reset to be inactive
    tb_test_num = 0;                  // Initialize test case counter
    tb_d_plus = 1'b1;
    tb_d_minus = 1'b0;
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;

    // Wait some time before starting first test case
    #(0.1);
    /*
    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus

    #(0.1);
    // Apply test case initial stimulus
    tb_n_rst  = 1'b0;    // Activate reset
    
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    /*check_output(4'b0, 1'b0, 
                  "after reset applied");*/
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    /*check_output(4'b0, 1'b0, 
                 "after clock cycle while in reset");*/
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    //#(2 * FF_HOLD_TIME);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    /*
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_output(4'b0, 1'b0, 
                  "after reset was released");*/
    
    // ************************************************************************
    // Test Case 2: Identify PID
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Identify PID";

    reset_dut();

    packet = new[4];
    packet = {SYNC_BYTE, OUT, VALID_ADDR, VALID_ENDP};

    send_packet(packet);
    check_pid(OUT, "after sending OUT packet");

    packet = {SYNC_BYTE, IN, VALID_ADDR, VALID_ENDP};
    send_packet(packet);
    check_pid(IN, "after sending IN packet");

    packet = new[5];
    packet = {SYNC_BYTE, DATA0, 8'b0, 8'b0, 8'b0};
    send_packet(packet);
    check_pid(DATA0, "after sending DATA0 packet");

    packet = {SYNC_BYTE, DATA1, 8'b0, 8'b0, 8'b0};
    send_packet(packet);
    check_pid(DATA1, "after sending DATA1 packet");

    packet = new[2];
    packet = {SYNC_BYTE, ACK};
    send_packet(packet);
    check_pid(ACK, "after sending ACK packet");

    packet = new[2];
    packet = {SYNC_BYTE, NAK};
    send_packet(packet);
    check_pid(NAK, "after sending NAK packet");

    // ************************************************************************
    // Test Case 3: Valid Token Packets
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Valid Token";

    reset_dut();

    packet = new[4];
    packet = {SYNC_BYTE, IN, VALID_ADDR, VALID_ENDP};

    send_packet(packet);
    check_token(IN, VALID_ADDR, VALID_ENDP, 1'b0, 1'b0, "after sending IN Packet");

    packet = {SYNC_BYTE, OUT, VALID_ADDR, VALID_ENDP};
    send_packet(packet);
    check_token(OUT, VALID_ADDR, VALID_ENDP, 1'b0, 1'b0, "after sending OUT Packet");

    // ************************************************************************
    // Test Case 3: Valid ACK
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Valid ACK";

    reset_dut();

    packet = new[2];
    packet = {SYNC_BYTE, ACK};

    send_packet(packet);
    check_output(ACK, 1'b0, 1'b0, "after sending ACK Packet");

    // ************************************************************************
    // Test Case 4: Valid Data Packets
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Valid Data Bytes";

    reset_dut();

    packet = new[4];
    packet = {SYNC_BYTE, DATA0, 8'b0, 8'b0};
    check_data_packet(packet, "while sending data packet with 0 bytes");
    check_output(DATA0, 1'b0, 1'b0, "after sending data packet with 0 bytes");

    packet = new[7];
    packet = {SYNC_BYTE, DATA1, 8'h56, 8'h48, 8'h98, 8'h23, 8'h29};
    check_data_packet(packet, "while sending data packet with 1 byte");
    check_output(DATA1, 1'b0, 1'b0, "after sending data packet with 1 byte");

    packet = new[6];
    packet = {SYNC_BYTE, DATA0, 8'hff, 8'h00, 8'h98, 8'hff};
    check_data_packet(packet, "while sending data packet with 2 bytes");
    check_output(DATA0, 1'b0, 1'b0, "after sending data packet with 2 bytes");

    packet = new[9];
    packet = {SYNC_BYTE, DATA0, 8'hff, 8'h00, 8'h98, 8'h34, 8'h45, 8'h12, 8'hff};
    check_data_packet(packet, "while sending data packet with 5 bytes");
    check_output(DATA0, 1'b0, 1'b0, "after sending data packet with 5 bytes");

    // ************************************************************************
    // Test Case 4: Invalid SYNC
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Invalid SYNC";

    reset_dut();

    packet = new[2];
    packet = {8'b1, ACK};
    send_packet(packet);
    check_output('1, 1'b1, 1'b0, "after sending invalid SYNC byte");

    // ************************************************************************
    // Test Case 5: Invalid PID
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Invalid PID";

    reset_dut();

    packet = new[2];
    packet = {SYNC_BYTE, 8'd1};
    send_packet(packet);
    check_output('1, 1'b1, 1'b0, "after sending invalid PID");

    // ************************************************************************
    // Test Case 6: Wrong Number of Bytes in Token Packet
    // ************************************************************************ 
    @(negedge tb_clk);
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Wrong number of bytes in token packet";

    reset_dut();

    packet = new[2];
    packet = {SYNC_BYTE, OUT};
    send_packet(packet);
    check_output(OUT, 1'b1, 1'b0, "after sending token packet w/ only 1 byte");

    packet = new[3];
    packet = {SYNC_BYTE, OUT, 8'd0};
    send_packet(packet);
    check_output(OUT, 1'b1, 1'b0, "after sending token packet w/ only 2 bytes");

    packet = new[5];
    packet = {SYNC_BYTE, OUT, 8'd0, 8'd0, 8'd0};
    send_packet(packet);
    check_output(OUT, 1'b1, 1'b0, "after sending token packet w/ more than 3 bytes");

    // ************************************************************************
    // Test Case 7: Wrong Number of Bytes in ACK Packet
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Wrong number of bytes in ACK Packet";

    reset_dut();

    packet = new[3];
    packet = {SYNC_BYTE, ACK, 8'b0};
    send_packet(packet);
    check_output(ACK, 1'b1, 1'b0, "after sending ACK packet w/ more than 2 bytes");


    // ************************************************************************
    // Test Case 8: Wrong Number of Bytes in Data Packet
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Wrong number of bytes in Data Packet";

    reset_dut();

    packet = new[2];
    packet = {SYNC_BYTE, DATA0};
    send_packet(packet);
    check_output(DATA0, 1'b1, 1'b0, "after sending Data packet w/ only 2 bytes");

    packet = new[3];
    packet = {SYNC_BYTE, DATA0, 8'b0};
    send_packet(packet);
    check_output(DATA0, 1'b1, 1'b0, "after sending Data packet w/ only 3 bytes");

    // ************************************************************************
    // Test Case 9: Invalid Address and Endpoints
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Invlaid Address and Endpoints";

    reset_dut();

    packet = new[4];
    packet = {SYNC_BYTE, IN, 8'd90, 8'd13};
    send_packet(packet);
    check_output(IN, 1'b0, 1'b0, "after sending Token packet with invalid address and endpoints");

    // ************************************************************************
    // Test Case 10: Premature EOPs in Data Bytes
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Premature EOPs in Data Packet";

    reset_dut();

    bits = new[8 * 2 + 5];
    bits = {0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,0};
    send_bits(bits);
    send_eop();
    check_output(DATA0, 1'b1, 1'b0, "premature EOP in the 1st data byte of data packet");

    bits = new[8 * 3 + 7];
    bits = {0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,0,1,0,1,0,1,1,1,0,1,1};
    send_bits(bits);
    send_eop();
    check_output(DATA0, 1'b1, 1'b0, "premature EOP in the 2nd data byte of data packet");

    bits = new[8 * 4 + 7];
    bits = {0,0,0,0,0,0,0,1, 1,1,0,0,0,0,1,1, 1,0,0,1,0,1,0,1, 0,1,1,1,0,1,1,1, 1,1,0,0,0,1,1};
    send_bits(bits);
    send_eop();
    check_output(DATA0, 1'b1, 1'b0, "premature EOP in the 3rd data byte of data packet");

    // ************************************************************************
    // Test Case 11: Premature EOPs in Token Bytes
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Premature EOPs in Token Bytes";

    reset_dut();

    bits = new[8 * 2 + 5];
    bits = {0,0,0,0,0,0,0,1, 1,0,0,0,0,1,1,1, 1,0,0,1,0};
    send_bits(bits);
    send_eop();
    check_output(OUT, 1'b1, 1'b0, "premature EOP in the 1st data byte of token packet");

    bits = new[8 * 2 + 7];
    bits = {0,0,0,0,0,0,0,1, 1,0,0,0,0,1,1,1, 1,0,0,1,0,1,1,1, 1,1,0,0,1,0,1};
    send_bits(bits);
    send_eop();
    check_output(OUT, 1'b1, 1'b0, "premature EOP in the 2nd data byte of token packet");

    // ************************************************************************
    // Test Case 11: Bit Stuffing in Data Packet
    // ************************************************************************ 
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Bit Stuffing in Data Packet";

    reset_dut();

    packet = new[5];
    packet = {SYNC_BYTE, DATA0, 8'hff, 8'h0, 8'h0};
    check_data_packet(packet, "Bit Stuffing");
    check_output(DATA0, 1'b0, 1'b0, "after bit stuffing");
    
  end
endmodule
