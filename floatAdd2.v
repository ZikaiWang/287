module floatAdd2 (
    floatA,
    floatB,
    o
);

  input [15:0] floatA, floatB;
  output reg [15:0] o;

  reg sign;
  reg signed [5:0] exponent;  //fifth bit is sign
  reg [9:0] mantissa;
  reg [4:0] exponentA, exponentB;
  reg [10:0] fractionA, fractionB, fraction;  //fraction = {1,mantissa}
  reg [7:0] shiftAmount;
  reg cout;

  always @(floatA or floatB) begin
    exponentA = floatA[14:10];
    exponentB = floatB[14:10];
    fractionA = {1'b1, floatA[9:0]};
    fractionB = {1'b1, floatB[9:0]};

    exponent  = exponentA;

    if (exponentB > exponentA) begin
      shiftAmount = exponentB - exponentA;
      fractionA   = fractionA >> (shiftAmount);
      exponent    = exponentB;
    end else if (exponentA > exponentB) begin
      shiftAmount = exponentA - exponentB;
      fractionB   = fractionB >> (shiftAmount);
      exponent    = exponentA;
    end

    if (floatA[15] == floatB[15]) begin  //same sign
      {cout, fraction} = fractionA + fractionB;
      if (cout == 1'b1) begin
        {cout, fraction} = {cout, fraction} >> 1;
        exponent = exponent + 1'd1;
      end
      sign = floatA[15];
    end else begin  //different signs
      if (floatA[15] == 1'b1) begin
        {cout, fraction} = fractionB - fractionA;
      end else begin
        {cout, fraction} = fractionA - fractionB;
      end
      sign = cout;
      if (cout == 1'b1) begin
        fraction = -fraction;
      end else begin
      end
      casex (fraction)
        10'b1?_????_????: begin
          fraction = fraction << 4'd1;
          exponent = exponent - 4'd1;
        end
        10'b01_????_????: begin
          fraction = fraction << 4'd2;
          exponent = exponent - 4'd2;
        end
        10'b00_1???_????: begin
          fraction = fraction << 4'd3;
          exponent = exponent - 4'd3;
        end
        10'b00_01??_????: begin
          fraction = fraction << 4'd4;
          exponent = exponent - 4'd4;
        end
        10'b00_001?_????: begin
          fraction = fraction << 4'd5;
          exponent = exponent - 4'd5;
        end
        10'b00_0001_????: begin
          fraction = fraction << 4'd6;
          exponent = exponent - 4'd6;
        end
        10'b00_0000_1???: begin
          fraction = fraction << 4'd7;
          exponent = exponent - 4'd7;
        end
        10'b00_0000_01??: begin
          fraction = fraction << 4'd8;
          exponent = exponent - 4'd8;
        end
        10'b00_0000_001?: begin
          fraction = fraction << 4'd9;
          exponent = exponent - 4'd9;
        end
        10'b00_0000_0001: begin
          fraction = fraction << 4'd10;
          exponent = exponent - 4'd10;
        end
        default: begin
        end
      endcase
    end

    mantissa = fraction[9:0];
    if (exponent[5] == 1'b1) begin  //exponent is negative
      o = 16'b0000000000000000;
    end else begin
      o = {sign, exponent[4:0], mantissa};
    end

  end

endmodule