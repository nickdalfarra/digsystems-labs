module RAM_tb();

	reg clk = 1'b0;

	reg we = 1'b0; 
	reg re = 1'b0; //we: write enable, re: output enable
	reg [8:0] addr = 0;
	reg [31:0] data = 1;
	wire [31:0] data_wire;
	
	assign data_wire = (we == 1) ? data: 32'bz;
	
	RAM dut (we, re, addr, data_wire);
	
	initial begin
		forever #10 clk = ~clk;
	end
	
	always @(posedge clk) begin
	
		re = 0; #10;
		we = 1; #10;
		
		// write 1, 2, and 4 to addresses 0, 1, and 2
		we = 0; data = data<<<1; addr = addr + 1; #10;
		we = 1; #10;
		we = 0; data = data<<<1; addr = addr + 1; #10;
		we = 1; #10;
		we = 0; data = data<<<1; addr = addr + 1; #10;
		we = 1; #10;
		
		we = 0; #10;
		re = 1; #10;
		
		addr = 0;  #10;
		addr = addr + 1; #10;
		addr = addr + 1; #10;
		addr = addr + 1; #10;
		
	end
	
endmodule
