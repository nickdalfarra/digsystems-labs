module decoder_2to4 (output brzr, brnz, brpl, brmi, input [1:0] in);

	assign brzr = (!in[1]) && (!in[0]);
	assign brnz = (!in[1]) && (in[0]);
	assign brpl = (in[1]) && (!in[0]);	
	assign brmi = (in[1]) && (in[0]);

endmodule
