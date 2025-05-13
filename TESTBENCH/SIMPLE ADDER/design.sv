// Code your design here
module adder(
  input clk,
  input reset,
  input [3:0]in1,
  input [3:0]in2,
  output reg [4:0]out
);
  
  always @(posedge clk or posedge reset) begin
    if(reset)
      out <= 0;
  else 
    out <= in1+in2;
  end
endmodule
