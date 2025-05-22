`timescale 1ps / 1ps

module controller(
    input        clk,
    input        reset,
    input        rvalid,
    input        arready,  
    input [31:0] rdata,
    output reg [14:0] araddr,
    output reg [2:0]  arprot,
    output reg        arvalid, 
    output reg        rready,
    output reg        rstn,
    output reg [31:0] dataout
);
  localparam IDLE        = 2'b00,
             SEND_ADDR   = 2'b01,
             WAIT_RVALID = 2'b10,
             DONE        = 2'b11;

  reg [1:0] state, next_state;

  // Next-state logic 
  always @(*) begin
    case (state)
      IDLE: begin
        next_state = SEND_ADDR;
      end

      SEND_ADDR: begin
        if (arready)
          next_state = WAIT_RVALID;
        else
          next_state = SEND_ADDR;
      end

      WAIT_RVALID: begin
        if (rvalid) begin
          if (araddr < 15'd70)
            next_state = SEND_ADDR;
          else
            next_state = DONE;
        end else begin
          next_state = WAIT_RVALID;
        end
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
      rready  <= 1;     
      araddr  <= 15'd0;
      arprot  <= 3'b000;
      dataout <= 32'd0;
    end else begin
      state <= next_state;
      rstn  <= 1;       
      case (state)
        IDLE: begin
          arvalid <= 0;
          rready  <= 1;
          araddr  <= araddr;
        end

        SEND_ADDR: begin
          arvalid <= 1;
          araddr  <= araddr;
        end 
        
        WAIT_RVALID: begin
          arvalid <= 0;
          if (rvalid) begin
            dataout <= rdata;
            if (araddr < 15'd70)
              araddr <= araddr + 4;
            else
              araddr <= araddr;  
          end else begin
            araddr <= araddr;
          end
        end

        DONE: begin
          arvalid <= 0;
          rready  <= 0;  
          araddr  <= araddr;
        end

        default: begin
          arvalid <= 0;
          rready  <= 1;
          araddr  <= araddr;
        end
      endcase
    end
  end

endmodule
