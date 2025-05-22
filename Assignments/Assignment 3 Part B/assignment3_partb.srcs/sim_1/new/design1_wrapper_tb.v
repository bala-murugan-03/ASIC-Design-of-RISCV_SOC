`timescale 1ns / 1ps

module design_1_wrapper_tb;

  reg         clk_0;
  reg         reset_0;
  wire [31:0] dataout_0;
  wire [15:0] a_0;
  wire [15:0] b_0;

  design_1_wrapper dut (
    .clk_0(clk_0),
    .reset_0(reset_0),
    .dataout_0(dataout_0),
    .a_0(a_0),
    .b_0(b_0)
  );

  initial begin
    clk_0 = 1;
    forever #20 clk_0 = ~clk_0;
  end

  initial begin
    reset_0 = 1;   
    #10;           
    reset_0 = 0;   
  end
  always @(posedge clk_0) begin
    $display("Time: %0t, dataout_0 = %h", $time, dataout_0);
  end
  initial begin
    #2500;  
    $finish;
  end

endmodule
