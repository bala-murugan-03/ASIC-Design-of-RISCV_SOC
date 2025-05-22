`timescale 1ns/1ps

module tb_controller;
reg clka = 1'b0;             
reg start_stop = 1'b1;        
reg add_sub = 1'b0;             
wire [3:0] addra;
wire [31:0] a, b;        
wire Cin;               

controller dut (
    .clka(clka),
    .start_stop(start_stop),             
    .add_sub(add_sub),
    .addra(addra),
    .a(a),
    .b(b),
    .Cin(Cin)
);

always #5 clka = ~clka;  

initial begin
    #10 start_stop = 1;  
    add_sub = 0;         
    #80;  
    start_stop = 0;      
    #20;
    $stop;               
end
endmodule
