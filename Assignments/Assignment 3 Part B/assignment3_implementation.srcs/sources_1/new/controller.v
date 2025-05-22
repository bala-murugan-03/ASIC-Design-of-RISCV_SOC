`timescale 1ns / 1ps

module controller(
    input clk,
    input reset,
    input awready,
    input bvalid,
    input rvalid,
    input wready,
    input arready,  
    input [31:0] rdata,
    input [31:0] result,
    output reg [31:0] wdata,
    output reg [15:0] a,
    output reg [15:0] b,
    output reg [14:0] araddr,
    output reg [14:0] awaddr,
    output reg [2:0] arprot,
    output reg [2:0] awprot,
    output reg arvalid,
    output reg awvalid,
    output reg [3:0] wstrb,
    output reg wvalid, 
    output reg rready,
    output reg rstn,
    output reg bready,
    output reg [31:0] dataout
);
  localparam IDLE        = 3'b000,
             ADDR_READ   = 3'b001,
             WAIT_RVALID = 3'b010,
             MULTIPLY    = 3'b011,
             WAIT_BVALID = 3'b100,
             DONE        = 3'b101;

  reg [2:0] state, next_state;
  reg [31:0] prevrdata;
  reg [14:0] writeaddr;
  // Next-state logic 
  always @(*) begin
    case (state)
      IDLE: begin
        next_state = ADDR_READ;
      end
      ADDR_READ: begin
        if (arready)
          next_state = WAIT_RVALID;
        else
          next_state = ADDR_READ;
      end
      WAIT_RVALID: begin
        if (rvalid) begin
          if (araddr < 15'd17)
            next_state = MULTIPLY;
          else if (araddr > 15'd17 && araddr < 15'd45)
            next_state = ADDR_READ;
          else
            next_state = DONE;
        end else begin
          next_state = WAIT_RVALID;
        end
      end
      MULTIPLY: begin
           if(awready && wready) 
              next_state = WAIT_BVALID;
           else
              next_state = MULTIPLY; 
      end
      WAIT_BVALID: begin
           if(bvalid) 
              next_state = ADDR_READ;
           else
              next_state = WAIT_BVALID;
      end
      DONE: begin
        next_state = DONE;
      end

      default: next_state = IDLE;
    endcase
  end
  // Sequential logic 
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state   <= IDLE;
      rstn    <= 0;
      arvalid <= 0;
      rready  <= 0;     
      araddr  <= 15'd0;
      arprot  <= 3'b000;
      awprot <= 3'b000;
      dataout <= 32'd0;
      awaddr <= 15'd0;
      awvalid <= 0;
      wvalid <= 0;
      bready <= 0;
      wdata <= 32'd0;
      wstrb <= 4'd0;
      a <= 16'd0;
      b <= 16'd0;
      writeaddr <= 15'd20;
      
    end else begin
      state <= next_state;
      rstn  <= 1;       
      case (state)
        IDLE: begin
          arvalid <= 0;
          rready  <= 0;
          araddr  <= araddr;
        end
        
        ADDR_READ: begin
          arvalid <= 1;
          araddr <= araddr;
          rready <= 1;
        end 
        
        WAIT_RVALID: begin
          if (rvalid) begin
            arvalid <= 0;
            rready <= 0;
            if(araddr < 15'd17) begin
              a <= rdata[31:16];
              b <= rdata[15:0];
            end else if (araddr > 15'd17 && araddr < 15'd41) begin
              dataout <= rdata;
              araddr <= araddr + 4;
            end else
              araddr <= araddr; 
          end else begin
            araddr <= araddr;
          end
        end
        
        MULTIPLY: begin
          awvalid <= 1;
          wvalid <= 1;
          if(awready && wready)begin
             awaddr <= writeaddr;
             wdata <= result;
             wstrb = 4'b1111;
             bready <= 1;
          end 
        end  
          
       WAIT_BVALID: begin
          if(bvalid)begin
            bready <= 0;
            awaddr <= 15'd0;
            writeaddr <= writeaddr + 4;
            araddr <= araddr + 4;
            wdata <= 32'd0;
            wstrb <= 4'b0000;  
            awvalid <= 0;
            wvalid <= 0; 
          end  
        end

        DONE: begin
          arvalid <= 0;
          rready  <= 0;  
          araddr  <= araddr;
        end

        default: begin
          arvalid <= 0;
          rready  <= 0;
          araddr  <= araddr;
        end
      endcase
    end
  end

endmodule
