module Alu (input clk, input AND, OR, ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, NEG, NOT, IncPC, input [31:0] A, B, output [63:0] C);

   // Different wires to hold outputs of units
   wire [63:0] C_mult;
   wire [31:0] C_add;
   wire [31:0] C_sub;
   wire [63:0] C_div;

   // Wires to hold G, P, and C_32 from addition op
   // Not ever used? may get rid of them from 32-bit adder
   wire        G;
   wire        P;
   wire        c32;

   // For use in subtraction
   reg [31:0]  neg_B;
      
   reg [63:0]  ALU_result;

   Multiplier mult(A, B, C_mult);
   Cla_32 adder(A, B, 1'b0, G, P, c32, C_add);
   Cla_32 subtractor(A, neg_B, 1'b0, G, P, c32, C_sub);
   //Divider32bit divider
   
	      
   assign C = ALU_result;

   always @(posedge clk)
     begin
	if (AND == 1) begin
	   ALU_result = {32'b0, A & B};
	end
	else if (OR == 1) begin
	   ALU_result = {32'b0, A | B};
	end
	else if (ADD == 1) begin
	   ALU_result = (C_add[31] == 1'b0)? {32'b0, C_add} : {32'hFFFFFFFF, C_add};
	end
	else if (SUB == 1) begin
	   neg_B = ~B + 1;
	   ALU_result = (C_sub[31] == 1'b0)? {32'b0, C_sub} : {32'hFFFFFFFF, C_sub};
	end
	else if (MUL == 1) begin
	   ALU_result = C_mult;
	end
	else if (DIV == 1) begin

	end
	else if (SHR == 1) begin
	   ALU_result = {32'b0, A >> B};
	end
	else if (SHL == 1) begin
	   ALU_result = {32'b0, A << B};
	end
	else if (ROR == 1) begin
	   ALU_result = {32'b0, (A >> B) | (A << (32 - B))};
	end
	else if (ROL == 1) begin
	   ALU_result = {32'b0, (A << B) | (A >> (32 - B))};
	end
	else if (NEG == 1) begin
	   ALU_result = {32'b0, ~B + 1'b1};
	end
	else if (NOT == 1) begin
	   ALU_result = {32'b0, ~B};
	end
	else if (IncPC == 1) begin
	   ALU_result = {32'b0, B + 32'h00000004};
	end
	else
	  ALU_result = 64'bxxxxxxxxxxxxxxxx;
	
     end
   
endmodule
