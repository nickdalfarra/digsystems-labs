module conff_logic_tb();

	reg [31:0] ir = 32'b0;
	reg [31:0] bus = 32'b0;
	reg clk = 0;
	wire out;
	
	conff_logic dut (out, bus, ir, clk);
	
	initial forever #10 clk = ~clk;
	
	always @(posedge clk) begin
		#5;
		ir <= {11'b0, 2'b0, 19'b0}; // brzr
		bus <= 32'b0; #20;
		bus <= bus + 1; #20;
		
		ir <= {11'b0, 2'b1, 19'b0}; // brnz
		bus <= bus + 1; #20;
		bus <= 32'b0; #20;
		
		ir <= {11'b0, 2'b10, 19'b0}; // brpl
		bus <= bus + 1; #20;
		bus <= -10; #20;
		
		ir <= {11'b0, 2'b11, 19'b0}; // brmi
		bus <= -10; #20;
		bus <= 12; #20;
	
	end

endmodule
