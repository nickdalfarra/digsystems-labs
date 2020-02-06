module Mux8bit32to1_tb;

	reg clk = 0;
	reg [4:0] select = 0;
	wire [7:0] out_signal;
	
	reg [7:0] i0 = 69;
	reg [7:0] i1 = 10;
	reg [7:0] i2 = 20;
	reg [7:0] i3 = 30;
	reg [7:0] i4 = 40;
	reg [7:0] i5 = 50;
	reg [7:0] i6 = 60;
	reg [7:0] i7 = 70;
	reg [7:0] i8 = 80;
	reg [7:0] i9 = 90;
	reg [7:0] i10 = 100;
	reg [7:0] i11 = 110;
	reg [7:0] i12 = 120;
	reg [7:0] i13 = 130;
	reg [7:0] i14 = 140;
	reg [7:0] i15 = 150;
	reg [7:0] i16 = 160;
	reg [7:0] i17 = 170;
	reg [7:0] i18 = 180;
	reg [7:0] i19 = 190;
	reg [7:0] i20 = 200;
	reg [7:0] i21 = 210;
	reg [7:0] i22 = 220;
	reg [7:0] i23 = 230;
	reg [7:0] i24 = 240;
	reg [7:0] i25 = 250;
	reg [7:0] i26 = 216;
	reg [7:0] i27 = 217;
	reg [7:0] i28 = 218;
	reg [7:0] i29 = 219;
	reg [7:0] i30 = 130;
	reg [7:0] i31 = 131;
	
	Mux8bit32to1 dut (select, i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29, i30, i31, out_signal);

	
	initial begin
      //take out next two lines if running on altera
      $dumpfile("tb_Mux8bit32to1.vcd");
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