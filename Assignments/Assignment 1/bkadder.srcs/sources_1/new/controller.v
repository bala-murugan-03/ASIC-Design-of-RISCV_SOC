module controller (
    input wire clka,
    input wire start_stop,
    input wire add_sub,
    input wire [63:0] douta,
    output reg ena,
    output reg [3:0] addra = 4'b0000,
    output reg [31:0] a,
    output reg [31:0] b,
    output reg Cin,
    output reg wea = 0
);

    
    always @(posedge clka & start_stop) begin
            addra <= addra + 1;
            ena = 1'b1;
    end
    
    always @(douta) begin
            if (add_sub == 1'b0) begin
                a <= douta[63:32];  
                b <= douta[31:0];  
                Cin <= 0;
            end else begin
                a <= douta[63:32];  
                b <= ~douta[31:0];  
                Cin <= 1;
            end
    end

endmodule
