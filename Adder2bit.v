module Adder2bit (input wire X, Y, output wire XandY);
	
	reg result;
	
	always @(*) begin
	
		result = X & Y;
	
	end
	
	assign XandY = result;
	
endmodule
