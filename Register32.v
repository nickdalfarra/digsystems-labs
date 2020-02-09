module Register32 (clear, clk, Rin, D, Q);

   input clear;
   input clk;
   input Rin;
   input [31:0] D;
   output [31:0] Q;
   reg [31:0] 	 register;

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
   
   assign Q[31:0] = register[31:0];
   
endmodule 
