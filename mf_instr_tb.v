module mf_instr_tb();
   reg PCout, Zlowout, MDRout, Cout, HIout, LOout;
   reg MARin, Zin, PCin, MDRin, IRin, Yin, Gra, Grb, Grc, Rin, Rout, BAout, HIin, LOin;
   reg IncPC, Read, Write, ADD, AND, OR, SUB, SHR, SHL, ROL, ROR, NEG, NOT;
   reg Clock, clear;
	wire [31:0] Mdatain, ram_data, MDR, MAR, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, 
	R13, R14, R15, Hi, Lo, PC, bus_mux_out, IR, C_sign_ext;
	wire [63:0] Z, ALUout;
   wire [15:0] Rins, Routs;
   
   parameter Default = 4'b0000, Reg_load_1a = 4'b0001, Reg_load_1b = 4'b0010, T0 = 4'b0011, T1 = 4'b0100,
	T2 = 4'b0101, T3 = 4'b0110;
   reg [3:0]  Present_state = Default;

   Datapath DUT (.HIin(HIin), .LOin(LOin), .HIout(HIout), .LOout(LOout),.write(Write), .Mdatain(Mdatain), .clear(clear), .Cout(Cout), .BAout(BAout), .PCout(PCout), .Zlowout(Zlowout), 
	.MDRout(MDRout), .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .MARin(MARin), 
	.Zin(Zin), .PCin(PCin), .MDRin(MDRin), .IRin(IRin), .Yin(Yin), .IncPC(IncPC), .read(Read), 
	.ADD(ADD), .clk(Clock), .MAR(MAR), .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), 
	.R5(R5), .R6(R6), .R7(R7), .R8(R8), .R9(R9), .R10(R10), .R11(R11), .R12(R12), .R13(R13), .R14(R14), 
	.R15(R15), .Hi(Hi), .Lo(Lo), .IR(IR),.Z(Z), .AND(AND), .OR(OR), .SUB(SUB),.SHR(SHR), .SHL(SHL), 
	.ROR(ROR), .ROL(ROL), .NEG(NEG), .NOT(NOT), .bus_mux_out(bus_mux_out), .ALUout(ALUout), 
	.ram_data(ram_data), .MDR(MDR), .PC(PC), .C_sign_ext(C_sign_ext), .Rins(Rins), .Routs(Routs));

	initial begin
      Clock = 0;
      $dumpfile("p2_datapath_tb.vcd");
      $dumpvars(0, DUT);
      forever #10 Clock = ~Clock;
   end

   initial begin
      #500 $finish;
   end 
	
   always @(posedge Clock) begin
      case (Present_state)
		Default : Present_state = Reg_load_1a;
		Reg_load_1a : Present_state = Reg_load_1b;
		Reg_load_1b : #5 Present_state = T0;
		T0 : Present_state = T1;
		T1 : #15 Present_state = T2;
		T2 : #30 Present_state = T3;
      endcase // case (Present_state)      
   end // always @ (posedge Clock)

   always @(Present_state) begin
      case(Present_state)
	// Assert clear to load zero's into all registers
	Default: begin
	   clear <= 1;	   
	   PCout <= 0;
	   Zlowout <= 0;
	   MDRout <= 0;
	   Cout <= 0;
	   Rin <= 0;
	   Rout <= 0;
	   Gra <= 0;
	   Grb <= 0;
	   Grc <= 0;	   
	   MARin <= 0;
	   Zin <= 0;
	   PCin <= 0;
	   MDRin <= 0;
	   IRin <= 0;
	   Yin <= 0;
		HIin <= 0;
		LOin <= 0;
		HIout <= 0;
		LOout <= 0;
	   IncPC <= 0;
	   Write <= 0;
		Read <= 0;
	   AND <= 0; 
		OR <= 0;
		SUB <= 0;
		ADD <= 0;
		SHL <= 0;
		SHR <= 0;
		ROL <= 0;
		ROR <= 0;
		NEG <= 0;
		NOT <= 0;
		BAout <= 0;
	end // case: Default	
	// Load value of $85 into LO from RAM
	Reg_load_1a: begin
		clear <= 0;
		force ram_data = 'h00000055;
	   #10 Read <= 1; MDRin <= 1;
	   #10 Read <= 0; MDRin <= 0;
		release ram_data;
	end
	Reg_load_1b: begin
	   #10 MDRout <= 1;
		LOin <= 1;
	   #15 MDRout <= 0;
		LOin <= 0;
	end
	// Get PC in MAR to go to mem and get instr (@ addr 0), get PC+4 in Z
	T0: begin
		PCout <= 1;
	   MARin <= 1;
	   IncPC <= 1;
	   Zin <= 1;	   
	end
	// Put PC+4 in PC, load mf instr from memory into MDR
	T1: begin
		#20 PCout <= 0; MARin <= 0;
	   IncPC <= 0; Zlowout <= 1;
	   PCin <= 1; Read <= 1; 
	   MDRin <= 1;
		Zin <= 0;
	end
	// Load instr into IR
	T2: begin
		#15
		MDRin <= 0;
	   Zlowout <= 0;
		PCin <= 0;
	   Read <= 0;
	   #10 MDRout <= 1;
	   IRin <= 1;
	end
	// Store contents of LO in Ra
	T3: begin
		#10 MDRout <= 0;
	   IRin <= 0;
	   #10 Gra <= 1;
	   LOout <= 1;
	   Rin <= 1;
	end
  endcase // case (Present_state)
 end // always @ (Present_state)   
endmodule