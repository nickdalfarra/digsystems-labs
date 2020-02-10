module Divider32bit (input [31:0] Qin, Min, output [63:0] result, output diverror);

	// REMOVE TEST

	/*Implements non-restoring division on 32-bit 2's complement values. Q is the dividend,
	M is the divisor (so we're calculating Q/M). Upper 32 result bits are the remainder, and 
	the lower 32 hold the value of the quotient. */
	
	reg [31:0] Q; // Dividend	
	reg [31:0] M; // Divisor
	reg [32:0] A; // Holds remainder when finished. Contains extra sign bit.
	
	reg Qisneg;
	reg Misneg;
	reg [31:0] Mneg; // needs to be same size as A??
	
	reg divbyzero; // bonus points???
	
	integer i;
	
	always @(*) begin
		
		// TODO: add divby0 output
		if (Min == 0)
			divbyzero = 1;
		else
			divbyzero = 0;
		
		// Make Q positive Qin, remember Qin sign
		Qisneg = Qin[31];
		
		if (Qin[31] == 1) // condition on input to reduce gate delays
			Q = Qin*(-1);
		else
			Q = Qin;
		
		// Make M positive Min, remember Min sign
		Misneg = Min[31];
		
		if (Min[31] == 1) begin // consider generating both and using MUX select to reduce delay
			Mneg = Min;
			M = Min*(-1);
		end else begin 
			M = Min;
			Mneg = Min*(-1);
		end
		
		
		// Perform non-restoring division
		A = 0;
				
		for (i=0; i<32; i = i + 1) begin
		
			A = A*2;	A[0] = Q[31]; Q = Q*2; // Left shifts
			
			if (A[32] == 0) 
				A = A + {1'b1,Mneg}; // Perform sign extension
			else
				A = A + {1'b0,M}; // Late restore
			
			// Set q0
			if (A[32] == 1)
				Q[0] = 0;
				//A = A + M; // leave proper positive remainder // YOU DO NOT BELONG HERE
			else
				Q[0] = 1;
		end
		
		if (A[32] == 1)
			A = A + {1'b0,M}; // leave positive remainder
		
		if (Qisneg ^ Misneg == 1) begin
			Q = Q*(-1);
			A = A*(-1);
		end
			
			
	end
	
	assign result[63:0] = {A[31:0], Q[31:0]};
	assign diverror = divbyzero;
	
endmodule
