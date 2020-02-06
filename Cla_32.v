module Cla_32(input [31:0] x, y, input c0, output G, P, c32, output [31:0] s);
   wire g0;
   wire p0;
   wire g1;
   wire p1;
   wire c16;
   
   Cla_16 cla1(x[15:0], y[15:0], c0, g0, p0, c16, s[15:0]);
   Cla_16 cla2(x[31:16], y[31:16], c16, g1, p1, c32, s[31:16]);

   assign P = p0 & p1;
   assign G = g1 | (p1 & g0);
   assign c16 = g0 | (p0 & c0);
   assign c32 = g1 | (p1 & g0) | (p1 & p0 & c0);
endmodule
