module conff_logic(output out, input [31:0] busin, ir, input CONin
	,output w1, w2, w3, w4 // REMOVE
);

	wire brmi, brpl, brnz, brzr; // C2 = 3, 2, 1, or  0.
	wire qbar;

	// automtically handles decoding
	decoder_2to4 decoder (brzr, brnz, brpl, brmi, ir[20:19]);
	
	and(w1, (busin == 0), brzr); // if zero
	and(w2, (busin != 0), brnz); // if nonzero
	and(w3, (busin[31] == 0), brpl); // if >= 0
	and(w4, (busin[31] == 1), brmi); // if < 0
	or(w5, w1, w2, w3, w4); // branching condition met
	
	clocked_dff dff (out, qbar, w5, CONin);

endmodule
