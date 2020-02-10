module Bit_stage_tb;

	reg x, y, c;
	wire G, P, s;
	
	reg clk = 1;
	
	Bit_stage bsdut (x, y, c, G, P, s);
   
   initial begin
      $dumpfile("Bit_stage_tb.vcd");
      $dumpvars(0, bsdut);
      forever #10 clk = ~clk;     
   end

   initial begin
      #500 $finish;
   end
   
   always @(posedge clk) begin
		c = 0;
      x = 0; y = 0; #50;
		x = 0; y = 1; #50;
		x = 1; y = 0; #50;
		x = 1; y = 1; #50;
		
		c = 1;
		x = 0; y = 0; #50;
		x = 0; y = 1; #50;
		x = 1; y = 0; #50;
		x = 1; y = 1; #50;
   end

endmodule
