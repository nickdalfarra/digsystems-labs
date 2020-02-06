module Adder2bit_tb();
	
	reg X = 0;
	reg Y = 0;
	wire out;
	
	reg clk;
	
	Adder2bit dut (X, Y, out);
	
	initial begin
      //take out next two lines if running on altera
      $dumpfile("Adder2bit_tb.vcd");
      $dumpvars(0, dut);
		clk = 0;
      forever #10 clk = ~clk;
   end
	
	initial begin
      #500 $finish; 
   end
	
	always @(posedge clk) begin
	
		X = 1'b1; #10;
		Y = 1'b1; #10;
		X = 1'b0; #10;
		Y = 1'b0; #10;
	
	end
	
endmodule
