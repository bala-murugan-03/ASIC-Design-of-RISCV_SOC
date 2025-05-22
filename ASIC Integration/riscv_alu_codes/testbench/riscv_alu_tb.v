`timescale 1ns / 1ps

module riscv_alu_tb;
    reg clk;          
    reg [3:0] alu_op_i;     
    reg [31:0] alu_a_i;      
    reg [31:0] alu_b_i;      
    wire [31:0] alu_p_o;    

    riscv_alu uut (
        .alu_op_i(alu_op_i),
        .alu_a_i(alu_a_i),
        .alu_b_i(alu_b_i),
        .alu_p_o(alu_p_o)
    ); 

    initial begin         
        alu_op_i = 4'b0000;
        alu_a_i = 32'h0;
        alu_b_i = 32'h0;
        $display("Simulation Started");


        #10;
        $display("Testcase 1");
        alu_op_i = 4'b0000; 
        alu_a_i = 32'h12345678;
        alu_b_i = 32'h87654321;


        #60;
        $display("Testcase 2");
        alu_op_i = 4'b0001;
        alu_a_i = 32'h0000000C; 
        alu_b_i = 32'h00000002; 


        #60;
        $display("Testcase 3");
        alu_op_i = 4'b0010; 
        alu_a_i = 32'h0000000E; 
        alu_b_i = 32'h00000003; 


        #60;
        alu_op_i = 4'b0011;
        alu_a_i = 32'hFFFFFFF0;
        alu_b_i = 32'h00000002;


        #60;
        alu_op_i = 4'b0100;
        alu_a_i = 32'h00000019;
        alu_b_i = 32'h00000005; 

        // Subtraction test
        #60;
        alu_op_i = 4'b0110; 
        alu_a_i = 32'h0000001E; 
        alu_b_i = 32'h0000000A; 

	// MUL test
        #60;
        alu_op_i = 4'b1100; 
        alu_a_i = 32'h0000001E; 
        alu_b_i = 32'h0000000A;

        // Bitwise AND test
        #60;
        alu_op_i = 4'b0111; 
        alu_a_i = 32'hAABBCCDD;
        alu_b_i = 32'hFF00FF00;

        // Bitwise OR test
        #60;
        alu_op_i = 4'b1000; 
        alu_a_i = 32'h00FF00FF;
        alu_b_i = 32'hF0F0F0F0;

        // XOR test
        #60;
        alu_op_i = 4'b1001;
        alu_a_i = 32'h0000000B; 
        alu_b_i = 32'h0000000B; 

        // Comparison for unsigned operation
        #60;
        alu_op_i = 4'b1010; 
        alu_a_i = 32'h0000000F; 
        alu_b_i = 32'h00000005; 

        // Comparison for signed operation
        #60;
        alu_op_i = 4'b1011; 
        alu_a_i = 32'hFFFFFFF0; 
        alu_b_i = 32'h00000000; 
        $display("All test cases completed, preparing to finish simulation.");
        $finish;
    end

    initial begin
	$dumpfile("waveforms.vcd");
        $dumpvars(0, riscv_alu_tb);
    end
endmodule
