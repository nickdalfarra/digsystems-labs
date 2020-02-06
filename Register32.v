module Register (clear, clk, r1in, D, Q);

   input clear;
   input clk;
   input r1in;
   input [31:0] D;
   output [31:0] Q;
   reg [31:0] 	 register;

   always @(posedge clk)
     begin
	if (clear == 1)
	  begin
	     register = 0;
	  end else if (r1in == 1)
	    begin
	       register = D;
	    end
     end
   
   assign Q[31:0] = register[31:0];
   
endmodule 
