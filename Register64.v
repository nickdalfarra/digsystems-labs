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
	  register <= 0;
	else if (Rin == 1)
	  register <= D;
     end
   
   assign Q = register;
   
endmodule
