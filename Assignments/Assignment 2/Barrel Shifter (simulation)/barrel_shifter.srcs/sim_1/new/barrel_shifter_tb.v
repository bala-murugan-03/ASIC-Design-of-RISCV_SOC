`timescale 1ns / 1ps
module barrel_shifter_tb;
    reg [7:0] x;          
    reg [2:0] shiftamt;  
    reg right;        
    wire [7:0] z;    
    barrel_shifter uut (
        .x(x),
        .shiftamt(shiftamt),
        .right(right),
        .z(z)
    );
    initial begin
        #10 {x, shiftamt} = 11'b00100101010; right = 1; 
        #10 {x, shiftamt} = 11'b00111101011; right = 0; 
        #10 {x, shiftamt} = 11'b00010001001; right = 1;
        #10 {x, shiftamt} = 11'b01000000010; right = 0; 
        #10 {x, shiftamt} = 11'b00110011011; right = 1; 
        #10 {x, shiftamt} = 11'b00100101100; right = 0; 
        #10 {x, shiftamt} = 11'b00111101101; right = 1; 
        #10 {x, shiftamt} = 11'b00110101010; right = 0; 
        #10 $stop;
    end
endmodule
