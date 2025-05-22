`timescale 1ns / 1ps

module design_1_wrapper_tb;

  reg         clk_in1_0;
  reg         reset_0;
  wire [31:0] dataout_0;

  design_1_wrapper dut (
    .clk_in1_0(clk_in1_0),
    .reset_0(reset_0),
    .dataout_0(dataout_0)
  );

  initial begin
    clk_in1_0 = 1;
    forever #10 clk_in1_0 = ~clk_in1_0;
  end

  initial begin
    reset_0 = 1;   
    #5;           
    reset_0 = 0;   
  end
  always @(posedge clk_in1_0) begin
    $display("Time: %0t, dataout_0 = %h", $time, dataout_0);
  end
  initial begin
    #25000;  
    $finish;
  end

endmodule
