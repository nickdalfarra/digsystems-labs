module And4Bit(input [3:0] x, input y, output [3:0] z);
   and(z[0], x[0], y);
   and(z[1], x[1], y);
   and(z[2], x[2], y);
   and(z[3], x[3], y);   
endmodule // 4And
