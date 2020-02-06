module Bus32bit(
input i0out, i1out, i2out, i3out, i4out, i5out, i6out, i7out, i8out, i9out, i10out, i11out, i12out, i13out, i14out, i15out, i16out, i17out, i18out, i19out, i20out, i21out, i22out, i23out, i24out, i25out, i26out, i27out, i28out, i29out, i30out, i31out, 
input [31:0] i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, 
output [31:0] busmux_out);
	
	wire [4:0] enc_out;
	
	Encoder32to5 enc (i0out, i1out, i2out, i3out, i4out, i5out, i6out, i7out, i8out, i9out, i10out, i11out, i12out, i13out, i14out, i15out, i16out, i17out, i18out, i19out, i20out, i21out, i22out, i23out, i24out, i25out, i26out, i27out, i28out, i29out, i30out, i31out, enc_out);
	Mux32bit32to1 busmux (enc_out, i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, busmux_out);
	
endmodule
