module icache_tag_ram_unwrapped
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [  7:0]  addr_i
    ,input  [ 19:0]  data_i
    ,input           wr_i

    // Outputs
    ,output [ 19:0]  data_o
);




//reg [19:0]   ram [255:0] ;
//reg [19:0]   ram_read_q;

// Synchronous write
//always @ (posedge clk_i)
//begin
//    if (wr_i)
//        ram[addr_i] <= data_i;
//    ram_read_q <= ram[addr_i];//

//end

//assign data_o = ram_read_q;
wire [19:0] dout1;
sky130_sram_1kbytes_1rw1r_20x256_20 sram1(

		.clk0(clk_i),
        	.csb0(1'b0),  //.csb0(!cs),
        	.web0(!wr_i),
        	.addr0(addr_i),
        	.din0(data_i[19:0]),
        	.dout0(data_o[19:0]),

        	.clk1(1'b0),
        	.csb1(1'b1),
        	.addr1(1'b0),
        	.dout1(dout1[19:0])
	);
endmodule

module icache_tag_ram
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input  [  7:0]  addr_i
    ,input  [ 19:0]  data_i
    ,input           wr_i

    // Outputs
    ,output [ 19:0]  data_o
);
icache_tag_ram_unwrapped submodule(.*);

endmodule










