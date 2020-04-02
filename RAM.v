module RAM (input read, write, inout [31:0] data, input [8:0] addr);

	//(* ram_init_file = "ram.mif" *) 
	reg [31:0] mem [0:(1<<8)-1]; ///*synthesis ram_init_file = "ram.mif"*/;
	
	assign data = (read == 1) ? mem[addr] : 32'bz;
	
	initial begin
		mem[0] <= 'h00800055;
		mem[85] <= 'h00000002;
	end
	
	always @(*) begin
		$display("%h",mem[0]);
		if (read && write) begin $display("Error: both read and write enabled in RAM."); end
		else if (write == 1) mem[addr] <= data;
	end

endmodule
