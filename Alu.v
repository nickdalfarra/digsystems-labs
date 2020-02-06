
module Alu (input clk, input AND, OR, ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, NEG, NOT, input [31:0] A, B, output [31:0] C);
   
   reg [31:0] ALU_result;
   reg 	      c_in = 0;
   wire 	      c_out;
	      
   assign C = ALU_result;

   always @(posedge clk)
     begin
	if (AND == 1) begin
	   ALU_result = A & B;
	end
	else if (OR == 1) begin
	   ALU_result = A | B;
	end
	else if (ADD == 1) begin
	end
	else if (SUB == 1) begin
	   
	end
	else if (MUL == 1) begin

	end
	else if (DIV == 1) begin

	end
	else if (SHR == 1) begin
	   ALU_result = A >> B;
	end
	else if (SHL == 1) begin
	   ALU_result = A << B;
	end
	else if (ROR == 1) begin
	end
	else if (ROL == 1) begin
	end
	else if (NEG == 1) begin
	   ALU_result = -B;
	end
	else if (NOT == 1) begin
	   ALU_result = ~B;
	end
     end
   
endmodule
