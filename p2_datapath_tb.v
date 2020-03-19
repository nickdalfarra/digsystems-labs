module p2_datapath_tb();
   reg PCout, Zlowout, MDRout, Cout;
   reg MARin, Zin, PCin, MDRin, IRin, Yin, Gra, Grb, Grc, Rin, Rout, BAout;
   reg IncPC, Read, ADD, AND, OR, SUB, SHR, SHL, ROL, ROR, NEG, NOT;
   reg Clock;
   reg [31:0] Mdatain;
	wire [31:0] MAR, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, Hi, Lo, PC, MDR, bus_mux_out, IR, C_sign_ext;
	wire [63:0] Z, ALUout;
   wire [15:0] Rins, Routs;
   

   parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101, T7 = 4'b1110;
   reg [3:0]  Present_state = Default;

   Datapath DUT (.clear(clear), .Cout(Cout), .BAout(BAout), .PCout(PCout), .Zlowout(Zlowout), .MDRout(MDRout), .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .MARin(MARin), .Zin(Zin), .PCin(PCin), .MDRin(MDRin), .IRin(IRin), .Yin(Yin), .IncPC(IncPC), .read(Read), .ADD(ADD), .clk(Clock), .Mdatain(Mdatain), .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), .R6(R6), .R7(R7), .R8(R8), .R9(R9), .R10(R10), .R11(R11), .R12(R12), .R13(R13), .R14(R14), .R15(R15), .Hi(Hi), .Lo(Lo), .MDR(MDR), .IR(IR),.Z(Z), .AND(AND), .OR(OR), .SUB(SUB),.SHR(SHR), .SHL(SHL), .ROR(ROR), .ROL(ROL), .NEG(NEG), .NOT(NOT), .bus_mux_out(bus_mux_out), .ALUout(ALUout), .MAR(MAR), .PC(PC), .C_sign_ext(C_sign_ext), .Rins(Rins), .Routs(Routs));

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
	Default : Present_state = Reg_load1a;
	Reg_load1a : Present_state = Reg_load1b;
	Reg_load1b : Present_state = T0;
	//Reg_load2a : Present_state = Reg_load2b;
	//Reg_load2b : Present_state = Reg_load3a;
	//Reg_load3a : Present_state = Reg_load3b;
	//Reg_load3b : Present_state = T0;
	T0 : Present_state = T1;
	T1 : Present_state = T2;
	T2 : Present_state = T3;
	T3 : Present_state = T4;
	T4 : Present_state = T5;
	T5 : Present_state = T6;
   T6 : Present_state = T7;
	
	
      endcase // case (Present_state)      
   end // always @ (posedge Clock)

   always @(Present_state) begin
      case(Present_state)
	Default: begin
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
	   Mdatain <= 32'h00000000;
	end // case: Default
	
	// Load 0 into MDR
	Reg_load1a: begin
	   Read <= 1;
	   MDRin <= 1;	   
	end
	
	// Load 0 into PC
	Reg_load1b: begin
	   MDRout <= 1;
	   MDRin <= 0;
	   Read <= 0;
	   PCin <= 1;
	   
	end
	
	// Get PC in MAR to go to mem and get next instr, get PC+4 in Z
	T0: begin
	   MDRout <= 0;
	   PCin <= 0;
	   
	   PCout <= 1;
	   MARin <= 1;
	   IncPC <= 1;
	   Zin <= 1;
	   
	end
	// Put PC+4 in PC, load instr (ld R1, 85) from memory into MDR
	T1: begin
	   PCout <= 0; MARin <= 0;
	   IncPC <= 0;
	   
	   #5
	     Zin <= 0;
	   
	   Zlowout <= 1;
	   PCin <= 1; Read <= 1; Mdatain <= 32'h01000085;
	   MDRin <= 1;	   
	end
	// Load instr into IR
	T2: begin
	   Zlowout <= 0;
	   PCin <= 0;
	   Read <= 0;
	   MDRout <= 1;
	   IRin <= 1;
	   
	end
	// Put 0's on bus and in Y
	T3: begin
	   MDRout <= 0;
	   IRin <= 0;
	   
	   Grb <= 1;
	   BAout <= 1;
	   Yin <= 1;
	   
	end
	// Put C_sign_ext = 85 in Z
	T4: begin
	   Cout <= 1;
	   ADD <= 1;
	   Zin <= 1;
	   BAout <= 0;
	   Grb <= 0;
	   Yin <= 0;
	   
	   
	end
	// Put C_sign_ext = 85 in MAR
	T5: begin
	   Cout <= 0;
	   ADD <= 0;
	   Zin <= 0;	   
	   Zlowout <= 1;
	   MARin <= 1;
	   
	end
	// Read data from 85 in RAM into MDR (pretend it's 2)
	T6: begin  
	   Read <= 1;
	   Mdatain <= 32'h00000002;
	   MDRin <= 1;
	   Zlowout <= 0;
	   MARin <= 0;
	   
	end
	// Select R1 as Ra, put data from mem loc in R1 ('h2) 
	T7: begin  
	   MDRout <= 1;
	   Gra <= 1;
	   Rin <= 1;
	   
	   
	end
      endcase // case (Present_state)
   end // always @ (Present_state)   
endmodule // p2_datapath_tb
