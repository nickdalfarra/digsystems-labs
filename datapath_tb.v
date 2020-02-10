module datapath_tb();
   reg PCout, Zlowout, MDRout, R2out, R4out;
   reg MARin, Zin, PCin, MDRin, IRin, Yin;
   reg IncPC, Read, AND, R5in, R2in, R4in;
   reg Clock;
   reg [31:0] Mdatain;

   parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
   reg [3:0]  Present_state = Default;

   Datapath DUT(.PCout(PCout), .Zlowout(Zlowout), .MDRout(MDRout), .R2out(R2out), .R4out(R4out), .MARin(MARin), .Zin(Zin), .PCin(PCin), .MDRin(MDRin), .IRin(IRin), .Yin(Yin), .IncPC(IncPC), .read(Read), .AND(AND), .R5in(R5in), .R2in(R2in), .R4in(R4in), .clk(Clock), .Mdatain(Mdatain));

   initial begin
      Clock = 0;
      $dumpfile("datapath_tb.vcd");
      $dumpvars(0, DUT);
      forever #10 Clock = ~Clock;
   end

   initial begin
      #500 $finish;
   end

   always @(posedge Clock) begin
      case (Present_state)
	Default : Present_state = Reg_load1a;
	Reg_load1a : Present_state = Reg_load1b;
	Reg_load1b : Present_state = Reg_load2a;
	Reg_load2a : Present_state = Reg_load2b;
	Reg_load2b : Present_state = Reg_load3a;
	Reg_load3a : Present_state = Reg_load3b;
	Reg_load3b : Present_state = T0;
	T0 : Present_state = T1;
	T1 : Present_state = T2;
	T2 : Present_state = T3;
	T3 : Present_state = T4;
	T4 : Present_state = T5;
      endcase // case (Present_state)      
   end // always @ (posedge Clock)

   always @(Present_state) begin
      case(Present_state)
	Default: begin
	   PCout <= 0;
	   Zlowout <= 0;
	   MDRout <= 0;
	   R2out <= 0;
	   R4out <= 0;
	   MARin <= 0;
	   Zin <= 0;
	   PCin <= 0;
	   MDRin <= 0;
	   IRin <= 0;
	   Yin <= 0;
	   IncPC <= 0;
	   Read <= 0;
	   AND <= 0;
	   R5in <= 0;
	   R2in <= 0;
	   R4in <= 0;
	   Mdatain <= 32'h00000000;
	end // case: Default
	Reg_load1a: begin
	   $display("hello");
	   
	   Mdatain <= 32'h00000022;
	   Read = 0;
	   MDRin = 0;
	   #5 Read <= 1; MDRin <= 1;
	   #10 Read <= 0; MDRin <= 0;
	end
	Reg_load1b: begin
	   $display("in 1b");
	   
	   #5 MDRout <= 1; R2in <= 1;
	   #10 MDRout <= 0; R2in <= 0;
	end
	Reg_load2a: begin
	   $display("in 2a");
	   
	   Mdatain <= 32'h00000024;
	   #5 Read <= 1; MDRin <= 1;
	   #10 Read <= 0; MDRin <= 0;
	end
	Reg_load2b: begin
	   $display("in 2b");
	   
	   #5 MDRout <= 1; R4in <= 1;
	   #10 MDRout <= 0; R4in <= 0;
	end
	Reg_load3a: begin
	   $display("in 3a");
	   
	   Mdatain <= 32'h00000026;
	   #5 Read <= 1; MDRin <= 1;
	   #10 Read <= 0; MDRin <= 0;
	end
	Reg_load3b: begin
	   $display("in 3b");
	   
	   #5 MDRout <= 1; R5in <= 1;
	   #10 MDRout <= 0; R5in <= 0;
	end
	T0: begin
	   $display("in T0");
	   
	   PCout <= 1;
	   MARin <= 1;
	   IncPC <= 1;
	   Zin <= 1;
	end
	T1: begin
	   $display("in T1");
	   
	   Zlowout <= 1;
	   PCin <= 1;
	   Read <= 1;
	   MDRin <= 1;
	   Mdatain <= 32'h4A920000;
	end
	T2: begin
	   $display("in T2");
	   MDRout <= 1;
	   IRin <= 1;
	end
	T3: begin
	   $display("in T3");
	   R2out <= 1;
	   Yin <= 1;
	end
	T4: begin
	   $display("in T4");
	   R4out <= 1;
	   AND <= 1;
	   Zin <= 1;
	end
	T5: begin
	   $display("in T5");
	   Zlowout <= 1;
	   R5in <= 1;
	end
      endcase // case (Present_state)
   end // always @ (Present_state)   
endmodule // datapath_tb
