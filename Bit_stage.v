module Bit_stage (input x, y, c0, output G, P, s);	

	assign G = x & y;
	assign P = x ^ y;
	assign s = P ^ c0;

endmodule
