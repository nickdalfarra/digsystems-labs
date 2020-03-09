module inport_outport_tb();
   reg clr = 1'b1;
   reg clk = 1'b0;
   reg strobe = 1'b1;   
   reg [31:0] D;
   wire [31:0] Q;

   Inport inport(clr, clk, strobe, D, Q);

   initial begin
      $dumpfile("inport_outport_tb.vcd");
      $dumpvars(0, inport);
      forever #10 clk = ~clk;
   end

   initial begin
      #500 $finish;
   end

   always @(posedge clk) begin
      D <= 2;
      
   end
   
   
endmodule // inport_tb
