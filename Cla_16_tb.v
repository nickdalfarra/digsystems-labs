module Cla_16_tb;

	reg [15:0] x, y;
	reg c0;
	wire G, P, c16;
	wire [15:0] s;

	reg clk = 1;
	
	Cla_16 cla16dut (x, y, c0, G, P, c16, s);
   
   initial begin
      $dumpfile("Cla_16_tb.vcd");
      $dumpvars(0, cla16dut);
      forever #10 clk = ~clk;     
   end

   initial begin
      #500 $finish;
   end
   
   always @(posedge clk) begin
		c0 = 0;
      x = 0; y = 0; #50;
		x = 0; y = 1; #50;
		x = 1; y = 0; #50;
		x = 6; y = 9; #50;
		
		c0 = 1;
		x = 0; y = 0; #50;
		x = 0; y = 1; #50;
		x = 1; y = 0; #50;
		x = 1; y = 1; #50;
   end
	
endmodule
