module st_instr_tb();
   reg PCout, Zlowout, MDRout, Cout;
   reg MARin, Zin, PCin, MDRin, IRin, Yin, Gra, Grb, Grc, Rin, Rout, BAout;
   reg IncPC, Read, Write, ADD, AND, OR, SUB, SHR, SHL, ROL, ROR, NEG, NOT;
   reg Clock, clear;
	wire [31:0] Mdatain, ram_data, MDR, MAR, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, 
	R13, R14, R15, Hi, Lo, PC, bus_mux_out, IR, C_sign_ext;
	wire [63:0] Z, ALUout;
   wire [15:0] Rins, Routs;
   
   parameter Default = 4'b0000, Reg_load_1a = 4'b0001, Reg_load_1b = 4'b0010, T0 = 4'b0011, T1 = 4'b0100,
	T2 = 4'b0101, T3 = 4'b0110, T4 = 4'b0111, T5 = 4'b1000, T6 = 4'b1001, T7 = 4'b1010, T8 = 4'b1011;
   reg [3:0]  Present_state = Default;

   Datapath DUT (.write(Write), .Mdatain(Mdatain), .clear(clear), .Cout(Cout), .BAout(BAout), .PCout(PCout), .Zlowout(Zlowout), 
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
		Reg_load_1b : Present_state = T0;
		T0 : Present_state = T1;
		T1 : #10 Present_state = T2;
		T2 : #10 Present_state = T3;
		T3 : #10 Present_state = T4;
		T4 : #20 Present_state = T5;
		T5:  #40 Present_state = T6;
		T6 : #60 Present_state = T7;
		T7 : #20 Present_state = T8;
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
	// Load value of $85 into R1 from RAM
	Reg_load_1a: begin
		clear <= 0;
		force ram_data = 'h00000055;
	   #10 Read <= 1; MDRin <= 1;
	   #10 Read <= 0; MDRin <= 0;
		release ram_data;
	end
	Reg_load_1b: begin
		force Rins = 'h0002;
	   #10 MDRout <= 1;
	   #15 MDRout <= 0;
		release Rins;
	end
	// Get PC in MAR to go to mem and get st instr (@ addr 0), get PC+4 in Z
	T0: begin
		PCout <= 1;
	   MARin <= 1;
	   IncPC <= 1;
	   Zin <= 1;	   
	end
	// Put PC+4 in PC, load instr (st $90, R1) from memory into MDR
	T1: begin
		PCout <= 0; MARin <= 0;
	   IncPC <= 0;
		#20 Zlowout <= 1;
	   PCin <= 1; Read <= 1; 
	   MDRin <= 1;
		Zin <= 0;
	end
	// Load instr into IR
	T2: begin
		#10 MDRin <= 0;
	   Zlowout <= 0;
		PCin <= 0;
	   Read <= 0;
	   #10 MDRout <= 1;
	   IRin <= 1;
	end
	// Put either 0's on bus if R0 selected or contents of Rb
	// Put bus contents in Y
	T3: begin
		#10 MDRout <= 0;
	   IRin <= 0;
	   #10 Grb <= 1;
	   BAout <= 1;
	   Yin <= 1;
	end
	// Put C_sign_ext = 32'h5A in Z
	T4: begin
	   #10 
		BAout <= 0;
	   Grb <= 0;
	   Yin <= 0;
		Cout <= 1;
	   ADD <= 1;
	   Zin <= 1; 
	end
	// Put C_sign_ext = 32'h5A in MAR
	T5: begin	   
	   #20 Cout <= 0;
	   ADD <= 0;
		Zin <= 0;
		Zlowout <= 1;
	   MARin <= 1;
	   #20 Zlowout <= 0;
	   MARin <= 0;
	end
	// Ignore this phase :(
	T6: begin
		// For some reason any assignments i do in this phase don't happen
		// I think it's being skipped due to previous # delays...to fix
	end
	// Take data in R1 ($85 = 'h55) and write to mem
	T7: begin
		Rout <= 1;
		Gra <= 1;
	   MDRin <= 1;
		Write <= 1;
	end
	// Read back memory at address $90 ('h5A), should be $85
	// Will be in MDR
	T8 : begin
		#20
		Write <= 0; Read <= 1; MDRin <= 1;
	end
      endcase // case (Present_state)
   end // always @ (Present_state)   
endmodule