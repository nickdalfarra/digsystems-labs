module RAM (input read, write, inout [31:0] data, inout [8:0] addr);

	reg [31:0] mem [0:(1<<8)-1]; 
	
	assign data = (read == 1) ? mem[addr] : 32'bz;
	
	always @(*) begin
		if (read && write) begin $display("Error: both read and write enabled in RAM."); end
		else if (write == 1) mem[addr] <= data;
	end

endmodule
