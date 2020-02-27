module sel_enc_tb();
   reg clk = 0;

   reg Gra, Grb, Grc, Rin, Rout, BAout;

   reg [31:0] IR;

   wire [15:0] Rins, Routs;

   wire [31:0] C_sign_ext;
   
   

   Sel_Enc sel_enc(Gra, Grb, Grc, Rin, Rout, BAout, IR, Rins, Routs, C_sign_ext);
   

   initial begin
      #500 $finish;
      
   end

   initial begin
            $dumpfile("sel_enc_tb.vcd");
      $dumpvars(0, sel_enc);
      forever #10 clk = ~clk;
   end

   always @(posedge clk)
     begin
	IR <= 32'h0771000F;
	Gra <= 0;
	Grb <= 1;
	Grc <= 0;
	Rin <= 0;
	Rout <= 1;	
     end

   
   
endmodule // sel_enc_tb
