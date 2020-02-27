module Sel_Enc(input Gra, Grb, Grc, Rin, Rout, BAout, input [31:0] IR, output [15:0] Rins, Routs, output [31:0] C_sign_extended);
   wire [3:0] z1, z2, z3, z;
   reg [15:0] dec_out;
   wire       out;

   genvar gi;

   // Sign-extend C
   assign C_sign_extended = (IR[18] == 0)? {13'b0000000000000, IR[18:0]} : {13'b1111111111111, IR[18:0]};
   
   
   // AND and OR gates to choose Ra, Rb, or Rc
   And4Bit and1(IR[26:23], Gra, z1);
   And4Bit and2(IR[22:19], Grb, z2);
   And4Bit and3(IR[18:15], Grc, z3);
   Or12Bit or12(z1, z2, z3, z);

   // 4-to-16 decoder
   always @(z)
     begin
	case (z)
	  4'b0000 : dec_out = 16'h0001;
	  4'b0001 : dec_out = 16'h0002;
	  4'b0010 : dec_out = 16'h0004;
	  4'b0011 : dec_out = 16'h0008;
	  4'b0100 : dec_out = 16'h0010;
	  4'b0101 : dec_out = 16'h0020;
	  4'b0110 : dec_out = 16'h0040;
	  4'b0111 : dec_out = 16'h0080;
	  4'b1000 : dec_out = 16'h0100;
	  4'b1001 : dec_out = 16'h0200;
	  4'b1010 : dec_out = 16'h0400;
	  4'b1011 : dec_out = 16'h0800;
	  4'b1100 : dec_out = 16'h1000;
	  4'b1101 : dec_out = 16'h2000;
	  4'b1110 : dec_out = 16'h4000;
	  4'b1111 : dec_out = 16'h8000;
	endcase // case (z)
     end // always @ (z)

   // Generate bit to release the Routs
   or(out, Rout, BAout);

   // Generate Rins
   generate
      for (gi = 0; gi < 16; gi = gi + 1) begin : gen_rins
	 and(Rins[gi], Rin, dec_out[gi]);
      end
   endgenerate

   // Generate Routs
   generate
      for (gi = 0; gi < 16; gi = gi + 1) begin : gen_routs
	 and(Routs[gi], out, dec_out[gi]);
      end
   endgenerate
	 
   
endmodule // Sel_Enc


