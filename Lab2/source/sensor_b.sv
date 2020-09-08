// $Id: $
// File name:   sensor_b.sv
// Created:     9/3/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Behavioral style implementation of sensor error detector

module sensor_b(input wire [3:0] sensors, output reg error);

always_comb begin
	error = 0;
	if (sensors[0])
		error = 1'b1;
	else if (sensors[1] & (sensors[2] | sensors[3]))
		error = 1'b1;
end

endmodule
