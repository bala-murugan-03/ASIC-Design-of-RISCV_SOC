module bkadder(
    input [31:0] a,
    input [31:0] b,
    input Cin,
    output [31:0] sum,
    output cout
    );
    wire cin;
    wire [31:0] g,p;
    wire [15:0] g1,p1;
    wire [7:0] g2,p2;
    wire [3:0] g3,p3;
    wire [1:0] g4,p4;
    wire g5,p5;
    wire [31:0] c;
    genvar i;
    assign g = a & b;
    assign p = a ^ b;
    assign cin = Cin;
    
    //first stage
    generate
    for (i=0;i<16;i=i+1)begin : stage1
       assign g1[i] = g[2*i+1] | (p[2*i+1]&g[2*i]);
       assign p1[i] = (p[2*i]&p[2*i+1]);
    end
    endgenerate
        
    //second stage
    generate
    for (i=0;i<8;i=i+1)begin : stage2
       assign g2[i] = g1[2*i+1] | (p1[2*i+1]&g1[2*i]);
       assign p2[i] = (p1[2*i]&p1[2*i+1]);
    end
    endgenerate
        
    //third stage
	 generate
    for (i=0;i<4;i=i+1)begin: stage3
       assign g3[i] = g2[2*i+1] | (p2[2*i+1]&g2[2*i]);
       assign p3[i] = (p2[2*i]&p2[2*i+1]);
    end
    endgenerate
    
    //fourth stage
    generate
    for (i=0;i<2;i=i+1)begin: stage4
       assign g4[i] = g3[2*i+1] | (p3[2*i+1]&g3[2*i]);
       assign p4[i] = (p3[2*i]&p3[2*i+1]);
    end
    endgenerate
    
    //fifth stage
    assign g5 = g4[1]|(g4[0]&p4[1]);
    assign p5 = (p4[1]&p4[0]);
    
    
    //some intermediate g's and p's
    wire g11down8 = (g1[5] | (p1[5] & g1[4]));
    wire p11down8 = (p1[5] & p1[4]);
    wire p11down0 = p1[5] & p1[4] & p3[0];
    wire g13down8 = g1[6] | (p1[6] & g2[2]);
    wire p13down8 = p1[6] & p2[2];
    wire g17down0 = g1[8] | (p1[8] & g4[0]);
    wire p17down0 = p1[8] & p4[0];
    wire g21down16 = (g1[10] | p1[10] & g2[4]);
    wire p21down16 = (p1[10] & p2[4]);
    wire g25down16 = g1[12] | (p1[12] & g3[2]);
    wire p25down16 = p1[12] & p3[2];   
    wire g25down0 = g25down16 | (p25down16 & g4[0]);
    wire p25down0 = p25down16 & p4[0];
    wire g27down16 = g2[6] | (p2[6] & g3[2]);
    wire p27down16 = p2[6] & g3[2];
    wire g27down0 = g27down16 | (p27down16 & g4[0]);
    wire p27down0 = p27down16 & p4[0];
    wire g29down24 = g1[14] | (p1[14] & g2[6]);
    wire p29down24 = p1[14] & p2[6];
    wire g29down16 = g29down24 | (p29down24 & g3[2]);
    wire p29down16 = p29down24 & p3[2];
    wire g29down0 = g29down16 | (p29down16 & g4[0]);
    wire p29down0 = p29down16 & p4[0]; 

     
    assign c[0] = g[0] | (p[0] & cin);  
    
    //odd carry calculations
    assign c[1] = g1[0] | (p1[0] & cin); 
    assign c[3] = g2[0] | (p2[0] & cin);
    assign c[5] = g1[2] | (p1[2] & g2[0]) | (p1[2] & p2[0] & cin);
    assign c[7] = g3[0] | (p3[0] & cin);
    assign c[9] = g1[4] | (p1[4] & g3[0]) | (p1[4] & p3[0]  & cin);
    assign c[11] = g11down8 | (p11down8 & g3[0]) | (p11down0 & cin);
    assign c[13] = (g13down8 | (p13down8 & g3[0])) | (p13down8 & p3[0] & cin) ;
    assign c[15] =  g4[0] | (p4[0] & cin);
    assign c[17] = g17down0 | (p17down0 & cin);
    assign c[19] = g2[4] | (p2[4] & g4[0]) | (p2[4] & p4[0] & cin);
    assign c[21] =  (g21down16 | (p21down16 & g4[0])) | (p21down16 & p4[0] & cin);
    assign c[23] = g3[2] | (p3[2] &  g4[0]) | (p3[2] & p4[0] & cin);
    assign c[25] =  g25down0 | (p25down0 & cin);
    assign c[27] = g27down0 | (p27down0 & cin);
    assign c[29] = g29down0 | (p29down0 & cin);
    assign c[31] = g5 | (p5 & cin);
    
    //even carries
    generate
    for(i=1; i<16; i = i+1)begin: evencarry
        assign c[2*i] = g[2*i] | (p[2*i] & c[2*i-1]);
    end
    endgenerate
    
    assign sum[0] = p[0] ^ cin;
    
    generate
    for (i=1; i<32; i = i+1) begin: sumgen
        assign sum[i] = p[i] ^ c[i-1];
    end
    endgenerate
	 
    assign cout = c[31];
    
endmodule
