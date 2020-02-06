module Bus32bit_tb;

	reg clk = 0;

	// carries output of the bus
	wire [31:0] BusMuxOut;
	
	// First 32 control inputs
	reg R0out = 1'b0;
   reg R1out = 1'b0;
   reg R2out = 1'b0;
   reg R3out = 1'b0;
   reg R4out = 1'b0;
   reg R5out = 1'b0;
   reg R6out = 1'b0;
   reg R7out = 1'b0;
   reg R8out = 1'b0;
   reg R9out = 1'b0;
   reg R10out = 1'b0;
   reg R11out = 1'b0;
   reg R12out = 1'b0;
   reg R13out = 1'b0;
   reg R14out = 1'b0;
   reg R15out = 1'b0;
   reg HIout = 1'b0;
   reg LOout = 1'b0;
   reg Zhighout = 1'b0;
   reg Zlowout = 1'b0;
   reg PCout = 1'b0;
   reg MDRout = 1'b0;
   reg InPortout = 1'b0;
   reg Cout = 1'b0;
	reg i24out = 1'b0;
	reg i25out = 1'b0;
	reg i26out = 1'b0;
	reg i27out = 1'b0;
	reg i28out = 1'b0;
	reg i29out = 1'b0;
	reg i30out = 1'b0;
	reg i31out = 1'b0;

	// 1 of these 32 values are selected by the i'X'out signal
	reg [31:0] BusMuxInR0 = 1;
	reg [31:0] BusMuxInR1 = 2**1;
	reg [31:0] BusMuxInR2 = 2**2;
	reg [31:0] BusMuxInR3 = 2**3;
	reg [31:0] BusMuxInR4 = 2**4;
	reg [31:0] BusMuxInR5 = 2**5;
	reg [31:0] BusMuxInR6 = 2**6;
	reg [31:0] BusMuxInR7 = 2**7;
	reg [31:0] BusMuxInR8 = 2**8;
	reg [31:0] BusMuxInR9 = 2**9;
	reg [31:0] BusMuxInR10 = 2**10;
	reg [31:0] BusMuxInR11 = 2**11;
	reg [31:0] BusMuxInR12 = 2**12;
	reg [31:0] BusMuxInR13 = 2**13;
	reg [31:0] BusMuxInR14 = 2**14;
	reg [31:0] BusMuxInR15 = 2**15;
	reg [31:0] BusMuxInHI = 2**16;
	reg [31:0] BusMuxInLO = 2**17;
	reg [31:0] BusMuxInZhigh = 2**18;
	reg [31:0] BusMuxInZlow = 2**19;
	reg [31:0] BusMuxInPC = 2**20;
	reg [31:0] BusMuxInMDR = 2**21;
	reg [31:0] BusMuxInInPort = 2**22;
	reg [31:0] CSignExtended = 2**23;
	reg [31:0] BusMuxInR24 = 2**24;
	reg [31:0] BusMuxInR25 = 2**25;
	reg [31:0] BusMuxInR26 = 2**26;
	reg [31:0] BusMuxInR27 = 2**27;
	reg [31:0] BusMuxInR28 = 2**28;
	reg [31:0] BusMuxInR29 = 2**29;
	reg [31:0] BusMuxInR30 = 2**30;
	reg [31:0] BusMuxInR31 = 2**31;
	
	
	Bus32bit dut (
	// Control signals
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout, i24out, i25out, i26out, i27out, i28out, i29out, i30out, i31out, 
	// Signal to be selected
	BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow, BusMuxInPC, BusMuxInMDR, BusMuxInInPort, CSignExtended, BusMuxInR24, BusMuxInR25, BusMuxInR26, BusMuxInR27, BusMuxInR28, BusMuxInR29, BusMuxInR30, BusMuxInR31, 
	// Output
	BusMuxOut);
	
	initial begin
      //take out next two lines if running on altera
      $dumpfile("tb_Bus32bit.vcd");
      $dumpvars(0, dut);
      forever #10 clk = ~clk;
   end
	
	initial begin
      #500 $finish; 
   end
	
	always @(posedge clk) begin
      
      R0out = 1'b1; #10; //apply input, wait
      R0out = 1'b0; R1out = 1'b1; #10;
      R1out = 1'b0; R2out = 1'b1; #10;
      R2out = 1'b0; R3out = 1'b1; #10;
      R3out = 1'b0; R4out = 1'b1; #10;
      R4out = 1'b0; R5out = 1'b1; #10;
      R5out = 1'b0; R6out = 1'b1; #10;
      R6out = 1'b0; R7out = 1'b1; #10;
      R7out = 1'b0; R8out = 1'b1; #10;
      R8out = 1'b0; R9out = 1'b1; #10;
      R9out = 1'b0; R10out = 1'b1; #10;
		R10out = 1'b0; R11out = 1'b1; #10;
		R11out = 1'b0; R12out = 1'b1; #10;
		R12out = 1'b0; R13out = 1'b1; #10;
		R13out = 1'b0; R14out = 1'b1; #10;
		R14out = 1'b0; R15out = 1'b1; #10;
		R15out = 1'b0; HIout = 1'b1; #10;
		HIout = 1'b0; #10; LOout = 1'b1; #10;
		LOout = 1'b0; Zhighout = 1'b1; #10;
		Zhighout = 1'b0; Zlowout = 1'b1; #10;
		Zlowout = 1'b0; PCout = 1'b1; #10;
		PCout = 1'b0; MDRout = 1'b1; #10;
		MDRout = 1'b0; InPortout = 1'b1; #10;
		InPortout = 1'b0; Cout = 1'b1; #10;
		Cout = 1'b0; i24out = 1'b1; #10;
		i24out = 1'b0; i25out = 1'b1; #10;
		i25out = 1'b0; i26out = 1'b1; #10;
		i26out = 1'b0; i27out = 1'b1; #10;
		i27out = 1'b0; i28out = 1'b1; #10;
		i28out = 1'b0; i29out = 1'b1; #10;
		i29out = 1'b0; i30out = 1'b1; #10;
		i30out = 1'b0; i31out = 1'b1; #10;
		i31out = 1'b0;

		
		
	end
	
endmodule
