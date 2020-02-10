module Divider32bit_tb();

	reg clk = 1;

	reg [31:0] Q, M;
	wire [31:0] remainderout, quotientout;
	
	// REMOVE
	wire diverror;
	
	Divider32bit dut (Q, M, {remainderout,quotientout}, diverror);
	
	initial begin
		$dumpfile("Divider32bit_tb.vcd");
      $dumpvars(0, dut);
		forever #50 clk = ~clk;
	end
	
	initial begin
		#500 $finish;
	end
	
	always @(posedge clk) begin
	
		Q = -3; M = 2; #50;
		Q = -5; M = 0; #50;
		Q = -7; M = 2; #50;
		
		Q = -3; M = -2; #50;
		Q = -5; M = -2; #50;
		Q = -7; M = -2; #50;
	
		/*// output should be Q w/ remainder 0
		Q = 0; M = 1; #50;
		Q = 1; M = 1; #50;
		Q = 2; M = 1; #50;
		Q = 3; M = 1; #50;
		
		// output should be 2 w remainder 0
		Q = 2; M = 1; #50;
		Q = 4; M = 2; #50;
		Q = 8; M = 4; #50;
		
		// Q = 1, A is phat
		Q = 2000000001; M = 2000000000; #50;*/
	
	end

endmodule
