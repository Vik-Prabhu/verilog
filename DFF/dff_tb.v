// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module dff_tb;
	reg clk , rst = 1 ;
	reg d = 0 ;
	wire q q_bar;

dff dff1(clk , rst , d , q , q_bar);

always #10 clk = ~clk;

// Test sequence
    initial begin
      $dumpfile("dff_tb.vcd");
      $dumpvarse(0, dff_tb.v);
        // Initialize signals
        clk = 0;
        rst = 0;
        d = 0;

        // Apply reset
        $display("Applying reset...");
        rst = 1; #20;          // Apply reset for 20 ns
        rst = 0; #20;          // Release reset

        // Test data toggling
        $display("Testing D input toggling...");
        d = 1; #20;            // Set D to 1
        d = 0; #20;            // Set D to 0
        d = 1; #20;            // Set D to 1 again

        // Random data testing
        $display("Random data pattern...");
        repeat (5) begin
            d = $random;        // Random D value
            #20;                // Wait for the next clock cycle
        end

        // End simulation
        $display("Test completed.");
        $finish
    end
endmodule