`timescale 1ns / 1ps
module tb_bkadder;

    // Testbench signals
    reg [31:0] a, b;
    reg Cin;
    wire [31:0] sum;
    wire cout;

    // Instantiate the Brent-Kung Adder
    bkadder uut (
        .a(a),
        .b(b),
        .Cin(Cin),
        .sum(sum),
        .cout(cout)
    );

    // Test vectors
    initial begin
        // Monitor output
        $monitor("Time: %0t | a: %d | b: %d | Cin: %d | sum: %d | cout: %b", $time, a, b, Cin, sum, cout);

        // Test case 1
        a = 10; b = 5; Cin = 0;
        #10;

        // Test case 2
        a = 46; b = 32; Cin = 0;
        #10;

        // Test case 3
        a = 3244; b = 1544; Cin = 0;
        #10;

        // Test case 4
        a = 32565; b = 325778; Cin = 0;
        #10;

        // Test case 5
        a = 3426912399; b = 1911090279; Cin = 0;
        #10;

        // Test case 6 (Overflow scenario)
        a = 1570200739; b = 4219577495; Cin = 0;
        #10;

        // End simulation
        $stop;
    end

endmodule
