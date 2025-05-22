module controller (
    input wire clka,
    input wire start_stop,
    input wire add_sub,
    input wire [63:0] douta,
    output reg [3:0] addra,
    output reg [31:0] a,
    output reg [31:0] b,
    output reg Cin,
    output reg ena,
    output reg wea = 0
);

blk_mem_gen_0 mem (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [3 : 0] addra
  .dina(dina),    // input wire [63 : 0] dina
  .douta(douta)  // output wire [63 : 0] douta
);
    always @(posedge start_stop) begin 
            addra <= 0;
            ena <= 1;
    end 
    
    always @(posedge clka) begin
            addra <= addra + 1;
            ena <= 1;
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
bkadder add(
.a(a),
.b(b),
.Cin(Cin)
);
endmodule
