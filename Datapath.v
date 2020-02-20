module Datapath(input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, input clear, clk, read, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, PCin, IRin, MARin, Yin, HIin, LOin, Zin, MDRin, input AND, OR, ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, NEG, NOT, IncPC, input [31:0] Mdatain, output [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, Hi, Lo, PC, MDR, bus_mux_out, IR, output [63:0] Z, ALUout);

   // Wires for outputs of registers to bus
   //wire [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, Hi, Lo, PC, MDR;

   // Wires from registers to control unit (not used yet)
   wire [31:0] MAR;

   // Wire for bus output
   //wire [31:0] bus_mux_out;

   // Wire for Y output to ALU
   wire [31:0] Yout;

   // Wires for Z
   //wire [63:0] Z, ALUout;

   // General registers
   Register32 r0 (clear, clk, R0in, bus_mux_out, R0);
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
   MDR_unit mdr (read, clk, MDRin, clear, bus_mux_out, Mdatain, MDR);   

   Bus32bit bus (.i0out(R0out), .i1out(R1out), .i2out(R2out), .i3out(R3out), .i4out(R4out), .i5out(R5out), .i6out(R6out), .i7out(R7out), .i8out(R8out), .i9out(R9out), .i10out(R10out), .i11out(R11out), .i12out(R12out), .i13out(R13out), .i14out(R14out), .i15out(R15out), .i16out(HIout), .i17out(LOout), .i18out(Zhighout), .i19out(Zlowout), .i20out(PCout), .i21out(MDRout), .i22out(), .i23out(), .i24out(), .i25out(), .i26out(), .i27out(), .i28out(), .i29out(), .i30out(), .i31out(), .i0(R0), .i1(R1), .i2(R2), .i3(R3), .i4(R4), .i5(R5), .i6(R6), .i7(R7), .i8(R8), .i9(R9), .i10(R10), .i11(R11), .i12(R12), .i13(R13), .i14(R14), .i15(R15), .i16(Hi), .i17(Lo), .i18(Z[63:32]), .i19(Z[31:0]), .i20(PC), .i21(MDR), .i22(), .i23(), .i24(), .i25(), .i26(), .i27(), .i28(), .i29(), .i30(), .i31(), .busmux_out(bus_mux_out));

   Alu alu (clk, AND, OR, ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, NEG, NOT, IncPC, Yout, bus_mux_out, ALUout);
   
 
endmodule // Datapath
