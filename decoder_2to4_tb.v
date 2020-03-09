module decoder_2to4_tb();

	reg clk = 1'b0;
	reg [1:0] in;
	wire [3:0] out;
	
	decoder_2to4 dut(out, in);
	
	initial forever #10 clk = ~clk;

	always @(posedge clk) begin
		in = 0; #20;
		in = 1; #20;
		in = 2; #20;
		in = 3; #20;
	end
	
endmodule
