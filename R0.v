module R0 (clear, clk, R0in, BAout, D, Q);

   input clear;
   input clk;
   input R0in;
   input BAout;
   input [31:0] D;
   output [31:0] Q;
   reg [31:0] 	 register;

   genvar 	 gi;

   always @(posedge clk)
     begin
	if (clear == 1)
	  begin
	     register = 0;
	  end else if (R0in == 1)
	    begin
	       register = D;
	    end
     end

   // Produce output
   generate
      for (gi = 0; gi < 32; gi = gi + 1) begin : gen_out
	 and(Q[gi], ~BAout, register[gi]);
      end
   endgenerate
   
endmodule
