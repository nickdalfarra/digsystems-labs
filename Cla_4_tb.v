module Cla_4_tb;

	reg [3:0] x, y;
	reg c0;
	wire G, P, c4;
	wire [3:0] s;
	
	reg clk = 1;
	
	Cla_4 cla4dut (x, y, c0, G, P, c4, s);
   
   initial begin
      $dumpfile("Cla_4_tb.vcd");
      $dumpvars(0, cla4dut);
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
