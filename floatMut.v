module floatMut (
    floatA,
    floatB,
    o
);

  input [15:0] floatA, floatB;
  output reg [15:0] o;

  reg signed [5:0] exponent;
  reg [21:0] fraction;

  always @(floatA or floatB) begin

    exponent = floatA[14:10] + floatB[14:10] - 5'd15 + 5'd2;
    fraction = {1'b1, floatA[9:0]} * {1'b1, floatB[9:0]};

    if (fraction[21] == 1'b1) begin
      fraction = fraction << 4'd1;
      exponent = exponent - 4'd1;
    end else if (fraction[20] == 1'b1) begin
      fraction = fraction << 4'd2;
      exponent = exponent - 4'd2;
    end else if (fraction[19] == 1'b1) begin
      fraction = fraction << 4'd3;
      exponent = exponent - 4'd3;
    end else if (fraction[18] == 1'b1) begin
      fraction = fraction << 4'd4;
      exponent = exponent - 4'd4;
    end else if (fraction[17] == 1'b1) begin
      fraction = fraction << 4'd5;
      exponent = exponent - 4'd5;
    end else if (fraction[16] == 1'b1) begin
      fraction = fraction << 4'd6;
      exponent = exponent - 4'd6;
    end else if (fraction[15] == 1'b1) begin
      fraction = fraction << 4'd7;
      exponent = exponent - 4'd7;
    end else if (fraction[14] == 1'b1) begin
      fraction = fraction << 4'd8;
      exponent = exponent - 4'd8;
    end else if (fraction[13] == 1'b1) begin
      fraction = fraction << 4'd9;
      exponent = exponent - 4'd9;
    end else if (fraction[12] == 1'b0) begin
      fraction = fraction << 4'd10;
      exponent = exponent - 4'd10;
    end

    if (exponent[5] == 1'b1) begin  //exponent is negative
      o = 16'b0000000000000000;
    end else begin
      o = {floatA[15] ^ floatB[15], exponent[4:0], fraction[21:12]};
    end
  end

endmodule