module cla_tb();

   reg [31:0] x, y;
   reg c_in;
   wire G;
   wire P;
	wire c32;
   wire [31:0] sum;
	
   reg 	clk = 0;
   
   Cla_32 cla_32(x, y, c_in, G, P, c32, sum);
   
   initial begin
      $dumpfile("cla_tb.vcd");
      $dumpvars(0, cla_32);
      forever #10 clk = ~clk;     
   end

   initial begin
      #500 $finish;
   end
   
   always @(posedge clk) begin
      x <= 32'b1;
      y <= 32'hFFFFFFFF;
      c_in <= 0; 
   end
   
endmodule
