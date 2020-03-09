module decoder_2to4 (output [3:0] out, input [1:0] in);

	assign out[0] = (!in[1]) && (!in[0]);
	assign out[1] = (!in[1]) && (in[0]);
	assign out[2] = (in[1]) && (!in[0]);
	assign out[3] = (in[1]) && (in[0]);

endmodule
