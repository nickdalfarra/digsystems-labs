module Mux32bit32to1_tb;

	reg clk = 0;
	reg [4:0] select = 0;
	wire [31:0] out_signal;
	
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
	reg unused = 1'b0;
	
	reg [31:0] i0 = 1;
	reg [31:0] i1 = 2**1;
	reg [31:0] i2 = 2**2;
	reg [31:0] i3 = 2**3;
	reg [31:0] i4 = 2**4;
	reg [31:0] i5 = 2**5;
	reg [31:0] i6 = 2**6;
	reg [31:0] i7 = 2**7;
	reg [31:0] i8 = 2**8;
	reg [31:0] i9 = 2**9;
	reg [31:0] i10 = 2**10;
	reg [31:0] i11 = 2**11;
	reg [31:0] i12 = 2**12;
	reg [31:0] i13 = 2**13;
	reg [31:0] i14 = 2**14;
	reg [31:0] i15 = 2**15;
	reg [31:0] i16 = 2**16;
	reg [31:0] i17 = 2**17;
	reg [31:0] i18 = 2**18;
	reg [31:0] i19 = 2**19;
	reg [31:0] i20 = 2**20;
	reg [31:0] i21 = 2**21;
	reg [31:0] i22 = 2**22;
	reg [31:0] i23 = 2**23;
	reg [31:0] i24 = 2**24;
	reg [31:0] i25 = 2**25;
	reg [31:0] i26 = 2**26;
	reg [31:0] i27 = 2**27;
	reg [31:0] i28 = 2**28;
	reg [31:0] i29 = 2**29;
	reg [31:0] i30 = 2**30;
	reg [31:0] i31 = 2**31;
	
	Mux32bit32to1 dut (select, i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, out_signal);
	
	initial begin
      //take out next two lines if running on altera
      $dumpfile("tb_Mux32bit32to1.vcd");
      $dumpvars(0, dut);
      forever #10 clk = ~clk;
   end
	
	initial begin
      #500 $finish; 
   end
	
	always @(posedge clk) begin
      
      select = 0; #10; //apply input, wait
      select = 1; #10;
		select = 2; #10;
		select = 3; #10;
		select = 4; #10;
		select = 5; #10;
		select = 6; #10;
		select = 7; #10;
		select = 8; #10;
		select = 9; #10;
		select = 10; #10;
		select = 11; #10;
		select = 12; #10;
		select = 13; #10;
		select = 14; #10;
		select = 15; #10;
		select = 16; #10;
		select = 17; #10;
		select = 18; #10;
		select = 19; #10;
		select = 20; #10;
		select = 21; #10;
		select = 22; #10;
		select = 23; #10;
		select = 24; #10;
		select = 25; #10;
		select = 26; #10;
		select = 27; #10;
		select = 28; #10;
		select = 29; #10;
		select = 30; #10;
		select = 31; #10;
		
	end

endmodule
