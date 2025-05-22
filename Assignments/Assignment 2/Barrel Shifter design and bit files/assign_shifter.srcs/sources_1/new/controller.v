module controller (
    input wire clka,
    input wire start_stop,
    input wire dir,
    input wire [10:0] douta,
    output reg ena,
    output reg right,
    output reg [2:0] addra = 3'b000,
    output reg [2:0] shiftamt,
    output reg [7:0]x,
    output reg wea = 1'b0
);

    always @(posedge clka & start_stop) begin
            addra <= addra + 1;
            ena = 1'b1;
    end
    
    always @(douta) begin
            if (dir == 1'b0) begin
                x <= douta[10:3];  
                shiftamt <= douta[2:0];  
                right <= 1'b0;
            end else begin
                x <= douta[10:3];  
                shiftamt <= douta[2:0];  
                right <= 1'b1;
            end
    end

endmodule
