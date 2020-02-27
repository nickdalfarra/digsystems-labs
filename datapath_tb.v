/* This testbench is used for all ALU operations except MUL and DIV. Just change the signal being asserted on Line 130.
Note there is still a timing issue in getting the value of the incrementd PC to load on the bus during T2. */
module datapath_tb();
   reg PCout, Zlowout, MDRout, R2out, R4out;
   reg MARin, Zin, PCin, MDRin, IRin, Yin;
   reg IncPC, Read, ADD, AND, OR, SUB, SHR, SHL, ROL, ROR, NEG, NOT, R5in, R2in, R4in;
   reg Clock;
   reg [31:0] Mdatain;
	wire [31:0] MAR, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, Hi, Lo, PC, MDR, bus_mux_out, IR;
	wire [63:0] Z, ALUout;

   parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
   reg [3:0]  Present_state = Default;

   Datapath DUT(.PCout(PCout), .Zlowout(Zlowout), .MDRout(MDRout), .R2out(R2out), .R4out(R4out), .MARin(MARin), .Zin(Zin), .PCin(PCin), .MDRin(MDRin), .IRin(IRin), .Yin(Yin), .IncPC(IncPC), .read(Read), .ADD(ADD), .R5in(R5in), .R2in(R2in), .R4in(R4in), .clk(Clock), .Mdatain(Mdatain), .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), .R6(R6), .R7(R7), .R8(R8), .R9(R9), .R10(R10), .R11(R11), .R12(R12), .R13(R13), .R14(R14), .R15(R15), .Hi(Hi), .Lo(Lo), .MDR(MDR), .IR(IR),.Z(Z), .AND(AND), .OR(OR), .SUB(SUB),.SHR(SHR), .SHL(SHL), .ROR(ROR), .ROL(ROL), .NEG(NEG), .NOT(NOT), .bus_mux_out(bus_mux_out), .ALUout(ALUout), .MAR(MAR), .PC(PC));

   initial begin
      Clock = 0;
      $dumpfile("datapath_tb.vcd");
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
	Reg_load1b : Present_state = Reg_load2a;
	Reg_load2a : Present_state = Reg_load2b;
	Reg_load2b : Present_state = Reg_load3a;
	Reg_load3a : Present_state = Reg_load3b;
	Reg_load3b : Present_state = T0;
	T0 : Present_state = T1;
	T1 : Present_state = T2;
	T2 : Present_state = T3;
	T3 : Present_state = T4;
	T4 : Present_state = T5;
      endcase // case (Present_state)      
   end // always @ (posedge Clock)

   always @(Present_state) begin
      case(Present_state)
	Default: begin
	   PCout <= 0;
	   Zlowout <= 0;
	   MDRout <= 0;
	   R2out <= 0;
	   R4out <= 0;
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
	   R5in <= 0;
	   R2in <= 0;
	   R4in <= 0;
	   Mdatain <= 32'h00000000;
	end // case: Default
	Reg_load1a: begin
	   Mdatain <= 4;
	   #10 Read <= 1; MDRin <= 1;
	   #10 Read <= 0; MDRin <= 0;
	end
	Reg_load1b: begin
	   #10 MDRout <= 1; R2in <= 1;
	   #10 MDRout <= 0; R2in <= 0;
	end
	Reg_load2a: begin
	   Mdatain <= 2;
	   #10 Read <= 1; MDRin <= 1;
	   #10 Read <= 0; MDRin <= 0;
	end
	Reg_load2b: begin
	   #10 MDRout <= 1; R4in <= 1; PCin <= 1;
	   #10 MDRout <= 0; R4in <= 0; PCin <= 0;
	end
	Reg_load3a: begin
	   Mdatain <= 26;
	   #10 Read <= 1; MDRin <= 1;
	   #10 Read <= 0; MDRin <= 0;
	end
	Reg_load3b: begin
	   #10 MDRout <= 1; R5in <= 1;
	   #10 MDRout <= 0; R5in <= 0;
	end
	T0: begin  
	   PCout <= 1;
	   MARin <= 1;
	   IncPC <= 1;
	   Zin <= 1;
	end
	T1: begin  
		PCout <= 0; MARin <= 0; //Zin <= 0;
	   #10 Zlowout <= 1; 
	   PCin <= 1;
	   Read <= 1;
	   MDRin <= 1;
	   Mdatain <= 32'h4A920000;
		#10 Zlowout <= 0; PCin <= 0; Zin <=0;
	   
	end
	T2: begin
	   MDRout <= 1;
	   IRin <= 1;
		#10 MDRout <= 0; IRin <= 0; Zlowout <= 1; PCin <=1;
	end
	T3: begin
		Zlowout <= 0; PCin <= 0;
	   #10 R2out <= 1; Yin <= 1; 
	   #10 R2out <= 0; Yin <= 0;
	end
	T4: begin
	   IncPC <= 0;
	   #10 R4out <= 1; NEG <= 1; Zin <= 1;	   
	end
	T5: begin
	   #10 NEG <= 0; 	   
	   #10 R4out <= 0;
	   Zlowout <= 1; R5in <= 1;
	end
      endcase // case (Present_state)
   end // always @ (Present_state)   
endmodule // datapath_tb
