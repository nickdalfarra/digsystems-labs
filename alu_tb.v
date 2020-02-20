module alu_tb;
   reg clk = 1'b0;
   reg AND = 1'b0;
   reg OR = 1'b0;
   reg ADD = 1'b0;
   reg SUB = 1'b0;
   reg MUL = 1'b1;
   reg DIV = 1'b0;
   reg SHR = 1'b0;
   reg SHL = 1'b0;
   reg ROR = 1'b0;
   reg ROL = 1'b0;
   reg NEG = 1'b0;
   reg NOT = 1'b0;
   reg IncPC = 1'b0;   
   reg [31:0] A;
   reg [31:0] B;
   wire [63:0] C;      
   
   Alu alu(clk, AND, OR, ADD, SUB, MUL, DIV, SHR, SHL, ROR, ROL, NEG, NOT, IncPC, A, B, C);

   initial begin
      $dumpfile("alu_tb.vcd");
      $dumpvars(0, alu);
      forever #10 clk = ~clk;     
   end

   initial begin
      #500 $finish;
   end 
   
   always @(posedge clk) begin
      A <= 22;
      B <= 24;
   end
   
endmodule // alu_tb
