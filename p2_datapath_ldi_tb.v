module p2_datapath_ldi_tb();

	reg PCout, Zlowout, MDRout, Cout;
   reg MARin, Zin, PCin, MDRin, IRin, Yin, Gra, Grb, Grc, Rin, Rout, BAout;
   reg IncPC, Read, ADD, AND, OR, SUB, SHR, SHL, ROL, ROR, NEG, NOT;
   reg Clock, clear;
	reg [31:0] preload;
	wire [31:0] Mdatain, ram_data, MDR, MAR, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, 
	R13, R14, R15, Hi, Lo, PC, bus_mux_out, IR, C_sign_ext;
	wire [63:0] Z, ALUout;
   wire [15:0] Rins, Routs;
   
   parameter Default = 4'b0000, T0 = 4'b0001, T1 = 4'b0010, T2 = 4'b0011, 
	T3 = 4'b0100, T4 = 4'b0101, T5 = 4'b0110, T6 = 4'b0111, T7 = 4'b1000;
   reg [3:0]  Present_state = Default;

   Datapath DUT (.Mdatain(Mdatain), .preload(preload), .clear(clear), .Cout(Cout), .BAout(BAout), .PCout(PCout), .Zlowout(Zlowout), 
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
		Default : Present_state = T0;
		T0 : Present_state = T1;
		T1 : #10 Present_state = T2;
		T2 : #10 Present_state = T3;
		T3 : #10 Present_state = T4;
		T4 : #20 Present_state = T5;
		T5 : #40 Present_state = T6;
		T6 : #60 Present_state = T7;	
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
	
	// PC loaded with 'h0 due to clear
	// Get PC in MAR to go to mem and get ldi instr (@ addr 0), get PC+4 in Z
	T0: begin
		clear <= 0;
		PCout <= 1;
	   MARin <= 1;
	   IncPC <= 1;
	   Zin <= 1;	   
	end
	// Put PC+4 in PC, load instr (ldi R1, 85) from memory into MDR
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
	// Put 0's on bus and in Y
	T3: begin
		#10 MDRout <= 0;
	   IRin <= 0;
		
	   #10 Grb <= 1;
	   BAout <= 1;
	   Yin <= 1;
	end
	// Put C_sign_ext = 32'h85 in Z
	T4: begin
	   #10 
		BAout <= 0;
	   Grb <= 0;
	   Yin <= 0;
		
		Cout <= 1;
	   ADD <= 1;
	   Zin <= 1; 
	end
	// Put C_sign_ext = 32'h85 in MAR
	T5: begin	   
	   #20 Cout <= 0;
	   ADD <= 0;
		Zin <= 0;
		
		Zlowout <= 1;
		Gra <= 1;
	   Rin <= 1;
	end
	T6: begin
		// For some reason any assignments i do in this phase don't happen
		// I think it's being skipped due to previous # delays...to fix
	end
	// Read data from $85 in RAM into MDR (shoud be 'h2)
	// Select R1 as Ra, put data from mem loc $85 in R1 ('h2) 
	T7: begin  
	   
	end
      endcase // case (Present_state)
   end // always @ (Present_state)   


endmodule
