`timescale 1 ns / 1 ps
module axi_controller_wrapper_tb ;
    reg clk_in1_0;
    reg reset_0 ;
    reg s_axi_aresetn_0 ;
    reg [14:0] s_axi_awaddr_0 ;
    reg [2:0] s_axi_awprot_0 ;
    reg s_axi_awvalid_0 ;
    reg s_axi_bready_0 ;
    reg [31:0] s_axi_wdata_0 ;
    reg [3:0] s_axi_wstrb_0 ;
    reg s_axi_wvalid_0 ;
    wire s_axi_bvalid_0 ;
    reg [14:0] s_axi_araddr_0 ;
    reg [2:0] s_axi_arprot_0 ;
    reg s_axi_arvalid_0 ;
    reg s_axi_rready_0 ;
    wire [31:0] s_axi_rdata_0 ;
    wire s_axi_rvalid_0 ;
// Instantiation of axi_controller_wrapper uut
axi_controller_wrapper uut (
    .reset_0(reset_0),
    .s_axi_araddr_0(s_axi_araddr_0),
    .s_axi_aresetn_0(s_axi_aresetn_0),
    .s_axi_arprot_0(s_axi_arprot_0),
    .s_axi_arvalid_0(s_axi_arvalid_0),
    .s_axi_awaddr_0(s_axi_awaddr_0),
    .s_axi_awprot_0(s_axi_awprot_0),
    .s_axi_awvalid_0(s_axi_awvalid_0),
    .s_axi_bready_0(s_axi_bready_0),
    .s_axi_rdata_0(s_axi_rdata_0),
    .s_axi_rready_0(s_axi_rready_0),
    .s_axi_wdata_0(s_axi_wdata_0),
    .s_axi_wstrb_0(s_axi_wstrb_0),
    .s_axi_wvalid_0(s_axi_wvalid_0),
    .s_axi_bvalid_0(s_axi_bvalid_0),
    .s_axi_rvalid_0(s_axi_rvalid_0),
    .clk_in1_0(clk_in1_0)
);

    
    always #5 clk_in1_0 = ~clk_in1_0 ;
    initial begin
    reset_0 = 1;
    s_axi_aresetn_0 = 0;
    s_axi_araddr_0 = 0;
    s_axi_arprot_0 = 0;
    s_axi_arvalid_0 = 0;
    s_axi_awaddr_0 = 0;
    s_axi_awprot_0 = 0;
    s_axi_awvalid_0 = 0;
    s_axi_bready_0 = 0;
    s_axi_rready_0 = 0;
    s_axi_wdata_0 = 0;
    s_axi_wstrb_0 = 0;
    s_axi_wvalid_0 = 0;
    clk_in1_0 = 0;
    #5;
    reset_0 = 0;
    s_axi_aresetn_0 = 1;
    #5
    // Write operation
    s_axi_wvalid_0 = 1; // write data valid
    s_axi_bready_0 = 1; // Ready to accept write response
    s_axi_awvalid_0 = 1; // write address valid
    s_axi_awprot_0 = 3'b000 ;
    s_axi_awaddr_0 = 15'd100 ; // Address
    s_axi_wstrb_0 = 4'b1111 ; // All bytes valid
    s_axi_wdata_0 = 32'd233456 ; // Write Data
    while (!s_axi_bvalid_0) begin
    #1;
    end
    s_axi_awvalid_0 = 0;
    s_axi_wvalid_0 = 0;
    s_axi_wstrb_0 = 4'b0000 ;
    s_axi_wdata_0 = 32'd0;
    // Read operation
    #10
    s_axi_arprot_0 = 3'b000 ;
    s_axi_arvalid_0 = 1; // read address valid
    s_axi_rready_0 = 1; // Ready to accept read data
    s_axi_araddr_0 = 15'd100 ; // Read Address
    while (!s_axi_rvalid_0) begin
    #10;
    end
    #100;
    $finish ;
end
endmodule