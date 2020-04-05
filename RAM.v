module RAM (input read, write, inout [31:0] data, input [8:0] addr);
	reg [31:0] mem [0:(1<<8)-1];
	
	assign data = (read == 1) ? mem[addr] : 32'bz;
	
	initial begin
		//mem[0] <= 'h00800055; // for ld instruction
		// mem[85] <= 'h00000002;
		
		//mem[0] <= 'h08800055; // for ldi instruction Case 3
		//mem[0] <= 'h08080023; // ldi Case 4
		
		mem[0] <= 'h48800023; // 
		
	end
	
	always @(*) begin
		if (read && write) begin $display("Error: both read and write enabled in RAM."); end
		else if (write == 1) mem[addr] <= data;
	end

endmodule
