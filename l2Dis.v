module l2Dis (
    floatA,
    floatB,
    o,
	 clk
);  // >

  input [15:0] floatA, floatB,clk;
  output wire [15:0] o;
  wire [15:0] l1Dis;

  
  floatAdd2 ml1(
    floatA,
    {(~floatB[15]),floatB[14:0]},
    l1Dis
);

floatMut ml2(
    l1Dis,
    l1Dis,
    o
);

endmodule