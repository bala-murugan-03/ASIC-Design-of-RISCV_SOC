module controller (
    input wire clka,
    input wire start_stop,
    input wire [31:0] douta,
    output reg ena,
    output reg [2:0] addra = 3'b000,
    output reg [15:0] a,
    output reg [15:0] b,
    output reg wea = 1'b0
);

    
    always @(posedge clka & start_stop) begin
            addra <= addra + 1;
            ena = 1'b1;
    end
    
    always @(douta) begin
                a <= douta[31:16];  
                b <= douta[15:0];  
    end

endmodule
