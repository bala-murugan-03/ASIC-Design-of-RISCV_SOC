module riscv_top
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           axi_i_awready_i
    ,input           axi_i_wready_i
    ,input           axi_i_bvalid_i
    ,input  [  1:0]  axi_i_bresp_i
    ,input  [  3:0]  axi_i_bid_i
    ,input           axi_i_arready_i
    ,input           axi_i_rvalid_i
    ,input  [ 31:0]  axi_i_rdata_i
    ,input  [  1:0]  axi_i_rresp_i
    ,input  [  3:0]  axi_i_rid_i
    ,input           axi_i_rlast_i
    ,input           axi_d_awready_i
    ,input           axi_d_wready_i
    ,input           axi_d_bvalid_i
    ,input  [  1:0]  axi_d_bresp_i
    ,input  [  3:0]  axi_d_bid_i
    ,input           axi_d_arready_i
    ,input           axi_d_rvalid_i
    ,input  [ 31:0]  axi_d_rdata_i
    ,input  [  1:0]  axi_d_rresp_i
    ,input  [  3:0]  axi_d_rid_i
    ,input           axi_d_rlast_i
    ,input           intr_i
    ,input  [ 31:0]  reset_vector_i

    // Outputs
    ,output          axi_i_awvalid_o
    ,output [ 31:0]  axi_i_awaddr_o
    ,output [  3:0]  axi_i_awid_o
    ,output [  7:0]  axi_i_awlen_o
    ,output [  1:0]  axi_i_awburst_o
    ,output          axi_i_wvalid_o
    ,output [ 31:0]  axi_i_wdata_o
    ,output [  3:0]  axi_i_wstrb_o
    ,output          axi_i_wlast_o
    ,output          axi_i_bready_o
    ,output          axi_i_arvalid_o
    ,output [ 31:0]  axi_i_araddr_o
    ,output [  3:0]  axi_i_arid_o
    ,output [  7:0]  axi_i_arlen_o
    ,output [  1:0]  axi_i_arburst_o
    ,output          axi_i_rready_o
    ,output          axi_d_awvalid_o
    ,output [ 31:0]  axi_d_awaddr_o
    ,output [  3:0]  axi_d_awid_o
    ,output [  7:0]  axi_d_awlen_o
    ,output [  1:0]  axi_d_awburst_o
    ,output          axi_d_wvalid_o
    ,output [ 31:0]  axi_d_wdata_o
    ,output [  3:0]  axi_d_wstrb_o
    ,output          axi_d_wlast_o
    ,output          axi_d_bready_o
    ,output          axi_d_arvalid_o
    ,output [ 31:0]  axi_d_araddr_o
    ,output [  3:0]  axi_d_arid_o
    ,output [  7:0]  axi_d_arlen_o
    ,output [  1:0]  axi_d_arburst_o
    ,output          axi_d_rready_o
);

wire           dport_bridge_accept_w;
wire           dport_bridge_cacheable_w;
wire  [ 31:0]  icache_inst_w;
wire  [ 10:0]  dport_bridge_resp_tag_w;
wire           dport_bridge_invalidate_w;
wire  [ 31:0]  dport_bridge_addr_w;
wire  [ 31:0]  icache_pc_w;
wire           icache_rd_w;
wire           dport_bridge_error_w;
wire           icache_flush_w;
wire  [ 10:0]  dport_bridge_req_tag_w;
wire  [ 31:0]  dport_bridge_data_wr_w;
wire           dport_bridge_rd_w;
wire           icache_accept_w;
wire           icache_valid_w;
wire           icache_error_w;
wire           dport_bridge_ack_w;
wire  [  3:0]  dport_bridge_wr_w;
wire  [ 31:0]  dport_bridge_data_rd_w;
wire           dport_bridge_flush_w;
wire           icache_invalidate_w;


dport_bridge u_dport_bridge
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.mem_addr_i(dport_bridge_addr_w)
    ,.mem_data_wr_i(dport_bridge_data_wr_w)
    ,.mem_rd_i(dport_bridge_rd_w)
    ,.mem_wr_i(dport_bridge_wr_w)
    ,.mem_cacheable_i(dport_bridge_cacheable_w)
    ,.mem_req_tag_i(dport_bridge_req_tag_w)
    ,.mem_invalidate_i(dport_bridge_invalidate_w)
    ,.mem_flush_i(dport_bridge_flush_w)
    ,.axi_awready_i(axi_d_awready_i)
    ,.axi_wready_i(axi_d_wready_i)
    ,.axi_bvalid_i(axi_d_bvalid_i)
    ,.axi_bresp_i(axi_d_bresp_i)
    ,.axi_bid_i(axi_d_bid_i)
    ,.axi_arready_i(axi_d_arready_i)
    ,.axi_rvalid_i(axi_d_rvalid_i)
    ,.axi_rdata_i(axi_d_rdata_i)
    ,.axi_rresp_i(axi_d_rresp_i)
    ,.axi_rid_i(axi_d_rid_i)
    ,.axi_rlast_i(axi_d_rlast_i)

    // Outputs
    ,.mem_data_rd_o(dport_bridge_data_rd_w)
    ,.mem_accept_o(dport_bridge_accept_w)
    ,.mem_ack_o(dport_bridge_ack_w)
    ,.mem_error_o(dport_bridge_error_w)
    ,.mem_resp_tag_o(dport_bridge_resp_tag_w)
    ,.axi_awvalid_o(axi_d_awvalid_o)
    ,.axi_awaddr_o(axi_d_awaddr_o)
    ,.axi_awid_o(axi_d_awid_o)
    ,.axi_awlen_o(axi_d_awlen_o)
    ,.axi_awburst_o(axi_d_awburst_o)
    ,.axi_wvalid_o(axi_d_wvalid_o)
    ,.axi_wdata_o(axi_d_wdata_o)
    ,.axi_wstrb_o(axi_d_wstrb_o)
    ,.axi_wlast_o(axi_d_wlast_o)
    ,.axi_bready_o(axi_d_bready_o)
    ,.axi_arvalid_o(axi_d_arvalid_o)
    ,.axi_araddr_o(axi_d_araddr_o)
    ,.axi_arid_o(axi_d_arid_o)
    ,.axi_arlen_o(axi_d_arlen_o)
    ,.axi_arburst_o(axi_d_arburst_o)
    ,.axi_rready_o(axi_d_rready_o)
);


