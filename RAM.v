module RAM (input read, write, inout [31:0] data, input [8:0] addr);

	reg [31:0] mem [0:(1<<8)-1]; 
	
	assign data = (read == 1) ? mem[addr] : 32'bz;
	
	// Assign values in ram here
	initial begin
	   // For load
		 mem[0] <= 'h00800055;
		 mem[85] <= 'h00000002;
		// For store
		//mem[0] <= 'h1080005A;
	end
	
	always @(*) begin
		if (read && write) begin $display("Error: both read and write enabled in RAM."); end
		else if (write == 1) mem[addr] <= data;
	end

endmodule
