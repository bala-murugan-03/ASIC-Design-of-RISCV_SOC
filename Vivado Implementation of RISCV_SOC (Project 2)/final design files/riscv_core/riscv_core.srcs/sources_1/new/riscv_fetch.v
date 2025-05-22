// Defining riscv_Fetch module
module riscv_fetch(
    // Input Signals
    input clk_i,
    input rst_i,
    input fetch_branch_i,
    input [31:0] fetch_branch_pc_i,
    input fetch_accept_i,
    input icache_accept_i,
    input icache_valid_i,
    input icache_error_i,
    input [31:0] icache_inst_i,
    input fetch_invalidate_i,
    
    // Output Signals
    output reg fetch_valid_o,
    output reg [31:0] fetch_instr_o,
    output reg [31:0] fetch_pc_o,
    output reg icache_rd_o,
    output reg icache_flush_o,
    output wire icache_invalidate_o, 
    output reg [31:0] icache_pc_o
);

// Defining INST_FAULT as a fixed parameter
parameter INST_FAULT = 32'h53;

// Assigning icache_invalidate_o to constant 0
assign icache_invalidate_o = 1'b0;

// Flag to check if there is stall condtiton
reg in_stalled_state;

// Logic to define fatch_valid_o
always @(posedge clk_i ) begin
    if (~rst_i) begin
        fetch_valid_o <= 0;
    end
    else if (fetch_branch_i) begin
        fetch_valid_o <= 0;
    end
    else if (icache_valid_i || (fetch_valid_o && !fetch_accept_i)) begin
        fetch_valid_o <= 1'b1;
    end
    else begin
        fetch_valid_o <= 0;
    end
end

// Logic to define fetch_instr_o
always @(posedge clk_i ) begin
    if (~rst_i) begin
        fetch_instr_o <= 32'b0;
        in_stalled_state <= 1'b0;
    end
    // if icache_error_i is high, then fetch_instr_o is assigned with INST_FAULT value
    else if (icache_error_i) begin
        fetch_instr_o <= INST_FAULT;
    end
    else if (fetch_valid_o && !fetch_accept_i) begin
        if (!in_stalled_state && icache_valid_i) begin
            // First cycle of stall, update with new instruction
            fetch_instr_o <= icache_inst_i;
            in_stalled_state <= 1'b1;
        end
    end
    else if (icache_valid_i) begin
        fetch_instr_o <= icache_inst_i;
        in_stalled_state <= 1'b0;
    end
    
    // if fetch_accept_i is high, then we are not in stall state
    else if (fetch_accept_i) begin
        in_stalled_state <= 1'b0;
    end
end

// Logic to define fetch_pc_o
always @(posedge clk_i ) begin
    if (~rst_i) begin
        fetch_pc_o <= 0;
    end
    else if (fetch_valid_o && !fetch_accept_i) begin
        // Retain the previous PC value during stall
        fetch_pc_o <= fetch_pc_o;
    end
    else if (icache_rd_o && icache_accept_i) begin
        // Update fetch_pc_o with icache_pc_o when read and valid are high
        fetch_pc_o <= icache_pc_o;
    end
end

// Logic to define icache_read_o
always @(posedge clk_i) begin
    if (~rst_i) begin
        icache_rd_o <= 0;
    end
    else if (fetch_branch_i && fetch_accept_i) begin
        icache_rd_o <= 1'b1;
    end
    else if (icache_accept_i && !icache_valid_i) begin
        icache_rd_o <= 1'b1;
    end
    else begin
        icache_rd_o <= 0;
    end
end

// Logic to define icache_pc_o
always @(posedge clk_i ) begin
    if (~rst_i) begin
        icache_pc_o <= 0;
    end
    // if fetch_branch_i is high, assign branch address to icache_pc_o
    else if (fetch_branch_i) begin
        icache_pc_o <= fetch_branch_pc_i;
    end
    
    else if (icache_rd_o && icache_accept_i && !icache_valid_i) begin
        // Keep PC same if icache_valid_i is not high even if icache_read and icache_accept are high
        icache_pc_o <= icache_pc_o;
    end
    else if (fetch_valid_o && !fetch_accept_i) begin
        // Keep icache_pc same during stall as fetch_accept_i is not high even if fetch_valid_o is high
        icache_pc_o <= icache_pc_o;
    end
    else if (icache_valid_i && fetch_accept_i) begin
        // Increment PC after successful instruction fetch
        icache_pc_o <= icache_pc_o + 4;
    end
    else if (icache_valid_i) begin
        // Also increment when valid but not accepted
        icache_pc_o <= icache_pc_o + 4;
    end
end


// Logic to define icache_flush_o
always @(posedge clk_i) begin
    if (~rst_i) begin
        icache_flush_o <= 0;
    end
    // if fetch_invalidate_i is high, icache_flush_o is assigned 1
    else if (fetch_invalidate_i) begin
        icache_flush_o <= 1'b1;
    end
    else begin
        icache_flush_o <= 0;
    end
end
endmodule