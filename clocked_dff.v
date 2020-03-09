module clocked_dff(output reg q, output qbar, input D, clk);

	assign qbar = ~q;

	initial begin
		q <= 0;
	end

	always @(posedge clk) begin
		
		if (D == 0)
			q <= 0;
		else if (D == 1)
			q <= 1;
		
	end

endmodule
