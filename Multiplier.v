module Multiplier(input [31:0] M, Q, output [63:0] P);
   // Used to hold current bits of Q being encoded
   // Honestly not rlly sure if we need both but it won't let me use a wire in the always block so I think I need the reg
   reg [2:0] bits_r;
   wire [2:0] bits_w;

   // Used to hold M and Q so they can be used in operations
   reg [31:0] M1;
   reg [31:0] Q1;

   // booth_enc output, holds the current version of M to be added to partial
   // Wire is directly from encoder, reg is used for operations in the always
   wire [63:0] current_M_w;
   reg [63:0]  current_M_r = 64'b0;

   // Current partial product
   reg [63:0]  current_prod = 64'b0;
   // Final product that is connected to output of multiplier, set after all iterations
   reg [63:0]  final_prod;

   // An index for use in the for loop
   reg [4:0]   i;
   
   Booth_encoder booth_enc(bits_w, M1, current_M_w); 

   always @(M or Q) begin
      
      M1 = M;
      Q1 = Q;

      // This block couldn't go in the for loop because on the first iteration you only shift Q right once and you have to feed the encoder a zero for the first bit
      bits_r = {Q1[1], Q1[0], 1'b0};
      // Had to add this delay, otherwise it goes to fast to capture any values
      #10
      Q1 = Q1 >> 1;
      current_M_r = current_M_w;
      
      current_prod = current_prod + current_M_r;

      // Now run the loop for the remaining 15 times to get the rest of the product
      for (i = 1; i < 16; i = i + 1) begin
	 bits_r = {Q1[2], Q1[1], Q1[0]};
	 #10
	 Q1 = Q1 >> 2;
	 current_M_r = current_M_w;
	 // At every iteration, the partial product gets shifted 2*i, but can't use multiplication in the multiplier, so it's just a nice left shift
	 current_prod = current_prod + (current_M_r << (i << 1));	 
      end
      final_prod = current_prod;   
   end

   assign P = final_prod;
   assign bits_w = bits_r;
   
endmodule
