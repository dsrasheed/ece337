module edge_det(input clk, reset, D, output reg detect);

reg [1:0] S_Reg;
reg [1:0] S_next;

always_comb begin
	case (S_Reg)
		0: S_next = D == 0 ? 0 : 1;
		1: S_next = D == 0 ? 2 : 3;
		2: S_next = D == 0 ? 0 : 1;
		3: S_next = D == 0 ? 2 : 3;
		default: S_next = 3;
	endcase
end

always @ (posedge clk, posedge reset) begin
	if (reset == 1) begin
		S_Reg <= D == 0 ? 0 : 3;
	end
	else begin
		S_Reg <= S_next;
	end
end

always_comb begin
	case (S_Reg)
		1,2: detect = 1;
		default: detect = 0;
	endcase
end

endmodule
