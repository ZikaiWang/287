module floatAlu (
    floatA,
    floatB,
    o
);  // >

  input [15:0] floatA, floatB;
  output reg o;

	reg c1,c2;
  
  always @(floatA or floatB) begin
	
	c1 = floatA[15] != floatB[15];
	c2 = floatA[14:10] != floatB[14:10];
    
	 case({c1,c2})
		2'b01:
		o <= (floatA[14:10] > floatB[14:10]);
		2'b00:
		o <= (floatA[9:0] > floatB[9:0]);
		default:
		o <= (~floatA[15]) & floatB[15];
	 endcase

  end

endmodule


module floatAlu_clk (
clk,
    floatA,
    floatB,
    o
);  // >

  input [15:0] floatA, floatB;
  output reg o;
input clk;
	reg c1,c2;
  
  always @(posedge clk,posedge floatA,posedge floatB) begin
	
	c1 = floatA[15] != floatB[15];
	c2 = floatA[14:10] != floatB[14:10];
    
	 case({c1,c2})
		2'b01:
		o <= (floatA[14:10] > floatB[14:10]);
		2'b00:
		o <= (floatA[9:0] > floatB[9:0]);
		default:
		o <= (~floatA[15]) & floatB[15];
	 endcase

  end

endmodule

module floatAlu_clk_n (
    clk,
    floatA,
    floatB,
    o
);  // >

  input [15:0] floatA, floatB;
  output reg o;
input clk;
	reg c1,c2;
  
  always @(*) begin
	
	c1 = floatA[15] != floatB[15];
	c2 = floatA[14:10] != floatB[14:10];
    
	 case({c1,c2})
		2'b01:
		o <= (floatA[14:10] < floatB[14:10]);
		2'b00:
		o <= (floatA[9:0] < floatB[9:0]);
		default:
		o <= (floatA[15]) & ~floatB[15];
	 endcase

  end

endmodule
