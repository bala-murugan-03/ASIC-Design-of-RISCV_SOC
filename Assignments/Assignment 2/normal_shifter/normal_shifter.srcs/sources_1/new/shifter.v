module shifter(
    input wire [7:0] x,      
    input wire [2:0] shiftamt, 
    input wire right,          
    output reg [7:0] z     
);
    always @(*) begin
        if (right)
            z = x >> shiftamt; // Right shift
        else
            z = x << shiftamt; // Left shift
    end
endmodule
