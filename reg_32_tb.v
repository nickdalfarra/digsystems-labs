module reg_32_tb();
   
   reg clr = 1'b0;
   reg clk = 1'b0;
   reg r1in = 1'b1;
   wire [31:0] D;
   wire [31:0] Q;
   reg [31:0]  temp = 'b1;

   Register r0(clr, clk, r1in, D, Q);
   
   initial begin
      $dumpfile("reg_32_tb.vcd");
      $dumpvars(0, r0);
      forever #10 clk = ~clk;
   end

   initial begin
      #500 $finish;
   end
   
   always @(posedge clk) begin
      temp = ~temp;
   end

   always @(posedge clk) begin
      #40
      r1in = ~r1in;
   end
   
   always @(posedge clk) begin
      #80
	clr = ~clr;
   end

   assign D = temp;
   
endmodule
