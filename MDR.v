module MDR (input clr, clk, mdrin, input [31:0] D, output [31:0] Q);
   reg [31:0] Q_r;
   
   always @(posedge clk) begin
      if (clr == 1)
	Q_r = 0;
      else if (mdrin == 1)
	Q_r = D;
   end

   assign Q = Q_r;
   
endmodule // MDR
