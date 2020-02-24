module RAM (input read, write, inout [31:0] data, inout [8:0] addr);

	reg [31:0] mem [0:(1<<8)-1];
	
	assign data = (!)

endmodule
