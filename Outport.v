module Outport(input clr, clock, enable, input [31:0] D, output [31:0] Q);
   reg [31:0] Q_reg;

   always @(posedge clock)
     begin
	if (clr == 1)
	  Q_reg = 0;
	else if (enable == 1)
	  Q_reg = D;
     end

   assign Q = Q_reg;
   
endmodule // Outport
