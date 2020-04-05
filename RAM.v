module RAM (input read, write, inout [31:0] data, input [8:0] addr);

	reg [31:0] mem [0:(1<<8)-1]; 
	
	assign data = (read == 1) ? mem[addr] : 32'bz;
	
	// Assign values in ram here, in further stages, would use .mif file
	// Belatedly realized it would be much more efficient to assign each to a different address
	// I'm in too deep now and out of time 
	initial begin
	   // For ld R1, $85
		 //mem[0] <= 'h00800055;
		 //mem[85] <= 'h00000002;
		// For st $90, R1
		//mem[0] <= 'h1080005A; 
		// For st $90(R1), R1
		//mem[0] <= 'h1088005A;
		// For addi R2, R1, -5
		//mem[0] <= 32'h590FFFFB;
		// For andi/ori R2, R1, $26
		//mem[0] <= 32'h5908001A;
		// For jr R1
		//mem[0] <= 32'h98800000;
		// For jal R1
		// mem[0] <= 32'hA0800000;
		// For mfhi R1
		 //mem[0] <= 32'hB8800000;
		// For mflo R1
		// mem[0] <= 32'hC0800000;
		// For out R1
		// mem[0] <= 32'hB0800000;
		// For in R1
		mem[0] <= 32'hA8800000;
	end
	
	always @(*) begin
		if (read && write) begin $display("Error: both read and write enabled in RAM."); end
		else if (write == 1) mem[addr] <= data;
	end

endmodule
