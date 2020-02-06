module Bit_stage (input x, y, c, output G, output P, output s);	
   and(G, x, y);
   xor(P, x, y);
   xor(s, P, c);	 
endmodule
