module icache_data_ram_unwrapped
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [ 10:0]  addr_i
    ,input  [ 31:0]  data_i
    ,input           wr_i

    // Outputs
    ,output [ 31:0]  data_o
);




//reg [31:0]   ram [2047:0];
//reg [31:0]   ram_read_q;

// Synchronous write
//always @ (posedge clk_i)
//begin
  //  if (wr_i)
  //      ram[addr_i] <= data_i;
  //  ram_read_q <= ram[addr_i];
//end

//assign data_o = ram_read_q;

wire [31:0] dout1;

	
	sky130_sram_8kbytes_1rw1r_32x2048_32 sram2(

		.clk0(clk_i),
        	.csb0(1'b0),
        	.web0(!wr_i),
        	.addr0(addr_i),
        	.din0(data_i[31:0]),
        	.dout0(data_o[31:0]),

        	.clk1(1'b0),
        	.csb1(1'b1),
        	.addr1(1'b0),
        	.dout1(dout1[31:0])
	);


endmodule

module icache_data_ram
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [ 10:0]  addr_i
    ,input  [ 31:0]  data_i
    ,input           wr_i

    // Outputs
    ,output [ 31:0]  data_o
);


icache_data_ram_unwrapped submodule(.*);
endmodule




































