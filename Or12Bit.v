module Or12Bit(input [3:0] w, x, y, output [3:0] z);
   or(z[0], w[0], x[0], y[0]);
   or(z[1], w[1], x[1], y[1]);
   or(z[2], w[2], x[2], y[2]);
   or(z[3], w[3], x[3], y[3]);
   
endmodule // Or12Bit