riscv_core u_core
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.mem_d_data_rd_i(dport_bridge_data_rd_w)
    ,.mem_d_accept_i(dport_bridge_accept_w)
    ,.mem_d_ack_i(dport_bridge_ack_w)
    ,.mem_d_error_i(dport_bridge_error_w)
    ,.mem_d_resp_tag_i(dport_bridge_resp_tag_w)
    ,.mem_i_accept_i(icache_accept_w)
    ,.mem_i_valid_i(icache_valid_w)
    ,.mem_i_error_i(icache_error_w)
    ,.mem_i_inst_i(icache_inst_w)
    ,.intr_i(intr_i)
    ,.reset_vector_i(reset_vector_i)
    ,.cpu_id_i(32'b0)

    // Outputs
    ,.mem_d_addr_o(dport_bridge_addr_w)
    ,.mem_d_data_wr_o(dport_bridge_data_wr_w)
    ,.mem_d_rd_o(dport_bridge_rd_w)
    ,.mem_d_wr_o(dport_bridge_wr_w)
    ,.mem_d_cacheable_o(dport_bridge_cacheable_w)
    ,.mem_d_req_tag_o(dport_bridge_req_tag_w)
    ,.mem_d_invalidate_o(dport_bridge_invalidate_w)
    ,.mem_d_flush_o(dport_bridge_flush_w)
    ,.mem_i_rd_o(icache_rd_w)
    ,.mem_i_flush_o(icache_flush_w)
    ,.mem_i_invalidate_o(icache_invalidate_w)
    ,.mem_i_pc_o(icache_pc_w)
);


icache u_icache
(
    // Inputs
     .clk_i(clk_i)
    ,.rst_i(rst_i)
    ,.req_rd_i(icache_rd_w)
    ,.req_flush_i(icache_flush_w)
    ,.req_invalidate_i(icache_invalidate_w)
    ,.req_pc_i(icache_pc_w)
    ,.axi_awready_i(axi_i_awready_i)
    ,.axi_wready_i(axi_i_wready_i)
    ,.axi_bvalid_i(axi_i_bvalid_i)
    ,.axi_bresp_i(axi_i_bresp_i)
    ,.axi_bid_i(axi_i_bid_i)
    ,.axi_arready_i(axi_i_arready_i)
    ,.axi_rvalid_i(axi_i_rvalid_i)
    ,.axi_rdata_i(axi_i_rdata_i)
    ,.axi_rresp_i(axi_i_rresp_i)
    ,.axi_rid_i(axi_i_rid_i)
    ,.axi_rlast_i(axi_i_rlast_i)

    // Outputs
    ,.req_accept_o(icache_accept_w)
    ,.req_valid_o(icache_valid_w)
    ,.req_error_o(icache_error_w)
    ,.req_inst_o(icache_inst_w)
    ,.axi_awvalid_o(axi_i_awvalid_o)
    ,.axi_awaddr_o(axi_i_awaddr_o)
    ,.axi_awid_o(axi_i_awid_o)
    ,.axi_awlen_o(axi_i_awlen_o)
    ,.axi_awburst_o(axi_i_awburst_o)
    ,.axi_wvalid_o(axi_i_wvalid_o)
    ,.axi_wdata_o(axi_i_wdata_o)
    ,.axi_wstrb_o(axi_i_wstrb_o)
    ,.axi_wlast_o(axi_i_wlast_o)
    ,.axi_bready_o(axi_i_bready_o)
    ,.axi_arvalid_o(axi_i_arvalid_o)
    ,.axi_araddr_o(axi_i_araddr_o)
    ,.axi_arid_o(axi_i_arid_o)
    ,.axi_arlen_o(axi_i_arlen_o)
    ,.axi_arburst_o(axi_i_arburst_o)
    ,.axi_rready_o(axi_i_rready_o)
);



endmodule

