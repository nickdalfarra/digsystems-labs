module Multiplier(input [31:0] M, Q, output [63:0] P);
   reg [2:0] bits_r;
   wire [2:0] bits_w;
  
   reg [31:0] M1;
   reg [31:0] Q1;
   
   wire [63:0] partial_w;
   reg [63:0]  partial_r = 64'b0;
   reg [63:0]  current_prod = 64'b0;
   reg [63:0]  final_prod;
   
   Booth_encoder booth_enc(bits_w, M1, partial_w); 

   always @(M or Q) begin
      
      M1 = M;
      Q1 = Q;

      bits_r = {Q1[1], Q1[0], 1'b0};
      #10
      Q1 = Q1 >> 1;
      partial_r = partial_w;
      
      current_prod = current_prod + partial_r;

      repeat (15) begin
	 bits_r = {Q1[2], Q1[1], Q1[0]};
	 #10
	 Q1 = Q1 >> 2;
	 partial_r = partial_w;
	 current_prod = current_prod + (partial_r << 2);	 
      end
      final_prod = current_prod;
      
      /*for (index = 0; index < 31; index = index + 2) begin
	 if (index == 0) begin
	    bits_r = {Q1[1], Q1[0], 1'b0};	    
	 end
	 else begin
	    bits_r = {Q1[index+1], Q1[index], Q1[index-1]};	    
	 end	   
      end */     
   end

   assign P = final_prod;
   assign bits_w = bits_r;
   
endmodule
