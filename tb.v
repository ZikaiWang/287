module tb;

  reg clk, rst, in1;
  wire [ 6:0] o1;
  wire [15:0] o2;

  parameter simdelay = 20, clk_t = 10;

  fp DOT (
      clk,
      rst,
      in1,
      o1,
      o2
  );

  initial begin

    #(simdelay) clk = 0;
    rst = 1;
    in1 = 0;
    #(simdelay) clk = 0;
    rst = 0;
    in1 = 0;
    #(simdelay) clk = 0;
    rst = 1;
    in1 = 1;

    #(simdelay * 50) $stop;


    #100;  // let simulation finish

  end

  always begin
    #(clk_t) clk = ~clk;
  end

endmodule
