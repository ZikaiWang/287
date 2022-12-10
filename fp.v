module fp (
    input clk,
    rst,
    start,
    output [6:0] o,
    output reg [15:0] value
);

wire [3:0] numShow;
wire clks;

  seven_segment H1 (
      .i(numShow),
      .o(o)
  );

  //1.00097656 + 0.99951172 = 2.00048828
  //floatAdd2 A1(.floatA(16'b0110000011011100), .floatB(16'b0101111111011001), .o(value));
  //floatMut A2(.floatA(16'b0110000011011100), .floatB(16'b0101111111011001), .o(value));
  //floatAlu A2(.floatA(16'b1101011000110000), .floatB(16'b0100100010000000), .o(value));



  softmax_n s1 (
      .start(start),
      .float0(16'b0100011010011010),
      .float1(16'b0100011000011010),
      .float2(16'b0100011010110011),
      .float3(16'b0100011100000000),
      .float4(16'b0100011000000000),
      .float5(16'b0011110000000000),
      .float6(16'b0000000000000000),
      .float7(16'b0101010100010000),
      .float8(16'b0100100000000000),
      .float9(16'b0100011111100110),
      .count(numShow),
      .clk(clks),
      .rst(rst)
  );

  
  
  /*
  // 0101000010000000
  l2Dis l21(
    .floatA(16'b0100010100000000),
    .floatB(16'b1011110000000000),
    .o(value),
	 .clk(clk)
);
*/


slowDown sd1(
    clk,
	 rst,
    clks
);


always@(*)
	begin
		value = numShow;
	end

endmodule
