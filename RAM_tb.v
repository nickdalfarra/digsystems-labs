module RAM_tb();

	reg clk = 1'b0;

	reg re = 1'b0; //we: write enable, re: output enable
	reg we = 1'b0; 
	reg [8:0] addr = 0;
	reg [31:0] data = 1;
	wire [31:0] data_wire;
	
	assign data_wire = (we == 1) ? data : 32'bz;
	
	RAM dut (re, we, data_wire, addr);
	
	initial forever #10 clk = ~clk;
	
	always @(posedge clk) begin
	
	 
		re = 1; we = 0; #10;
		addr = addr + 1; #10;
		addr = addr + 1; #10;
		addr = addr + 1; #10;
		addr = addr + 1; #10; //Scan the first 5 addresses
		
		re = 0; addr = 0; #10;
		
		we = 1; #10; // write 1 to addr 0
		addr = addr + 1; data <= data*2; #10; // write 2 to address 1
		addr = addr + 1; data <= data*2; #10; // ...
		addr = addr + 1; data <= data*2; #10; // ...
		addr = addr + 1; data <= data*2; #10; // write 16 to address 4
		
		we = 0; addr = 0; #10;
		
		re = 1; we = 0; #10;
		addr = addr + 1; #10;
		addr = addr + 1; #10;
		addr = addr + 1; #10;
		addr = addr + 1; #10; //Scan the first 5 addresses
		
		we = 1; #10; // try to read and write both at once
		we = 0; re = 0; addr = 0;
				
	end
	
endmodule
