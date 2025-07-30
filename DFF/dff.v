// Code your design here
module dff(
    input clk , rst , d,
    output reg q , q_bar
  );

  always @(posedge clk or negedge rst)begin
      if(!rst)
        q <=0;
      else begin
        q <= d;
        q_bar <= ~q;
      end
endmodule
      