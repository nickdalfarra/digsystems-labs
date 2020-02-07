module multiplier_tb();
   reg [31:0] M;
   reg [31:0] Q;
   reg 	      clk = 0;
   wire [63:0] P;
   
   
   Multiplier mult(M, Q, P);
   
   initial begin
      $dumpfile("mult_tb.vcd");
      $dumpvars(0, mult);
      forever #10 clk = ~clk;     
   end

   initial begin
      #500 $finish;
   end
   
   always @(posedge clk) begin
      M <= 616;
      Q <= -81;
   end
endmodule // multiplier_tb
