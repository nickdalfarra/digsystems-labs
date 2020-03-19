module Datapath(input Cout, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, BAout, Inportout, input clear, clk, read, write, PCin, IRin, MARin, Yin, HIin, LOin, Zin, MDRin, Gra, Grb, Grc, Rin, Rout, strobe, OutPort, input AND, OR, ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, NEG, NOT, IncPC, input [31:0] Mdatain, InPortIn, output [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, Hi, Lo, PC, bus_mux_out, IR, MAR, ram_data, C_sign_ext, InPortOutput, OutPortOut, output [63:0] Z, ALUout, output [15:0] Rins, Routs);

   // Wires for outputs of registers to bus
   //wire [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, Hi, Lo, PC, MDR;

   // Wires from registers to control unit (not used yet)
   //wire [31:0] MAR;

   // Wire for bus output
   //wire [31:0] bus_mux_out;

   // Wire for Y output to ALU
   wire [31:0] Yout;

   // Wires for Z
   //wire [63:0] Z, ALUout;

   // General registers
   R0 r0 (clear, clk, R0in, BAout, bus_mux_out, R0);
   Register32 r1 (clear, clk, R1in, bus_mux_out, R1);
   Register32 r2 (clear, clk, R2in, bus_mux_out, R2);
   Register32 r3 (clear, clk, R3in, bus_mux_out, R3);
   Register32 r4 (clear, clk, R4in, bus_mux_out, R4);
   Register32 r5 (clear, clk, R5in, bus_mux_out, R5);
   Register32 r6 (clear, clk, R6in, bus_mux_out, R6);
   Register32 r7 (clear, clk, R7in, bus_mux_out, R7);
   Register32 r8 (clear, clk, R8in, bus_mux_out, R8);
   Register32 r9 (clear, clk, R9in, bus_mux_out, R9);
   Register32 r10 (clear, clk, R10in, bus_mux_out, R10);
   Register32 r11 (clear, clk, R11in, bus_mux_out, R11);
   Register32 r12 (clear, clk, R12in, bus_mux_out, R12);
   Register32 r13 (clear, clk, R13in, bus_mux_out, R13);
   Register32 r14 (clear, clk, R14in, bus_mux_out, R14);
   Register32 r15 (clear, clk, R15in, bus_mux_out, R15);

   // Cool important registers
   Register32 pc (clear, clk, PCin, bus_mux_out, PC);
   Register32 ir (clear, clk, IRin, bus_mux_out, IR);
   Register32 mar (clear, clk, MARin, bus_mux_out, MAR);
   Register32 y (clear, clk, Yin, bus_mux_out, Yout);
   Register32 hi (clear, clk, HIin, bus_mux_out, Hi);
   Register32 lo (clear, clk, LOin, bus_mux_out, Lo);

   // 64 bit reg
   Register64 z (clear, clk, Zin, ALUout, Z);

   // MDR Unit
   MDR_unit mdr (read, clk, MDRin, clear, bus_mux_out, Mdatain, ram_data);   

   Bus32bit bus (.i0out(Routs[0]), .i1out(Routs[1]), .i2out(Routs[2]), .i3out(Routs[3]), .i4out(Routs[4]), .i5out(Routs[5]), .i6out(Routs[6]), .i7out(Routs[7]), .i8out(Routs[8]), .i9out(Routs[9]), .i10out(Routs[10]), .i11out(Routs[11]), .i12out(Routs[12]), .i13out(Routs[13]), .i14out(Routs[14]), .i15out(Routs[15]), .i16out(HIout), .i17out(LOout), .i18out(Zhighout), .i19out(Zlowout), .i20out(PCout), .i21out(MDRout), .i22out(Inportout), .i23out(Cout), .i24out(), .i25out(), .i26out(), .i27out(), .i28out(), .i29out(), .i30out(), .i31out(), .i0(R0), .i1(R1), .i2(R2), .i3(R3), .i4(R4), .i5(R5), .i6(R6), .i7(R7), .i8(R8), .i9(R9), .i10(R10), .i11(R11), .i12(R12), .i13(R13), .i14(R14), .i15(R15), .i16(Hi), .i17(Lo), .i18(Z[63:32]), .i19(Z[31:0]), .i20(PC), .i21(ram_data), .i22(InPortOutput), .i23(C_sign_ext), .i24(), .i25(), .i26(), .i27(), .i28(), .i29(), .i30(), .i31(), .busmux_out(bus_mux_out));

   Alu alu (clk, AND, OR, ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, NEG, NOT, IncPC, Yout, bus_mux_out, ALUout);

   Sel_Enc sel_enc(Gra, Grb, Grc, Rin, Rout, BAout, IR, Rins, Routs, C_sign_ext);

   Inport inport(clear, clk, strobe, InPortIn, InPortOutput);

   Outport outport(clear, clk, OutPort, bus_mux_out, OutPortOut);

   RAM ram(read, write, ram_data, MAR);
   
   
 
endmodule // Datapath
