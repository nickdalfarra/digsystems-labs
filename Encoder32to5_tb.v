module Encoder32to5_tb;

   wire [4:0] out;

   reg clk = 0;
   
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
   
   Encoder32to5 dut (R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout, Cout, unused, unused, unused, unused, unused, unused, unused, unused, out);

   initial begin
      //take out next two lines if running on altera
      $dumpfile("tb_Encoder32to5.vcd");
      $dumpvars(0, dut);
      forever #10 clk = ~clk;
   end

   // take this initial out when running on altera
   initial begin
      #500 $finish; 
   end
   
   // apply inputs one at a time
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
		R10out = 1'b0;
      
   end
   
endmodule


