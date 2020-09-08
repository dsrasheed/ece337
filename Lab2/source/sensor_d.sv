// $Id: $
// File name:   sensor_d.sv
// Created:     9/1/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Dataflow Implementation of Sensor Error Detector

module sensor_d(
	input [3:0] sensors,
	output error
);

assign error = sensors[0] | sensors[1] & (sensors[2] | sensors[3]);

endmodule
