`timescale 1ns / 1ps

module tb_dadda_mult;
  reg [15:0] a;
  reg [15:0] b;
  wire [31:0] result;
  dadda_mult uut (
    .a(a),
    .b(b),
    .result(result)
  );
  initial begin
    $display("Starting test cases...");
    #10 a = 16'h0010; b = 16'h004D;
    #10 $display("Test case 1: a = %h, b = %h, result = %h", a, b, result);
    #10 a = 16'h0040; b = 16'h007C;
    #10 $display("Test case 2: a = %h, b = %h, result = %h", a, b, result);
    #10 a = 16'h0007; b = 16'h0008;
    #10 $display("Test case 3: a = %h, b = %h, result = %h", a, b, result);
    #10 a = 16'h143C; b = 16'h01B7;
    #10 $display("Test case 4: a = %h, b = %h, result = %h", a, b, result);
    #10 a = 16'h007D; b = 16'h01F4;
    #10 $display("Test case 5: a = %h, b = %h, result = %h", a, b, result);
    $display("Test cases completed.");
    #10 $stop;
  end
endmodule
