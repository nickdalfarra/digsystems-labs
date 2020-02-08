module MDR_tb();

   reg clk = 0;
   reg clr = 0;
   reg read = 1'b1;
   reg mdrin = 1'b1;
   reg [31:0] bmi;
   reg [31:0] mdi;
   wire [31:0] D;
   wire [31:0] Q;
   reg 	      temp = 0;

   MuxMD md_mux(read, bmi, mdi, D);
   MDR mdr(clr, clk, mdrin, D, Q);
   
   initial begin
      $dumpfile("MDR_tb.vcd");
      $dumpvars(0, mdr, md_mux);
      forever #10 clk = ~clk;
   end

   initial begin
      #500 $finish;
   end
   
   always @(posedge clk) begin
      #40
      mdrin = ~mdrin;
   end
   
   always @(posedge clk) begin
      #80
      clr = ~clr;
   end

   always @(posedge clk) begin
      #100
      read = ~read;
   end
   
   always @(posedge clk) begin
      bmi <= 2;
      mdi <= 3;
   end

   
endmodule
