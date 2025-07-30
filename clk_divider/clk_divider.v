module clk_divider #(parameter integer N = 2)(
    input wire clk,
    input wire rst,
    output reg clk_out = 0
);
    reg [$clog2(N):0]count = 0;
    always @ (posedge clk or posedge rst) // @suppress "Behavior-specific 'always' should be used instead of general purpose 'always'"
    begin

        if (rst) begin
            clk_out <= 0;
            count <= 0;                
        end else begin
            if(count == N-1)begin
                clk_out <= ~clk_out;
                count <= 0;
            end else
                count <= count + 1;
            end
    end
endmodule
