// $Id: $
// File name:   eop_det.sv
// Created:     12/2/2020
// Author:      Daniyaal Rasheed
// Lab Section: 8
// Version:     1.0  Initial Design Entry
// Description: Detects when an eop occurs.

module eop_det (
	input d_plus_sync, d_minus_sync,
	output eop
);

assign eop = ~d_plus_sync & ~d_minus_sync;

endmodule
