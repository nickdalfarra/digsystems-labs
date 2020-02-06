module Encoder32to5 (input i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, output [4:0] out);

   reg [4:0] Enc_out = 5'b00000;

   always @(*) begin
		if (i0 == 1)
			Enc_out = 0;
		else if (i1 == 1)
			Enc_out = 1;
		else if (i2 == 1)
			Enc_out = 2;
		else if (i3 == 1)
			Enc_out = 3;
		else if (i4 == 1)
			Enc_out = 4;
		else if (i5 == 1)
			Enc_out = 5;
		else if (i6 == 1)
			Enc_out = 6;
		else if (i7 == 1)
			Enc_out = 7;
		else if (i8 == 1)
			Enc_out = 8;
		else if (i9 == 1)
			Enc_out = 9;
		else if (i10 == 1)
			Enc_out = 10;
		else if (i11 == 1)
			Enc_out = 11;
		else if (i12 == 1)
			Enc_out = 12;
		else if (i13 == 1)
			Enc_out = 13;
		else if (i14 == 1)
			Enc_out = 14;
		else if (i15 == 1)
			Enc_out = 15;
		else if (i16 == 1)
			Enc_out = 16;
		else if (i17 == 1)
			Enc_out = 17;
		else if (i18 == 1)
			Enc_out = 18;
		else if (i19 == 1)
			Enc_out = 19;
		else if (i20 == 1)	
			Enc_out = 20;
		else if (i21 == 1)
			Enc_out = 21;
		else if (i22 == 1)
			Enc_out = 22;
		else if (i23 == 1)
			Enc_out = 23;
		else if (i24 == 1)
			Enc_out = 24;
		else if (i25 == 1)
			Enc_out = 25;
		else if (i26 == 1)
			Enc_out = 26;
		else if (i27 == 1)
			Enc_out = 27;
		else if (i28 == 1)
			Enc_out = 28;
		else if (i29 == 1)
			Enc_out = 29;
		else if (i30 == 1)
			Enc_out = 30;
		else if (i31 == 1)
			Enc_out = 31;
		else
			Enc_out = 0;
	
     end
   
   
   assign out = Enc_out;
   
   
endmodule
