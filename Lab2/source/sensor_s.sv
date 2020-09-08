// $Id: $
// File name:   sensor_s.sv
// Created:     9/1/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Detects an error under the following conditions:
// -high priority sensor is triggered
// -low priority sensor is triggered

module sensor_s(
	input wire [3:0] sensors,
	output wire error
);

wire A1_out;
wire O1_out;

OR2X1  O1(sensors[2], sensors[3], O1_out);
AND2X1 A2(O1_out, sensors[1], A1_out);
OR2X1  O2(A1_out, sensors[0], error);

endmodule
