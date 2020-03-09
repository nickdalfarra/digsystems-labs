module clocked_dff_tb();

	reg clk = 0;
	reg d = 0;
	wire q, qbar;
	
	clocked_dff dut (q, qbar, d, clk);
	
	initial begin
		forever #10 clk = ~clk;
	end
	
	always @(posedge clk) begin
		d = 0; #7;
		d = 1; #7;
		d = 0; #7;
		d = 1; #7;
		d = 0; #7;
		d = 1; #7;
		d = 0; #7;
		d = 1; #7;
		d = 0; #7;
		d = 1; #7;
	end

endmodule
