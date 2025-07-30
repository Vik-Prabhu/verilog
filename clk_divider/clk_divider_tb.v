`timescale 1ns/1ps

module clk_divider_tb;

    parameter N = 5;

    reg clk =0 ;
    reg rst = 0;
    wire clk_out;

    clk_divider #(.N(N)) clk_by_2 (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    always #10 clk = ~clk;

    initial begin
        $dumpfile("clk_divider_tb.vcd");   
        $dumpvars(0, clk_divider_tb);
        #500;                   
        $finish;
    end
    
    
endmodule

