`timescale 1ns / 1ps
module tb_bkadder;

    reg [31:0] a, b;
    reg Cin;
    wire [31:0] sum;
    wire cout;

    bkadder uut (
        .a(a),
        .b(b),
        .Cin(Cin),
        .sum(sum),
        .cout(cout)
    );

    
    initial begin

        $monitor("Time: %0t | a: %d | b: %d | Cin: %d | sum: %d | cout: %b", $time, a, b, Cin, sum, cout);

        a = 10; b = 5; Cin = 0;
        #10;

        a = 46; b = 32; Cin = 0;
        #10;

        a = 3244; b = 1544; Cin = 1;
        #10;

        a = 32565; b = 325778; Cin = 0;
        #10;

        a = 3422399; b = 1911079; Cin = 0;
        #10;

        a = 1570200; b = 4219577495; Cin = 0;
        #10;
   
        $stop;
    end

endmodule
