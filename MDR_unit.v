module MDR_unit(input read, clk, MDRin, clr, input [31:0] BusMuxIn, Mdatain, output [31:0] Q);
   wire [31:0] D;
   
   MuxMD md_mux(read, BusMuxIn, Mdatain, D);
   MDR mdr(clr, clk, MDRin, D, Q);
   
endmodule // MDR_unit
