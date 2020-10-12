// $Id: $
// File name:   magnitude.sv
// Created:     10/11/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Outputs the magnitude of a number in two's complement format

module magnitude (
    input  wire [16:0] in,
    output logic  [15:0] out
); 

always_comb begin
    out = in[15:0];
    if (in[16] == 1)
        out = ~in[15:0] + 1;
end

endmodule