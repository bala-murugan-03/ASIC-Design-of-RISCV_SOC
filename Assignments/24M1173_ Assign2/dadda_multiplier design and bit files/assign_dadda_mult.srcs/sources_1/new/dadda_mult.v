module dadda_mult(
  input [15:0] a,
  input [15:0] b,
  output [31:0] result
);
reg [30:0] pp[15:0];
integer i,j;
reg [1:0]half_add_res;
reg [1:0]full_add_res,full_add_res1,full_add_res2,full_add_res3;
reg c0,c1,c2,c3;
reg [31:0]s1,s2;
function [1:0] half_adder;
        input a, b; 
        begin
            half_adder[0] = a ^ b; 
            half_adder[1] = a & b; 
        end
endfunction
function [1:0] full_adder;
        input a, b, cin; 
        begin
            full_adder[0] = a ^ b ^ cin; 
            full_adder[1] = (a & b) | (b & cin) | (a & cin); 
        end
endfunction
always@(*)
begin
    // initialize zero
    for (i=0;i<16;i=i+1)
    begin
            pp[i]=31'd0;
    end
    // calculation  of partial products
    for (i=0;i<16;i=i+1)
    begin
        for(j=0;j<16;j=j+1)
        begin
            pp[i][j+i]=b[i]&a[j];
        end
    end
    // rearranging the partial products to a cone like structure
    for (j=16;j<31;j=j+1)
    begin
        for(i=(j-15);i<16;i=i+1)
        begin
            pp[i-(j-15)][j]=pp[i][j];
            pp[i][j] = 0;
        end
    end
    
    // starting from d = 13
    half_add_res = half_adder(pp[12][13], pp[13][13]);
    pp[12][13] = half_add_res[0];
    c0 = half_add_res[1];
    full_add_res = full_adder(pp[12][14],pp[13][14], pp[14][14]);
    half_add_res = half_adder(full_add_res[0],c0);
    pp[12][14] = half_add_res[0];
    c0 = full_add_res[1];
    c1 = half_add_res[1];
    full_add_res1 = full_adder(pp[13][15],pp[14][15], pp[15][15]);
    full_add_res2 = full_adder(pp[12][15], c1, c0);
    half_add_res = half_adder(full_add_res1[0],full_add_res2[0]);
    pp[12][15] = half_add_res[0];
    c0 = full_add_res1[1];
    c1 = full_add_res2[1];
    c2 = half_add_res[1];
    full_add_res1 = full_adder(pp[12][16],pp[13][16], pp[14][16]);
    full_add_res2 = full_adder(c2, c1, c0);
    half_add_res = half_adder(full_add_res1[0],full_add_res2[0]);
    pp[12][16] = half_add_res[0];
    c0 = full_add_res1[1];
    c1 = full_add_res2[1];
    c2 = half_add_res[1];
    full_add_res1 = full_adder(c2,pp[12][17], pp[13][17]);
    full_add_res2 = full_adder(full_add_res1[0], c1, c0);
    pp[12][17] = full_add_res2[0];
    c0 = full_add_res1[1];
    c1 = full_add_res2[1];
    full_add_res1 = full_adder(pp[12][18],c0,c1);
    pp[12][18] = full_add_res1[0];
    pp[12][19] = full_add_res1[1];
    
    //d = 9 ----> second iteration
    half_add_res = half_adder(pp[8][9], pp[9][9]);
    pp[8][9] = half_add_res[0];
    c0 = half_add_res[1];
    full_add_res = full_adder(pp[8][10],pp[9][10], pp[10][10]);
    half_add_res = half_adder(full_add_res[0],c0);
    pp[8][10] = half_add_res[0];
    c0 = full_add_res[1];
    c1 = half_add_res[1];
    full_add_res1 = full_adder(pp[9][11],pp[10][11], pp[11][11]);
    full_add_res2 = full_adder(pp[8][11], c1, c0);
    half_add_res = half_adder(full_add_res1[0],full_add_res2[0]);
    pp[8][11] = half_add_res[0];
    c0 = full_add_res1[1];
    c1 = full_add_res2[1];
    c2 = half_add_res[1];
    full_add_res = full_adder(pp[10][12],pp[11][12], pp[12][12]);
    full_add_res1 = full_adder(pp[8][12], pp[9][12], c0);
    full_add_res2 = full_adder(full_add_res[0],c1,c2);
    half_add_res = half_adder(full_add_res1[0],full_add_res2[0]);
    pp[8][12] = half_add_res[0];
    c0 = full_add_res[1];
    c1 = full_add_res1[1];
    c2 = full_add_res2[1];
    c3 = half_add_res[1];
    for(j=13;j<20;j=j+1)
    begin
         full_add_res = full_adder(pp[10][j], pp[11][j], pp[12][j]);
         full_add_res1 = full_adder(pp[8][j],pp[9][j],c0);
         full_add_res2 = full_adder(full_add_res[0],full_add_res1[0],c1);
         full_add_res3 = full_adder(full_add_res2[0],c2,c3);
         pp[8][j] = full_add_res3[0];
         c0 = full_add_res[1];
         c1 = full_add_res1[1];
         c2 = full_add_res2[1];
         c3 = full_add_res3[1];
    end
    full_add_res = full_adder(pp[8][20],pp[9][20], pp[10][20]);
    full_add_res1 = full_adder(full_add_res[0], c0,c1);
    full_add_res2 = full_adder(full_add_res1[0],c2,c3);
    pp[8][20] = full_add_res2[0];
    c0 = full_add_res[1];
    c1 = full_add_res1[1];
    c2 = full_add_res2[1];
    full_add_res = full_adder(c0,pp[8][21], pp[9][21]);
    full_add_res1 = full_adder(full_add_res[0], c1,c2);
    pp[8][21] = full_add_res1[0];
    c0 = full_add_res[1];
    c1 = full_add_res1[1];
    full_add_res = full_adder(c0, c1, pp[8][22]);
    pp[8][22] = full_add_res[0];
    pp[8][23] = full_add_res[1];
    
    //d = 6 ------> third iteration
    half_add_res = half_adder(pp[5][6], pp[6][6]);
    pp[5][6] = half_add_res[0];
    c0 = half_add_res[1];
    full_add_res = full_adder(pp[5][7],pp[6][7], pp[7][7]);
    half_add_res = half_adder(full_add_res[0],c0);
    pp[5][7] = half_add_res[0];
    c0 = full_add_res[1];
    c1 = half_add_res[1];
    full_add_res1 = full_adder(pp[6][8],pp[7][8], pp[8][8]);
    full_add_res2 = full_adder(pp[5][8], c1, c0);
    half_add_res = half_adder(full_add_res1[0],full_add_res2[0]);
    pp[5][8] = half_add_res[0];
    c0 = full_add_res1[1];
    c1 = full_add_res2[1];
    c2 = half_add_res[1];
    for(j=9;j<24;j=j+1)
    begin
         full_add_res = full_adder(pp[8][j], pp[7][j], pp[6][j]);
         full_add_res1 = full_adder(pp[5][j],c0,c1);
         full_add_res2 = full_adder(full_add_res[0],full_add_res1[0],c2);
         pp[5][j] = full_add_res2[0];
         c0 = full_add_res[1];
         c1 = full_add_res1[1];
         c2 = full_add_res2[1];
    end
    full_add_res = full_adder(pp[6][24],pp[5][24],c0);
    full_add_res1 = full_adder(full_add_res[0],c1,c2);
    pp[5][24] = full_add_res1[0];
    c0 = full_add_res[1];
    c1 = full_add_res1[1];
    full_add_res = full_adder(pp[5][25], c0, c1);
    pp[5][25] = full_add_res[0];
    pp[5][26] = full_add_res[1];
    
    //d=4 ------> fourth iteration
    half_add_res = half_adder(pp[3][4], pp[4][4]);
    pp[3][4] = half_add_res[0];
    c0 = half_add_res[1];
    full_add_res = full_adder(pp[3][5],pp[4][5], pp[5][5]);
    half_add_res = half_adder(full_add_res[0],c0);
    pp[3][5] = half_add_res[0];
    c0 = full_add_res[1];
    c1 = half_add_res[1];
    for(j=6;j<27;j=j+1)
    begin
         full_add_res = full_adder(pp[3][j], pp[4][j], pp[5][j]);
         full_add_res1 = full_adder(c0,c1,full_add_res[0]);
         pp[3][j] = full_add_res1[0];
         c0 = full_add_res[1];
         c1 = full_add_res1[1];
    end
    full_add_res = full_adder(pp[3][27],c0,c1);
    pp[3][27] = full_add_res[0];
    pp[3][28] = full_add_res[1];
    
    //d = 3 ------> fifth iteration
    half_add_res = half_adder(pp[2][3],pp[3][3]);
    pp[2][3] = half_add_res[0];
    c0 = half_add_res[1];
    for(j=4;j<29;j=j+1)
    begin
         full_add_res = full_adder(pp[3][j], pp[2][j], c0);
         pp[2][j] = full_add_res[0];
         c0 = full_add_res[1];
    end
    pp[2][29] = c0;
    
    
    //d = 2 ------> last iteration
    half_add_res = half_adder(pp[1][2], pp[2][2]);
    pp[1][2] = half_add_res[0];
    c0 = half_add_res[1];
    for(j=3;j<30;j=j+1)
    begin
         full_add_res = full_adder(pp[1][j], pp[2][j],c0);
         pp[1][j] = full_add_res[0];
         c0 = full_add_res[1];
    end
    pp[1][30] = c0;
    for(j=0;j<31;j=j+1)
    begin
         s1[j]=pp[0][j];
    end
    for(j=0;j<31;j=j+1)
    begin
         s2[j]=pp[1][j];
    end   
    s1[31] = 0;
    s2[31] = 0;
    
end 
    
bkadder add(
.a(s1),
.b(s2),
.Cin(1'b0),
.sum(result)
); 
endmodule
