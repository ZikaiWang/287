module softmax (
    start,
    float0,
    float1,
    float2,
    float3,
    float4,
    float5,
    float6,
    float7,
    float8,
    float9,
    count,
    clk,
    rst
);  // >
  input start, clk, rst;
  input [15:0] float0, float1, float2, float3, float4, float5, float6, float7, float8, float9;
  output reg [3:0] count;

  parameter	S_a = 5'd0,
				S_b = 5'd1,
				S_c = 5'd2,
				S_d = 5'd3,
				S_e = 5'd4,
				S_f = 5'd5,
				S_g = 5'd6,
				S_h = 5'd7,
				S_i = 5'd8,
				S_j = 5'd9,
				S_k = 5'd10,
				S_l = 5'd11,
				S_m = 5'd12,
				S_n = 5'd13,
				S_o = 5'd14,
				S_p = 5'd15,
				S_q = 5'd16,
				S_r = 5'd17,
				S_s = 5'd18,
				S_z = 5'd19,
				w1=5'd20,
				w2=5'd21,
				w3=5'd22,
				w4=5'd23,
				w5=5'd24,
				w6=5'd25,
				w7=5'd26,
				w8=5'd27,
				w9=5'd28;

  reg [4:0] S, NS;

  reg [15:0] temp0, temp1;
  wire check;

  floatAlu_clk alu1 (
      clk,
      temp0,
      temp1,
      check
  );

  always @(posedge clk or negedge rst) begin
    case (S)
      S_a: begin
        temp0 <= float0;
        temp1 <= float1;
		  count <= 4'b1111;
      end
      S_b: begin
        if (check) begin
          count <= 4'd0;
          temp0 <= float0;
        end else begin
          count <= 4'd1;
          temp0 <= float1;
        end
      end
      S_c: begin
        temp1 <= float2;
      end
      S_d: begin
        if (!check) begin
          count <= 4'd2;
          temp0 <= temp1;
        end
      end
      S_e: begin
        temp1 <= float3;
      end
      S_f: begin
        if (!check) begin
          count <= 4'd3;
          temp0 <= temp1;
        end
      end
      S_g: begin
        temp1 <= float4;
      end
      S_h: begin
        if (!check) begin
          count <= 4'd4;
          temp0 <= temp1;
        end
      end
      S_i: begin
        temp1 <= float5;
      end
      S_j: begin
        if (!check) begin
          count <= 4'd5;
          temp0 <= temp1;
        end
      end
      S_k: begin
        temp1 <= float6;
      end
      S_l: begin
        if (!check) begin
          count <= 4'd6;
          temp0 <= temp1;
        end
      end
      S_m: begin
        temp1 <= float7;
      end
      S_n: begin
        if (!check) begin
          count <= 4'd7;
          temp0 <= temp1;
        end
      end
      S_o: begin
        temp1 <= float8;
      end
      S_p: begin
        if (!check) begin
          count <= 4'd8;
          temp0 <= temp1;
        end
      end
      S_q: begin
        temp1 <= float9;
      end
      S_r: begin
        if (!check) begin
          count <= 4'd9;
          temp0 <= temp1;
        end
      end
      S_z: begin

      end

      default: begin
      end
    endcase
  end

  always @(posedge clk or negedge rst) begin
    if (rst == 1'b0) begin
      S <= S_a;
    end else begin
      S <= NS;
    end
  end

  always @(*) begin
    case (S)
      S_a: begin
        if (start) NS = S_b;
        else NS = S_a;
      end
      S_b: begin
        NS = S_c;
      end
      S_c: begin
        NS = w1;
      end
		w1:NS = S_d;
      S_d: begin
        NS = S_e;
      end
      S_e: begin
        NS = w2;
      end
		w2:NS = S_f;
      S_f: begin
        NS = S_g;
      end
      S_g: begin
        NS = w3;
      end
		w3:NS = S_h;
      S_h: begin
        NS = S_i;
      end
      S_i: begin
        NS = w4;
      end
		w4:NS = S_j;
      S_j: begin
        NS = S_k;
      end
      S_k: begin
        NS = w5;
      end
		w5:NS = S_l;
      S_l: begin
        NS = S_m;
      end
      S_m: begin
        NS = w6;
      end
		w6:NS = S_n;
      S_n: begin
        NS = S_o;
      end
      S_o: begin
        NS = w7;
      end
		w7:NS = S_p;
      S_p: begin
        NS = S_q;
      end
      S_q: begin
        NS = w8;
      end
		w8:NS = S_r;
      S_r: begin
        NS = S_s;
      end
      S_s: begin
        NS = S_z;
      end
      S_z: begin
        NS = S_z;
      end

      default: NS = S_a;
    endcase
  end


endmodule

module softmax_n (
    start,
    float0,
    float1,
    float2,
    float3,
    float4,
    float5,
    float6,
    float7,
    float8,
    float9,
    count,
    clk,
    rst
);  // >
  input start, clk, rst;
  input [15:0] float0, float1, float2, float3, float4, float5, float6, float7, float8, float9;
  output reg [3:0] count;

  parameter	S_a = 5'd0,
				S_b = 5'd1,
				S_c = 5'd2,
				S_d = 5'd3,
				S_e = 5'd4,
				S_f = 5'd5,
				S_g = 5'd6,
				S_h = 5'd7,
				S_i = 5'd8,
				S_j = 5'd9,
				S_k = 5'd10,
				S_l = 5'd11,
				S_m = 5'd12,
				S_n = 5'd13,
				S_o = 5'd14,
				S_p = 5'd15,
				S_q = 5'd16,
				S_r = 5'd17,
				S_s = 5'd18,
				S_z = 5'd19,
				w1=5'd20,
				w2=5'd21,
				w3=5'd22,
				w4=5'd23,
				w5=5'd24,
				w6=5'd25,
				w7=5'd26,
				w8=5'd27,
				w9=5'd28;

  reg [4:0] S, NS;

  reg [15:0] temp0, temp1;
  wire check;

  floatAlu_clk_n alu1 (
      clk,
      temp0,
      temp1,
      check
  );

  always @(posedge clk or negedge rst) begin
    case (S)
      S_a: begin
        temp0 <= float0;
        temp1 <= float1;
		  count <= 4'b1111;
      end
      S_b: begin
        if (check) begin
          count <= 4'd0;
          temp0 <= float0;
        end else begin
          count <= 4'd1;
          temp0 <= float1;
        end
      end
      S_c: begin
        temp1 <= float2;
      end
      S_d: begin
        if (!check) begin
          count <= 4'd2;
          temp0 <= temp1;
        end
      end
      S_e: begin
        temp1 <= float3;
      end
      S_f: begin
        if (!check) begin
          count <= 4'd3;
          temp0 <= temp1;
        end
      end
      S_g: begin
        temp1 <= float4;
      end
      S_h: begin
        if (!check) begin
          count <= 4'd4;
          temp0 <= temp1;
        end
      end
      S_i: begin
        temp1 <= float5;
      end
      S_j: begin
        if (!check) begin
          count <= 4'd5;
          temp0 <= temp1;
        end
      end
      S_k: begin
        temp1 <= float6;
      end
      S_l: begin
        if (!check) begin
          count <= 4'd6;
          temp0 <= temp1;
        end
      end
      S_m: begin
        temp1 <= float7;
      end
      S_n: begin
        if (!check) begin
          count <= 4'd7;
          temp0 <= temp1;
        end
      end
      S_o: begin
        temp1 <= float8;
      end
      S_p: begin
        if (!check) begin
          count <= 4'd8;
          temp0 <= temp1;
        end
      end
      S_q: begin
        temp1 <= float9;
      end
      S_r: begin
        if (!check) begin
          count <= 4'd9;
          temp0 <= temp1;
        end
      end
      S_z: begin

      end

      default: begin
      end
    endcase
  end

  always @(posedge clk or negedge rst) begin
    if (rst == 1'b0) begin
      S <= S_a;
    end else begin
      S <= NS;
    end
  end

  always @(*) begin
    case (S)
      S_a: begin
        if (start) NS = S_b;
        else NS = S_a;
      end
      S_b: begin
        NS = S_c;
      end
      S_c: begin
        NS = w1;
      end
		w1:NS = S_d;
      S_d: begin
        NS = S_e;
      end
      S_e: begin
        NS = w2;
      end
		w2:NS = S_f;
      S_f: begin
        NS = S_g;
      end
      S_g: begin
        NS = w3;
      end
		w3:NS = S_h;
      S_h: begin
        NS = S_i;
      end
      S_i: begin
        NS = w4;
      end
		w4:NS = S_j;
      S_j: begin
        NS = S_k;
      end
      S_k: begin
        NS = w5;
      end
		w5:NS = S_l;
      S_l: begin
        NS = S_m;
      end
      S_m: begin
        NS = w6;
      end
		w6:NS = S_n;
      S_n: begin
        NS = S_o;
      end
      S_o: begin
        NS = w7;
      end
		w7:NS = S_p;
      S_p: begin
        NS = S_q;
      end
      S_q: begin
        NS = w8;
      end
		w8:NS = S_r;
      S_r: begin
        NS = S_s;
      end
      S_s: begin
        NS = S_z;
      end
      S_z: begin
        NS = S_z;
      end

      default: NS = S_a;
    endcase
  end


endmodule
