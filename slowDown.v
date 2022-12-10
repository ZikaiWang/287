module slowDown (
    clk,
	 rst,
    o,
);  // >

  input clk,rst;
  output reg o;
	
	parameter rate=8'd10;
	
	reg [1:0] s,ns;
	reg [7:0] counter;
 
  always @(posedge clk or negedge rst) begin
    if (rst == 1'b0) begin
      s <= 2'd0;
    end else begin
      s <= ns;
    end
  end
  
  always @(posedge clk) begin
  case(s)
	  2'b00:
	  begin
		o <= 1'b1;
		counter <= 8'd0;
		end
	  2'b01:
		counter <= counter + 8'd1;
	  2'b10:
	  begin
		o <= 1'b0;
		counter <= 8'd0;
		end
	  2'b11:
		counter <= counter + 8'd1;
	endcase
  end
  
  always @(*) begin
  case(s)
	  2'b00:
		ns = 2'b01;
	  2'b01:
	  begin
		if(counter>rate)
			ns=2'b10;
		else
			ns=2'b01;
			end
	  2'b10:
		ns = 2'b11;
	  2'b11:
	  begin
		if(counter>rate)
			ns=2'b00;
		else
			ns=2'b11;
		end
	endcase
  end
	

endmodule