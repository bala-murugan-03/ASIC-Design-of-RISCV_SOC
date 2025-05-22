module adder(
    input [31:0] a,
    input [31:0] b,
    input Cin,
    output [31:0] sum,
    output cout
    );
    reg [32:0] s;
    
    always@(a or b) begin
         s = a + b + Cin;
    end 
    assign sum = s[31:0];
    assign cout = s[32];
endmodule

