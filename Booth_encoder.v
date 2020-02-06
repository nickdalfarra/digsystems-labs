module Booth_encoder(input [2:0] bits, input [31:0] M,  output [63:0] P);
   reg [63:0] partial;
   reg [63:0] M1;
   
   
   always @(bits) begin
      if (bits == 3'b000 || bits == 3'b111)
	partial = 64'b0;
      else if (bits == 3'b001 || bits == 3'b010)   
	partial = (M[31] == 1'b0)? {32'b0, M} : {32'b1, M};
      else if (bits == 3'b011)
	partial = (M[31] == 1'b0)? {32'b0, M << 1} : {32'b1, M << 1};
      else if (bits == 3'b100) begin
	 M1 = (M[31] == 1'b0)? ({32'b0, M << 1}) : ({32'b1, M << 1});
	 partial = ~M1 + 1;
 //+ 1;
		   $display("%b, \n%b", M1, partial);
	 
      end
      else if (bits == 3'b101 || bits == 3'b110) begin
	M1 = (M[31] == 1'b0)? {32'b0, M} : {32'b1, M};
	partial = ~M1 + 1;
      end
   end // always @ (bits)

   assign P = partial;
   
   
endmodule // Booth_encoder
