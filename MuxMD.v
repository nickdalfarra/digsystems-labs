module MuxMD (input read, input [31:0] BusMuxOut, Mdatain, output [31:0] D);

   reg [31:0] D_r;
   
   always @(*) begin
      if (read == 1)
	D_r = Mdatain;
      else
	D_r = BusMuxOut;
   end
      
   assign D = D_r;
	
endmodule // MuxMD
