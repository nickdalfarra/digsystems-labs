module Inport(input clear, clock, strobe, input [31:0] D, output [31:0] Q);
   reg [31:0] Q_reg;
   
   always @(posedge clock)
     begin
	if (clear == 1)
	  Q_reg = 0;
	else if (strobe == 1)
	  Q_reg = D;
     end

   assign Q = Q_reg;
   
endmodule // Inport
