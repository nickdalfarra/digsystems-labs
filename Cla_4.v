module Cla_4(input [3:0] x, y, input c0, output G, P, c4, output [3:0] s);
   wire g0;
   wire p0;
   wire g1;
   wire p1;
   wire g2;
   wire p2;
   wire g3;
   wire p3;
   wire c1;
   wire c2;
   wire c3;

   // Send each bit of x and y down to the bit stage cell
   Bit_stage bit_stage1(x[0], y[0], c0, g0, p0, s[0]);
   Bit_stage bit_stage2(x[1], y[1], c1, g1, p1, s[1]);
   Bit_stage bit_stage3(x[2], y[2], c2, g2, p2, s[2]);
   Bit_stage bit_stage4(x[3], y[3], c3, g3, p3, s[3]);

   // Just the equations for the CLA logic from course reader
   and(P, p0, p1, p2, p3);  
   assign G = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0);
   assign c1 = g0 | (p0 & c0);
   assign c2 = g1 | (p1 & g0) | (p1 & p0 & c0);
   assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & c0);
   assign c4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & c0);

   
   
endmodule
