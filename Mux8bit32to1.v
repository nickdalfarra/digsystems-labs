module Mux8bit32to1 (input [4:0] select, input [7:0] i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, output [7:0] out);

	reg [7:0] to_out;
	
	always @(*) begin
		if (select == 5'b00000)
			to_out = i0;
		else if (select == 5'b00001)
			to_out = i1;
		else if (select == 5'b00010)
			to_out = i2;
		else if (select == 5'b00011)
			to_out = i3;
		else if (select == 5'b00100)
			to_out = i4;
		else if (select == 5'b00101)
			to_out = i5;
		else if (select == 5'b00110)
			to_out = i6;
		else if (select == 5'b00111)
			to_out = i7;
		else if (select == 5'b01000)
			to_out = i8;
		else if (select == 5'b01001)
			to_out = i9;
		else if (select == 5'b01010)
			to_out = i10;
		else if (select == 5'b01011)
			to_out = i11;
		else if (select == 5'b01100)
			to_out = i12;
		else if (select == 5'b01101)
			to_out = i13;
		else if (select == 5'b01110)
			to_out = i14;
		else if (select == 5'b01111)
			to_out = i15;
		else if (select == 5'b10000)
			to_out = i16;
		else if (select == 5'b10001)
			to_out = i17;
		else if (select == 5'b10010)
			to_out = i18;
		else if (select == 5'b10011)
			to_out = i19;
		else if (select == 5'b10100)
			to_out = i20;
		else if (select == 5'b10101)
			to_out = i21;
		else if (select == 5'b10110)
			to_out = i22;
		else if (select == 5'b10111)
			to_out = i23;
		else if (select == 5'b11000)
			to_out = i24;
		else if (select == 5'b11001)
			to_out = i25;
		else if (select == 5'b11010)
			to_out = i26;
		else if (select == 5'b11011)
			to_out = i27;
		else if (select == 5'b11100)
			to_out = i28;
		else if (select == 5'b11101)
			to_out = i29;
		else if (select == 5'b11110)
			to_out = i30;
		else if (select == 5'b11111)
			to_out = i31;
	end
	
	assign out = to_out;
	
endmodule
