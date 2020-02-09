module Register64 (clear, clk, Rin, D, Q);

   input clear;
   input clk;
   input Rin;
   input [63:0] D;
   output [63:0] Q;
   reg [63:0] 	 register;

   always @(posedge clk)
     begin
	if (clear == 1)
	  begin
	     register = 0;
	  end else if (Rin == 1)
	    begin
	       register = D;
	    end
     end
   
   assign Q = register;
   
endmodule
