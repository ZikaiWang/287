module qTolalDis (
    floatA,
    floatB,
    o,
	 clk
);  // >

  input [95:0] floatA;
  input [15:0] floatB;
  input clk;
  output wire [15:0] o;
  wire [15:0] t1,t2,t3,t4,t5,t6,t7;
	
  
  l2Dis qTol1(
    floatA[15:0],
    floatB,
    t1,
	 clk
);

  l2Dis qTol2(
    floatA[31 : 16],
    floatB,
    t2,
	 clk
);

  l2Dis qTol3(
    floatA[47 : 32],
    floatB,
    t3,
	 clk
);

  l2Dis qTol4(
    floatA[63 : 48],
    floatB,
    t4,
	 clk
);

  l2Dis qTol5(
    floatA[79 : 64],
    floatB,
    t5,
	 clk
);

  l2Dis qTol6(
    floatA[95 : 80],
    floatB,
    t6,
	 clk
);

  l2Dis qTol7(
    floatA[111 : 96],
    floatB,
    t7,
	 clk
);


endmodule