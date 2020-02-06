module Cla_16(input [15:0] x, y, input c0, output G, P, c16, output [15:0] s);
   wire g0;
   wire p0;
   wire g1;
   wire p1;
   wire g2;
   wire p2;
   wire g3;
   wire p3;
   wire c4;
   wire c8;
   wire c12;

   Cla_4 cla1(x[3:0], y[3:0], c0, g0, p0, c4, s[3:0]);
   Cla_4 cla2(x[7:4], y[7:4], c4, g1, p1, c8, s[7:4]);
   Cla_4 cla3(x[11:8], y[11:8], c8, g2, p2, c12, s[11:8]);
   Cla_4 cla4(x[15:12], y[15:12], c12, g3, p3, c16, s[15:12]);

   assign P = p0 & p1 & p2 & p3;
   assign G = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0);
   assign c4 = g0 | (p0 & c0);
   assign c8 = g1 | (p1 & g0) | (p1 & p0 & c0);
   assign c12 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & c0);
   assign c16 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & c0);

endmodule // Cla_16

   
