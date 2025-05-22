`timescale 1ns / 1ps
`include "/home/running_courses/EE705/EE705_3/OpenLane/designs/riscv_alu/src/def.v"

module riscv_alu(
    input [3:0] alu_op_i,
    input [31:0] alu_a_i,
    input [31:0] alu_b_i,
    output reg [31:0] alu_p_o,
input CLK,RST_N
    );
    
    wire [31:0] SHIFTL_result; 
    wire [31:0] SHIFTR_result; 
    wire [31:0] SHIFTR_ARITH_result; 
    wire [31:0] ADD_result; 
    wire [31:0] SUB_result; 
    wire [31:0] AND_result; 
    wire [31:0] OR_result;  
    wire [31:0] MUL_result; 
    wire [31:0] LESS_THAN_result; 
    wire [31:0] LESS_THAN_SIGNED_result; 

    Left_Right_shifter leftshifter(
        .A(alu_a_i),
        .n(alu_b_i[4:0]),
        .shift_direction(1'b1),
        .Left_Right_shifter_out(SHIFTL_result)
    );
    
    Left_Right_shifter rightshifter(
        .A(alu_a_i),
        .n(alu_b_i[4:0]),
        .shift_direction(1'b0),
        .Left_Right_shifter_out(SHIFTR_result)
    );

    Arith_shift_right arith_shifter (
        .A(alu_a_i),
        .n(alu_b_i[4:0]),
        .Y(SHIFTR_ARITH_result)
    );
    
   ADD_SUB_using_BK add (
        .A(alu_a_i[31:0]),    
        .B(alu_b_i[31:0]),
        .op_code(1'b0),   
        .Y(ADD_result)
    );

    ADD_SUB_using_BK sub (
        .A(alu_a_i[31:0]),     
        .B(alu_b_i[31:0]),
        .op_code(1'b1),   
        .Y(SUB_result)
    );
    
    bit_AND_op bitand(
        .A(alu_a_i[31:0]),
        .B(alu_b_i[31:0]),
        .Y(AND_result)
    );

    bit_OR_op bitor(
        .A(alu_a_i[31:0]),
        .B(alu_b_i[31:0]),
        .Y(OR_result)
    );
    
    MUL_using_Dadda mulop(
        .A(alu_a_i[31:0]),
        .B(alu_b_i[31:0]),
        .Y(MUL_result)
    );

    Unsigned_compar compareunsigned (
        .A(alu_a_i ),
        .B(alu_b_i[31:0]),
        .Y(LESS_THAN_result)
    );

    Signed_compar comparesigned (
        .A(alu_a_i[31:0]),
        .B(alu_b_i[31:0]),
        .Y(LESS_THAN_SIGNED_result)
    );
    
    wire [31:0]XOR_result;
    assign XOR_result = alu_a_i ^ alu_b_i;
      
    // ALU output selection using continuous assignments
    always @(*) begin
        case(alu_op_i)
            `ALU_NONE: alu_p_o = 32'b0;
            `ALU_SHIFTL: alu_p_o = SHIFTL_result;
            `ALU_SHIFTR: alu_p_o = SHIFTR_result;
            `ALU_SHIFTR_ARITH: alu_p_o = SHIFTR_ARITH_result;
            `ALU_ADD: alu_p_o = ADD_result;
            `ALU_SUB: alu_p_o = SUB_result;
            `ALU_AND: alu_p_o = AND_result;
            `ALU_OR: alu_p_o = OR_result;
            `ALU_XOR: alu_p_o = XOR_result;
            `ALU_LESS_THAN: alu_p_o = LESS_THAN_result;
            `ALU_LESS_THAN_SIGNED: alu_p_o = LESS_THAN_SIGNED_result;
            `ALU_MUL: alu_p_o = MUL_result;
             default: alu_p_o = 32'b0;
         endcase
    end
endmodule

module ADD_SUB_using_BK (
    input [31:0] A,               
    input [31:0] B,               
    input op_code,                
    output [31:0] Y               
);
    wire cin;                     
    wire cout;                    
    wire [31:0] NegB;
    wire [31:0] B_or_NegB;
    
    assign NegB = ~B;       
    assign B_or_NegB = (op_code) ? NegB : B;
    assign cin = op_code;          

    // instantiating the Brent-Kung adder
    BK_Adder_32 brent_kung (
        .a(A),                     
        .b(B_or_NegB),             
        .cin(cin),                 
        .sum(Y),                   
        .cout(cout)                
    );
endmodule

module Arith_shift_right(
    input  signed [31:0] A, 
    input         [4:0]  n, 
    output signed [31:0] Y  
);
    //reg signed [31:0] temp;
    //integer i;

    //always @(*) begin
       // temp = A; 
        //for (i = 0; i < n; i = i + 1) begin
           // temp = {temp[31], temp[31:1]};
       // end
    //end

    //assign Y = temp;
    reg signed [31:0] temp0, temp1, temp3, temp2, temp4;
    integer i;

    always @(*) begin
		if (n[0]) 
			temp0 = {A[31], A[31:1]};
		else
			temp0 = A;
		if (n[1]) 
			temp1 = {{2{temp0[31]}}, temp0[31:2]};
		else
			temp1 = temp0;
		if (n[2]) 
			temp2 = {{4{temp1[31]}}, temp1[31:4]};
		else
			temp2 = temp1;
		if (n[3]) 
			temp3 = {{8{temp2[31]}}, temp2[31:8]};
		else
			temp3 = temp2;
		if (n[4]) 
			temp4 = {{16{temp3[31]}}, temp3[31:16]};
		else
			temp4 = temp3;
    end

    assign Y = temp4;
endmodule

module bit_AND_op(
    input [31:0] A,B,  
    output [31:0] Y
 );
 
 genvar i;
 generate
    for (i=0; i<32; i=i+1)begin
        assign Y[i] = A[i] & B[i];
    end 
 endgenerate
endmodule


module bit_OR_op(
    input [31:0] A,B, 
    output [31:0] Y
 );
 genvar i;
 generate 
    for (i=0; i<32; i=i+1)begin
        assign Y[i] = A[i] | B[i];
    end
 endgenerate
endmodule

module BK_Adder_32(
    input [31:0] a,b ,
    input cin,
    output [31:0] sum,
    output cout,
    output [31:0] c
);

genvar i,k,h,n,o,j,l,m,s;
wire[31:0] g,p;
wire[15:0]  g2b,p2b;
wire[7:0] g3b,p3b;
wire[3:0] g4b,p4b;
wire[1:0] g5b,p5b;
//wire [30:0] c
wire g6b,p6b;
assign g=a&b;
assign p=a^b;

generate
    for(j=0;j<16;j=j+1)begin:division16
        g2bits ga(g[2*j+1:2*j],p[2*j+1],g2b[j]);
        p2bits pa(p[2*j+1:2*j],p2b[j]);
    end

    for(l=0;l<8;l=l+1)begin:division8
        g2bits gb(g2b[2*l+1:2*l],p2b[2*l+1],g3b[l]);
        p2bits pb(p2b[2*l+1:2*l],p3b[l]);
    end
    
    for(m=0;m<4;m=m+1)begin:division4
        g2bits gc(g3b[2*m+1:2*m],p3b[2*m+1],g4b[m]);
        p2bits pc(p3b[2*m+1:2*m],p4b[m]);
    end

    for(s=0;s<2;s=s+1)begin:division2
        g2bits gd(g4b[2*s+1:2*s],p4b[2*s+1],g5b[s]);
        p2bits pd (p4b[2*s+1:2*s],p5b[s]);
    end
endgenerate
    
    g2bits ge(g5b[1:0],p5b[1],g6b);
    p2bits pe(p5b[1:0],p6b);
    assign  c[0]=cin;
    
    assign cout= g6b|(p6b&cin);
    assign c[16]=g5b[0]|(p5b[0]&cin);
    assign c[8]=g4b[0]|(p4b[0]&cin);
    assign c[4]=g3b[0]|(p3b[0]&cin);
    assign c[2]=g2b[0]|(p2b[0]&cin);
    assign c[1]=g[0]|(p[0]&cin);
    assign c[12]=g3b[2]|(p3b[2]&c[8]);
    assign c[20]=g3b[4]|(p3b[4]&c[16]);
    assign c[3]=g[2]|(p[2]&c[2]);
    assign c[24]=g4b[2]|(p4b[2]&c[16]);
    assign c[28]=g3b[6]|(p3b[6]&c[24]);
    assign c[6]=g2b[2]|(p2b[2]&c[4]);
    assign c[10]=g2b[4]|(p2b[4]&c[8]);
    assign c[14]=g2b[6]|(p2b[6]&c[12]);
    assign c[18]=g2b[8]|(p2b[8]&c[16]);
    assign c[22]=g2b[10]|(p2b[10]&c[20]);
    assign c[26]=g2b[12]|(p2b[12]&c[24]);
    assign c[30]=g2b[14]|(p2b[14]&c[28]);
    assign c[5]=g[4]|(p[4]&c[4]);
    assign c[7]=g[6]|(p[6]&c[6]);
    assign c[9]=g[8]|(p[8]&c[8]);
    assign c[11]=g[10]|(p[10]&c[10]);
    assign c[13]=g[12]|(p[12]&c[12]);
    assign c[15]=g[14]|(p[14]&c[14]);
    assign c[17]=g[16]|(p[16]&c[16]);
    assign c[19]=g[18]|(p[18]&c[18]);
    assign c[21]=g[20]|(p[20]&c[20]);
    assign c[23]=g[22]|(p[22]&c[22]);
    assign c[25]=g[24]|(p[24]&c[24]);
    assign c[27]=g[26]|(p[26]&c[26]);
    assign c[29]=g[28]|(p[28]&c[28]);
    assign c[31]=g[30]|(p[30]&c[30]);
    
    assign sum=a^b^c;
endmodule

module g2bits(
    input [1:0] g2,
    input p2,
    output   g2o
    );
    assign g2o=g2[1]|(g2[0]&p2);
endmodule

module p2bits(
    input [1:0] p2,
    output  p2o
    );
    assign p2o=p2[1]&p2[0];
endmodule

module Dadda(
    input [31:0] A,    
    input [31:0] B,
    output [31:0] Dadda_out
    );
    
    wire [11:0] sum_stage1, carry_stage1;         
    wire [43:0] sum_stage2, carry_stage2;         
    wire [53:0] sum_stage3, carry_stage3;         
    wire [45:0] sum_stage4, carry_stage4;        
    wire [25:0] sum_stage5, carry_stage5;
    wire [27:0] sum_stage6, carry_stage6;       
    wire [31:0] final_sum1, final_sum2;          
    
    wire prod_matrix [15:0][15:0];
    genvar i, j;
    generate
        for(i = 0; i < 16; i = i + 1) begin
            for(j = 0; j < 16; j = j + 1) begin
                assign prod_matrix[j][i] = A[j] & B[i]; 
            end
        end
    endgenerate
    
    //1st stage of dadda multiplex reduction 
    Half_adder ha1 (.a(prod_matrix[13][0]), .b(prod_matrix[12][1]), .sum(sum_stage1[0]),      .carry(carry_stage1[0])                          );
    Full_adder fa1 (.a(prod_matrix[14][0]), .b(prod_matrix[13][1]), .cin(prod_matrix[12][2]), .sum(sum_stage1[1]),      .carry(carry_stage1[1]));
    Half_adder ha2 (.a(prod_matrix[11][3]), .b(prod_matrix[10][4]), .sum(sum_stage1[2]),      .carry(carry_stage1[2]));
    Full_adder fa2 (.a(prod_matrix[15][0]), .b(prod_matrix[14][1]), .cin(prod_matrix[13][2]), .sum(sum_stage1[3]),      .carry(carry_stage1[3]));
    Full_adder fa3 (.a(prod_matrix[12][3]), .b(prod_matrix[11][4]), .cin(prod_matrix[10][5]), .sum(sum_stage1[4]),      .carry(carry_stage1[4]));
    Half_adder ha3 (.a(prod_matrix[9][6]),  .b(prod_matrix[8][7]),  .sum(sum_stage1[5]),      .carry(carry_stage1[5]));
    Full_adder fa4 (.a(prod_matrix[15][1]), .b(prod_matrix[14][2]), .cin(prod_matrix[13][3]), .sum(sum_stage1[6]),      .carry(carry_stage1[6]));
    Full_adder fa5 (.a(prod_matrix[12][4]), .b(prod_matrix[11][5]), .cin(prod_matrix[10][6]), .sum(sum_stage1[7]),      .carry(carry_stage1[7]));
    Half_adder ha4 (.a(prod_matrix[9][7]),  .b(prod_matrix[8][8]),  .sum(sum_stage1[8]),      .carry(carry_stage1[8]));
    Full_adder fa6 (.a(prod_matrix[15][2]), .b(prod_matrix[14][3]), .cin(prod_matrix[13][4]), .sum(sum_stage1[9]),      .carry(carry_stage1[9]));
    Full_adder fa7 (.a(prod_matrix[12][5]), .b(prod_matrix[11][6]), .cin(prod_matrix[10][7]), .sum(sum_stage1[10]),     .carry(carry_stage1[10]));
    Full_adder fa8 (.a(prod_matrix[15][3]), .b(prod_matrix[14][4]), .cin(prod_matrix[13][5]), .sum(sum_stage1[11]),     .carry(carry_stage1[11]));
    
    //2nd stage of dadda multiplex reduction 
      Half_adder h5 (.a(prod_matrix[9][0]), .b(prod_matrix[8][1]), .sum(sum_stage2[0]), .carry(carry_stage2[0]));
      Full_adder f9 (.a(prod_matrix[10][0]), .b(prod_matrix[9][1]),  .cin(prod_matrix[8][2]), .sum(sum_stage2[1]), .carry(carry_stage2[1]));
      Half_adder h6 (.a(prod_matrix[7][3]), .b(prod_matrix[6][4]), .sum(sum_stage2[2]), .carry(carry_stage2[2]));
      Full_adder f10 (.a(prod_matrix[11][0]), .b(prod_matrix[10][1]),  .cin(prod_matrix[9][2]), .sum(sum_stage2[3]), .carry(carry_stage2[3]));
      Full_adder f11 (.a(prod_matrix[8][3]), .b(prod_matrix[7][4]),  .cin(prod_matrix[6][5]), .sum(sum_stage2[4]), .carry(carry_stage2[4]));
      Half_adder h7  (.a(prod_matrix[5][6]), .b(prod_matrix[4][7]), .sum(sum_stage2[5]), .carry(carry_stage2[5]));
      Full_adder f12 (.a(prod_matrix[12][0]), .b(prod_matrix[11][1]),  .cin(prod_matrix[10][2]), .sum(sum_stage2[6]), .carry(carry_stage2[6]));
      Full_adder f13 (.a(prod_matrix[9][3]), .b(prod_matrix[8][4]),  .cin(prod_matrix[7][5]), .sum(sum_stage2[7]), .carry(carry_stage2[7]));
      Full_adder f14 (.a(prod_matrix[6][6]), .b(prod_matrix[5][7]),  .cin(prod_matrix[4][8]), .sum(sum_stage2[8]), .carry(carry_stage2[8]));
      Half_adder h8  (.a(prod_matrix[3][9]), .b(prod_matrix[2][10]), .sum(sum_stage2[9]), .carry(carry_stage2[9]));
      Full_adder f15 (.a(prod_matrix[11][2]), .b(prod_matrix[10][3]),  .cin(prod_matrix[9][4]), .sum(sum_stage2[10]), .carry(carry_stage2[10]));
      Full_adder f16 (.a(prod_matrix[8][5]), .b(prod_matrix[7][6]),  .cin(prod_matrix[6][7]), .sum(sum_stage2[11]), .carry(carry_stage2[11]));
      Full_adder f17 (.a(prod_matrix[5][8]), .b(prod_matrix[4][9]),  .cin(prod_matrix[3][10]), .sum(sum_stage2[12]), .carry(carry_stage2[12]));
      Full_adder f18 (.a(prod_matrix[2][11]), .b(prod_matrix[1][12]),  .cin(prod_matrix[0][13]), .sum(sum_stage2[13]), .carry(carry_stage2[13]));
      Full_adder f19 (.a(prod_matrix[9][5]), .b(prod_matrix[8][6]),  .cin(prod_matrix[7][7]), .sum(sum_stage2[14]), .carry(carry_stage2[14]));
      Full_adder f20 (.a(prod_matrix[6][8]), .b(prod_matrix[5][9]),  .cin(prod_matrix[4][10]), .sum(sum_stage2[15]), .carry(carry_stage2[15]));
      Full_adder f21 (.a(prod_matrix[3][11]), .b(prod_matrix[2][12]),  .cin(prod_matrix[1][13]), .sum(sum_stage2[16]), .carry(carry_stage2[16]));
      Full_adder f22 (.a(prod_matrix[0][14]), .b(sum_stage1[1]),  .cin(sum_stage1[2]), .sum(sum_stage2[17]), .carry(carry_stage2[17]));
      Full_adder f23 (.a(prod_matrix[7][8]), .b(prod_matrix[6][9]),  .cin(prod_matrix[5][10]), .sum(sum_stage2[18]), .carry(carry_stage2[18]));
      Full_adder f24 (.a(prod_matrix[4][11]), .b(prod_matrix[3][12]),  .cin(prod_matrix[2][13]), .sum(sum_stage2[19]), .carry(carry_stage2[19]));
      Full_adder f25 (.a(prod_matrix[1][14]), .b(prod_matrix[0][15]),  .cin(sum_stage1[3]), .sum(sum_stage2[20]), .carry(carry_stage2[20]));
      Full_adder f26 (.a(sum_stage1[4]), .b(sum_stage1[5]),  .cin(carry_stage1[1]), .sum(sum_stage2[21]), .carry(carry_stage2[21]));
      Full_adder f27 (.a(prod_matrix[7][9]), .b(prod_matrix[6][10]),  .cin(prod_matrix[5][11]), .sum(sum_stage2[22]), .carry(carry_stage2[22]));
      Full_adder f28 (.a(prod_matrix[4][12]), .b(prod_matrix[3][13]),  .cin(prod_matrix[2][14]), .sum(sum_stage2[23]), .carry(carry_stage2[23]));
      Full_adder f29 (.a(prod_matrix[1][15]), .b(sum_stage1[6]),  .cin(sum_stage1[7]), .sum(sum_stage2[24]), .carry(carry_stage2[24]));
      Full_adder f30 (.a(sum_stage1[8]), .b(carry_stage1[3]),  .cin(carry_stage1[4]), .sum(sum_stage2[25]), .carry(carry_stage2[25]));
      Full_adder f31 (.a(prod_matrix[9][8]), .b(prod_matrix[8][9]),  .cin(prod_matrix[7][10]), .sum(sum_stage2[26]), .carry(carry_stage2[26]));
      Full_adder f32 (.a(prod_matrix[6][11]), .b(prod_matrix[5][12]),  .cin(prod_matrix[4][13]), .sum(sum_stage2[27]), .carry(carry_stage2[27]));
      Full_adder f33 (.a(prod_matrix[3][14]), .b(prod_matrix[2][15]),  .cin(sum_stage1[9]), .sum(sum_stage2[28]), .carry(carry_stage2[28]));
      Full_adder f34 (.a(sum_stage1[10]), .b(carry_stage1[6]),  .cin(carry_stage1[7]), .sum(sum_stage2[29]), .carry(carry_stage2[29]));
      Full_adder f35 (.a(prod_matrix[12][6]), .b(prod_matrix[11][7]),  .cin(prod_matrix[10][8]), .sum(sum_stage2[30]), .carry(carry_stage2[30]));
      Full_adder f36 (.a(prod_matrix[9][9]), .b(prod_matrix[8][10]),  .cin(prod_matrix[7][11]), .sum(sum_stage2[31]), .carry(carry_stage2[31]));
      Full_adder f37 (.a(prod_matrix[6][12]), .b(prod_matrix[5][13]),  .cin(prod_matrix[4][14]), .sum(sum_stage2[32]), .carry(carry_stage2[32]));
      Full_adder f38 (.a(prod_matrix[3][15]), .b(sum_stage1[11]),  .cin(carry_stage1[9]), .sum(sum_stage2[33]), .carry(carry_stage2[33]));
      Full_adder f39 (.a(prod_matrix[15][4]), .b(prod_matrix[14][5]),  .cin(prod_matrix[13][6]), .sum(sum_stage2[34]), .carry(carry_stage2[34]));
      Full_adder f40 (.a(prod_matrix[12][7]), .b(prod_matrix[11][8]),  .cin(prod_matrix[10][9]), .sum(sum_stage2[35]), .carry(carry_stage2[35]));
      Full_adder f41 (.a(prod_matrix[9][10]), .b(prod_matrix[8][11]),  .cin(prod_matrix[7][12]), .sum(sum_stage2[36]), .carry(carry_stage2[36]));
      Full_adder f42 (.a(prod_matrix[6][13]), .b(prod_matrix[5][14]),  .cin(prod_matrix[4][15]), .sum(sum_stage2[37]), .carry(carry_stage2[37]));
      Full_adder f43 (.a(prod_matrix[15][5]), .b(prod_matrix[14][6]),  .cin(prod_matrix[13][7]), .sum(sum_stage2[38]), .carry(carry_stage2[38]));
      Full_adder f44 (.a(prod_matrix[12][8]), .b(prod_matrix[11][9]),  .cin(prod_matrix[10][10]), .sum(sum_stage2[39]), .carry(carry_stage2[39]));
      Full_adder f45 (.a(prod_matrix[9][11]), .b(prod_matrix[8][12]),  .cin(prod_matrix[7][13]), .sum(sum_stage2[40]), .carry(carry_stage2[40]));
      Full_adder f46 (.a(prod_matrix[15][6]), .b(prod_matrix[14][7]),  .cin(prod_matrix[13][8]), .sum(sum_stage2[41]), .carry(carry_stage2[41]));
      Full_adder f47 (.a(prod_matrix[12][9]), .b(prod_matrix[11][10]),  .cin(prod_matrix[10][11]), .sum(sum_stage2[42]), .carry(carry_stage2[42]));
      Full_adder f48 (.a(prod_matrix[15][7]), .b(prod_matrix[14][8]),  .cin(prod_matrix[13][9]), .sum(sum_stage2[43]), .carry(carry_stage2[43]));

   //3rd stage of dadda multiplex reduction 
    Half_adder h9 (.a(prod_matrix[6][0]), .b(prod_matrix[5][1]), .sum(sum_stage3[0]), .carry(carry_stage3[0]));
    Full_adder f49 (.a(prod_matrix[7][0]), .b(prod_matrix[6][1]),  .cin(prod_matrix[5][2]),.sum(sum_stage3[1]), .carry(carry_stage3[1]));
    Half_adder h10 (.a(prod_matrix[4][3]), .b(prod_matrix[3][4]), .sum(sum_stage3[2]), .carry(carry_stage3[2]));
    Full_adder f50 (.a(prod_matrix[8][0]), .b(prod_matrix[7][1]),  .cin(prod_matrix[6][2]),.sum(sum_stage3[3]), .carry(carry_stage3[3]));
    Full_adder f51 (.a(prod_matrix[5][3]), .b(prod_matrix[4][4]),  .cin(prod_matrix[3][5]),.sum(sum_stage3[4]), .carry(carry_stage3[4]));
    Half_adder h11 (.a(prod_matrix[2][6]), .b(prod_matrix[1][7]), .sum(sum_stage3[5]), .carry(carry_stage3[5]));

    Full_adder f52 (.a(prod_matrix[7][2]), .b(prod_matrix[6][3]),  .cin(prod_matrix[5][4]),.sum(sum_stage3[6]), .carry(carry_stage3[6]));
    Full_adder f53 (.a(prod_matrix[4][5]), .b(prod_matrix[3][6]),  .cin(prod_matrix[2][7]),.sum(sum_stage3[7]), .carry(carry_stage3[7]));
    Full_adder f54 (.a(prod_matrix[1][8]), .b(prod_matrix[0][9]),  .cin(sum_stage2[0]),.sum(sum_stage3[8]), .carry(carry_stage3[8]));
    Full_adder f55 (.a(prod_matrix[5][5]), .b(prod_matrix[4][6]),  .cin(prod_matrix[3][7]),.sum(sum_stage3[9]), .carry(carry_stage3[9]));
    Full_adder f56 (.a(prod_matrix[2][8]), .b(prod_matrix[1][9]),  .cin(prod_matrix[0][10]),.sum(sum_stage3[10]), .carry(carry_stage3[10]));
    Full_adder f57 (.a(sum_stage2[1]), .b(sum_stage2[2]),  .cin(carry_stage2[0]),.sum(sum_stage3[11]), .carry(carry_stage3[11]));
    Full_adder f58 (.a(prod_matrix[3][8]), .b(prod_matrix[2][9]),  .cin(prod_matrix[1][10]),.sum(sum_stage3[12]), .carry(carry_stage3[12]));
    Full_adder f59 (.a(prod_matrix[0][11]), .b(sum_stage2[3]),  .cin(sum_stage2[4]),.sum(sum_stage3[13]), .carry(carry_stage3[13]));
    Full_adder f60 (.a(sum_stage2[5]), .b(carry_stage2[1]),  .cin(carry_stage2[2]),.sum(sum_stage3[14]), .carry(carry_stage3[14]));
    Full_adder f61 (.a(prod_matrix[1][11]), .b(prod_matrix[0][12]),  .cin(sum_stage2[6]),.sum(sum_stage3[15]), .carry(carry_stage3[15]));
    Full_adder f62 (.a(sum_stage2[7]), .b(sum_stage2[8]),  .cin(sum_stage2[9]),.sum(sum_stage3[16]), .carry(carry_stage3[16]));
    Full_adder f63 (.a(carry_stage2[3]), .b(carry_stage2[4]),  .cin(carry_stage2[5]),.sum(sum_stage3[17]), .carry(carry_stage3[17]));
    Full_adder f64 (.a(sum_stage1[0]), .b(sum_stage2[10]),  .cin(sum_stage2[11]),.sum(sum_stage3[18]), .carry(carry_stage3[18]));
    Full_adder f65 (.a(sum_stage2[12]), .b(sum_stage2[13]),  .cin(carry_stage2[6]),.sum(sum_stage3[19]), .carry(carry_stage3[19]));
    Full_adder f66 (.a(carry_stage2[7]), .b(carry_stage2[8]),  .cin(carry_stage2[9]),.sum(sum_stage3[20]), .carry(carry_stage3[20]));
    Full_adder f67 (.a(carry_stage1[0]), .b(sum_stage2[14]),  .cin(sum_stage2[15]),.sum(sum_stage3[21]), .carry(carry_stage3[21]));
    Full_adder f68 (.a(sum_stage2[16]), .b(sum_stage2[17]),  .cin(carry_stage2[10]),.sum(sum_stage3[22]), .carry(carry_stage3[22]));
    Full_adder f69 (.a(carry_stage2[11]), .b(carry_stage2[12]),  .cin(carry_stage2[13]),.sum(sum_stage3[23]), .carry(carry_stage3[23]));
    Full_adder f70 (.a(carry_stage1[2]), .b(sum_stage2[18]),  .cin(sum_stage2[19]),.sum(sum_stage3[24]), .carry(carry_stage3[24]));
    Full_adder f71 (.a(sum_stage2[20]), .b(sum_stage2[21]),  .cin(carry_stage2[14]),.sum(sum_stage3[25]), .carry(carry_stage3[25]));
    Full_adder f72 (.a(carry_stage2[15]), .b(carry_stage2[16]),  .cin(carry_stage2[17]),.sum(sum_stage3[26]), .carry(carry_stage3[26]));
    Full_adder f73 (.a(carry_stage1[5]), .b(sum_stage2[22]),  .cin(sum_stage2[23]),.sum(sum_stage3[27]), .carry(carry_stage3[27]));
    Full_adder f74 (.a(sum_stage2[24]), .b(sum_stage2[25]),  .cin(carry_stage2[18]),.sum(sum_stage3[28]), .carry(carry_stage3[28]));
    Full_adder f75 (.a(carry_stage2[19]), .b(carry_stage2[20]),  .cin(carry_stage2[21]),.sum(sum_stage3[29]), .carry(carry_stage3[29]));
    Full_adder f76 (.a(carry_stage1[8]), .b(sum_stage2[26]),  .cin(sum_stage2[27]),.sum(sum_stage3[30]), .carry(carry_stage3[30]));
    Full_adder f77 (.a(sum_stage2[28]), .b(sum_stage2[29]),  .cin(carry_stage2[22]),.sum(sum_stage3[31]), .carry(carry_stage3[31]));
    Full_adder f78 (.a(carry_stage2[23]), .b(carry_stage2[24]),  .cin(carry_stage2[25]),.sum(sum_stage3[32]), .carry(carry_stage3[32]));
    Full_adder f79 (.a(carry_stage1[10]), .b(sum_stage2[30]),  .cin(sum_stage2[31]),.sum(sum_stage3[33]), .carry(carry_stage3[33]));
    Full_adder f80 (.a(sum_stage2[32]), .b(sum_stage2[33]),  .cin(carry_stage2[26]),.sum(sum_stage3[34]), .carry(carry_stage3[34]));
    Full_adder f81 (.a(carry_stage2[27]), .b(carry_stage2[28]),  .cin(carry_stage2[29]),.sum(sum_stage3[35]), .carry(carry_stage3[35]));
    Full_adder f82 (.a(carry_stage1[11]), .b(sum_stage2[34]),  .cin(sum_stage2[35]),.sum(sum_stage3[36]), .carry(carry_stage3[36]));
    Full_adder f83 (.a(sum_stage2[36]), .b(sum_stage2[37]),  .cin(carry_stage2[30]),.sum(sum_stage3[37]), .carry(carry_stage3[37]));
    Full_adder f84 (.a(carry_stage2[31]), .b(carry_stage2[32]),  .cin(carry_stage2[33]),.sum(sum_stage3[38]), .carry(carry_stage3[38]));
    Full_adder f85 (.a(prod_matrix[6][14]), .b(prod_matrix[5][15]),  .cin(sum_stage2[38]),.sum(sum_stage3[39]), .carry(carry_stage3[39]));
    Full_adder f86 (.a(sum_stage2[39]), .b(sum_stage2[40]),  .cin(carry_stage2[34]),.sum(sum_stage3[40]), .carry(carry_stage3[40]));
    Full_adder f87 (.a(carry_stage2[35]), .b(carry_stage2[36]),  .cin(carry_stage2[37]), .sum(sum_stage3[41]), .carry(carry_stage3[41]));
    Full_adder f88 (.a(prod_matrix[9][12]), .b(prod_matrix[8][13]),  .cin(prod_matrix[7][14]), .sum(sum_stage3[42]), .carry(carry_stage3[42]));
    Full_adder f89 (.a(prod_matrix[6][15]), .b(sum_stage2[41]),  .cin(sum_stage2[42]), .sum(sum_stage3[43]), .carry(carry_stage3[43]));
    Full_adder f90 (.a(carry_stage2[38]), .b(carry_stage2[39]),  .cin(carry_stage2[40]), .sum(sum_stage3[44]), .carry(carry_stage3[44]));
    Full_adder f91 (.a(prod_matrix[12][10]), .b(prod_matrix[11][11]),  .cin(prod_matrix[10][12]), .sum(sum_stage3[45]), .carry(carry_stage3[45]));
    Full_adder f92 (.a(prod_matrix[9][13]), .b(prod_matrix[8][14]),  .cin(prod_matrix[7][15]), .sum(sum_stage3[46]), .carry(carry_stage3[46]));
    Full_adder f93 (.a(sum_stage2[43]), .b(carry_stage2[41]),  .cin(carry_stage2[42]), .sum(sum_stage3[47]), .carry(carry_stage3[47]));
    Full_adder f94 (.a(prod_matrix[15][8]), .b(prod_matrix[14][9]),  .cin(prod_matrix[13][10]), .sum(sum_stage3[48]), .carry(carry_stage3[48]));
    Full_adder f95 (.a(prod_matrix[12][11]), .b(prod_matrix[11][12]),  .cin(prod_matrix[10][13]), .sum(sum_stage3[49]), .carry(carry_stage3[49]));
    Full_adder f96 (.a(prod_matrix[9][14]), .b(prod_matrix[8][15]),  .cin(carry_stage2[43]), .sum(sum_stage3[50]), .carry(carry_stage3[50]));
    Full_adder f97 (.a(prod_matrix[15][9]), .b(prod_matrix[14][10]),  .cin(prod_matrix[13][11]), .sum(sum_stage3[51]), .carry(carry_stage3[51]));
    Full_adder f98 (.a(prod_matrix[12][12]), .b(prod_matrix[11][13]),  .cin(prod_matrix[10][14]), .sum(sum_stage3[52]), .carry(carry_stage3[52]));
    Full_adder f99 (.a(prod_matrix[15][10]), .b(prod_matrix[14][11]),  .cin(prod_matrix[13][12]), .sum(sum_stage3[53]), .carry(carry_stage3[53]));

    //4th stage of dadda multiplex reduction 
    
    Half_adder h12 (.a(prod_matrix[4][0]), .b(prod_matrix[3][1]), .sum(sum_stage4[0]), .carry(carry_stage4[0])); 
    Full_adder f100 (.a(prod_matrix[5][0]), .b(prod_matrix[4][1]),  .cin(prod_matrix[3][2]),.sum(sum_stage4[1]), .carry(carry_stage4[1]));
    Half_adder h13  (.a(prod_matrix[2][3]), .b(prod_matrix[1][4]), .sum(sum_stage4[2]), .carry(carry_stage4[2]));
    Full_adder f01 (.a(prod_matrix[4][2]), .b(prod_matrix[3][3]),  .cin(prod_matrix[2][4]),.sum(sum_stage4[3]), .carry(carry_stage4[3]));
    Full_adder f02 (.a(prod_matrix[1][5]), .b(prod_matrix[0][6]),  .cin(sum_stage3[0]),.sum(sum_stage4[4]), .carry(carry_stage4[4]));
    Full_adder f03 (.a(prod_matrix[2][5]), .b(prod_matrix[1][6]),  .cin(prod_matrix[0][7]),.sum(sum_stage4[5]), .carry(carry_stage4[5]));
    Full_adder f04 (.a(sum_stage3[1]), .b(sum_stage3[2]),  .cin(carry_stage3[0]),.sum(sum_stage4[6]), .carry(carry_stage4[6]));
    Full_adder f05 (.a(prod_matrix[0][8]), .b(sum_stage3[3]),  .cin(sum_stage3[4]),.sum(sum_stage4[7]), .carry(carry_stage4[7]));
    Full_adder f06 (.a(sum_stage3[5]), .b(carry_stage3[1]),  .cin(carry_stage3[2]),.sum(sum_stage4[8]), .carry(carry_stage4[8]));
    Full_adder f07 (.a(sum_stage3[6]), .b(sum_stage3[7]),  .cin(sum_stage3[8]),.sum(sum_stage4[9]), .carry(carry_stage4[9]));
    Full_adder f08 (.a(carry_stage3[3]), .b(carry_stage3[4]),  .cin(carry_stage3[5]),.sum(sum_stage4[10]), .carry(carry_stage4[10]));
    Full_adder f09 (.a(sum_stage3[9]), .b(sum_stage3[10]),  .cin(sum_stage3[11]),.sum(sum_stage4[11]), .carry(carry_stage4[11]));
    Full_adder f010 (.a(carry_stage3[6]), .b(carry_stage3[7]),  .cin(carry_stage3[8]),.sum(sum_stage4[12]), .carry(carry_stage4[12]));
    Full_adder f011 (.a(sum_stage3[12]), .b(sum_stage3[13]),  .cin(sum_stage3[14]),.sum(sum_stage4[13]), .carry(carry_stage4[13]));
    Full_adder f012 (.a(carry_stage3[9]), .b(carry_stage3[10]),  .cin(carry_stage3[11]),.sum(sum_stage4[14]), .carry(carry_stage4[14]));
    Full_adder f013 (.a(sum_stage3[15]), .b(sum_stage3[16]),  .cin(sum_stage3[17]),.sum(sum_stage4[15]), .carry(carry_stage4[15]));
    Full_adder f014 (.a(carry_stage3[12]), .b(carry_stage3[13]),  .cin(carry_stage3[14]),.sum(sum_stage4[16]), .carry(carry_stage4[16]));
    Full_adder f015 (.a(sum_stage3[18]), .b(sum_stage3[19]),  .cin(sum_stage3[20]),.sum(sum_stage4[17]), .carry(carry_stage4[17]));
    Full_adder f016 (.a(carry_stage3[15]), .b(carry_stage3[16]),  .cin(carry_stage3[17]),.sum(sum_stage4[18]), .carry(carry_stage4[18])); 
    Full_adder f017 (.a(sum_stage3[21]), .b(sum_stage3[22]),  .cin(sum_stage3[23]),.sum(sum_stage4[19]), .carry(carry_stage4[19]));
    Full_adder f018 (.a(carry_stage3[18]), .b(carry_stage3[19]),  .cin(carry_stage3[20]),.sum(sum_stage4[20]), .carry(carry_stage4[20])); 
    Full_adder f019 (.a(sum_stage3[24]), .b(sum_stage3[25]),  .cin(sum_stage3[26]),.sum(sum_stage4[21]), .carry(carry_stage4[21]));
    Full_adder f020 (.a(carry_stage3[21]), .b(carry_stage3[22]),  .cin(carry_stage3[23]),.sum(sum_stage4[22]), .carry(carry_stage4[22]));
    Full_adder f021 (.a(sum_stage3[27]), .b(sum_stage3[28]),  .cin(sum_stage3[29]),.sum(sum_stage4[23]), .carry(carry_stage4[23]));
    Full_adder f022 (.a(carry_stage3[24]), .b(carry_stage3[25]),  .cin(carry_stage3[26]),.sum(sum_stage4[24]), .carry(carry_stage4[24]));
    Full_adder f023 (.a(sum_stage3[30]), .b(sum_stage3[31]),  .cin(sum_stage3[32]),.sum(sum_stage4[25]), .carry(carry_stage4[25]));
    Full_adder f024 (.a(carry_stage3[27]), .b(carry_stage3[28]),  .cin(carry_stage3[29]),.sum(sum_stage4[26]), .carry(carry_stage4[26]));
    Full_adder f025 (.a(sum_stage3[33]), .b(sum_stage3[34]),  .cin(sum_stage3[35]),.sum(sum_stage4[27]), .carry(carry_stage4[27]));
    Full_adder f026 (.a(carry_stage3[30]), .b(carry_stage3[31]),  .cin(carry_stage3[32]),.sum(sum_stage4[28]), .carry(carry_stage4[28]));
    Full_adder f027 (.a(sum_stage3[36]), .b(sum_stage3[37]),  .cin(sum_stage3[38]),.sum(sum_stage4[29]), .carry(carry_stage4[29]));
    Full_adder f028 (.a(carry_stage3[33]), .b(carry_stage3[34]),  .cin(carry_stage3[35]),.sum(sum_stage4[30]), .carry(carry_stage4[30]));
    Full_adder f029 (.a(sum_stage3[39]), .b(sum_stage3[40]),  .cin(sum_stage3[41]),.sum(sum_stage4[31]), .carry(carry_stage4[31]));
    Full_adder f030 (.a(carry_stage3[36]), .b(carry_stage3[37]),  .cin(carry_stage3[38]),.sum(sum_stage4[32]), .carry(carry_stage4[32]));
    Full_adder f031 (.a(sum_stage3[42]), .b(sum_stage3[43]),  .cin(sum_stage3[44]),.sum(sum_stage4[33]), .carry(carry_stage4[33])); 
    Full_adder f032 (.a(carry_stage3[39]), .b(carry_stage3[40]),  .cin(carry_stage3[41]),.sum(sum_stage4[34]), .carry(carry_stage4[34]));
    Full_adder f033 (.a(sum_stage3[45]), .b(sum_stage3[46]),  .cin(sum_stage3[47]),.sum(sum_stage4[35]), .carry(carry_stage4[35]));
    Full_adder f034 (.a(carry_stage3[42]), .b(carry_stage3[43]),  .cin(carry_stage3[44]),.sum(sum_stage4[36]), .carry(carry_stage4[36]));
    Full_adder f035 (.a(sum_stage3[48]), .b(sum_stage3[49]),  .cin(sum_stage3[50]),.sum(sum_stage4[37]), .carry(carry_stage4[37]));
    Full_adder f036 (.a(carry_stage3[45]), .b(carry_stage3[46]),  .cin(carry_stage3[47]),.sum(sum_stage4[38]), .carry(carry_stage4[38]));
    Full_adder f037 (.a(prod_matrix[9][15]), .b(sum_stage3[51]),  .cin(sum_stage3[52]),.sum(sum_stage4[39]), .carry(carry_stage4[39]));
    Full_adder f038 (.a(carry_stage3[48]), .b(carry_stage3[49]),  .cin(carry_stage3[50]),.sum(sum_stage4[40]), .carry(carry_stage4[40]));
    Full_adder f039 (.a(prod_matrix[12][13]), .b(prod_matrix[11][14]),  .cin(prod_matrix[10][15]),.sum(sum_stage4[41]), .carry(carry_stage4[41]));
    Full_adder f040 (.a(sum_stage3[53]), .b(carry_stage3[51]),  .cin(carry_stage3[52]),.sum(sum_stage4[42]), .carry(carry_stage4[42]));
    Full_adder f041 (.a(prod_matrix[15][11]), .b(prod_matrix[14][12]),  .cin(prod_matrix[13][13]),.sum(sum_stage4[43]), .carry(carry_stage4[43]));
    Full_adder f042 (.a(prod_matrix[12][14]), .b(prod_matrix[11][15]),  .cin(carry_stage3[53]), .sum(sum_stage4[44]), .carry(carry_stage4[44]));
    Full_adder f043 (.a(prod_matrix[15][12]), .b(prod_matrix[14][13]),  .cin(prod_matrix[13][14]),.sum(sum_stage4[45]), .carry(carry_stage4[45]));

    //5th stage of dadda multiplex reduction 
    Half_adder h14 (.a(prod_matrix[3][0]), .b(prod_matrix[2][1]), .sum(sum_stage5[0]), .carry(carry_stage5[0])); 
    Full_adder f044 (.a(prod_matrix[2][2]), .b(prod_matrix[1][3]),  .cin(prod_matrix[0][4]), .sum(sum_stage5[1]), .carry(carry_stage5[1])); 
    Full_adder f045 (.a(prod_matrix[0][5]), .b(sum_stage4[1]),  .cin(sum_stage4[2]), .sum(sum_stage5[2]), .carry(carry_stage5[2]));
    Full_adder f046 (.a(sum_stage4[3]), .b(sum_stage4[4]),  .cin(carry_stage4[1]), .sum(sum_stage5[3]), .carry(carry_stage5[3])); 
    Full_adder f047 (.a(sum_stage4[5]), .b(sum_stage4[6]),  .cin(carry_stage4[3]), .sum(sum_stage5[4]), .carry(carry_stage5[4])); 
    Full_adder f048 (.a(sum_stage4[7]), .b(sum_stage4[8]),  .cin(carry_stage4[5]), .sum(sum_stage5[5]), .carry(carry_stage5[5])); 
    Full_adder f049 (.a(sum_stage4[9]), .b(sum_stage4[10]), .cin(carry_stage4[7]), .sum(sum_stage5[6]), .carry(carry_stage5[6])); 
    Full_adder f050 (.a(sum_stage4[11]), .b(sum_stage4[12]), .cin(carry_stage4[9]), .sum(sum_stage5[7]), .carry(carry_stage5[7])); 
    Full_adder f051 (.a(sum_stage4[13]), .b(sum_stage4[14]),  .cin(carry_stage4[11]), .sum(sum_stage5[8]), .carry(carry_stage5[8])); 
    Full_adder f052 (.a(sum_stage4[15]), .b(sum_stage4[16]),  .cin(carry_stage4[13]), .sum(sum_stage5[9]), .carry(carry_stage5[9])); 
    Full_adder f053 (.a(sum_stage4[17]), .b(sum_stage4[18]),  .cin(carry_stage4[15]), .sum(sum_stage5[10]), .carry(carry_stage5[10])); 
    Full_adder f054 (.a(sum_stage4[19]), .b(sum_stage4[20]),  .cin(carry_stage4[17]), .sum(sum_stage5[11]), .carry(carry_stage5[11])); 
    Full_adder f055 (.a(sum_stage4[21]), .b(sum_stage4[22]),  .cin(carry_stage4[19]), .sum(sum_stage5[12]), .carry(carry_stage5[12]));
    Full_adder f056 (.a(sum_stage4[23]), .b(sum_stage4[24]),  .cin(carry_stage4[21]), .sum(sum_stage5[13]), .carry(carry_stage5[13]));
    Full_adder f057 (.a(sum_stage4[25]), .b(sum_stage4[26]),  .cin(carry_stage4[23]), .sum(sum_stage5[14]), .carry(carry_stage5[14])); 
    Full_adder f058 (.a(sum_stage4[27]), .b(sum_stage4[28]),  .cin(carry_stage4[25]), .sum(sum_stage5[15]), .carry(carry_stage5[15])); 
    Full_adder f059 (.a(sum_stage4[29]), .b(sum_stage4[30]),  .cin(carry_stage4[27]), .sum(sum_stage5[16]), .carry(carry_stage5[16])); 
    Full_adder f060 (.a(sum_stage4[31]), .b(sum_stage4[32]),  .cin(carry_stage4[29]), .sum(sum_stage5[17]), .carry(carry_stage5[17])); 
    Full_adder f061 (.a(sum_stage4[33]), .b(sum_stage4[34]),  .cin(carry_stage4[31]), .sum(sum_stage5[18]), .carry(carry_stage5[18])); 
    Full_adder f062 (.a(sum_stage4[35]), .b(sum_stage4[36]),  .cin(carry_stage4[33]), .sum(sum_stage5[19]), .carry(carry_stage5[19])); 
    Full_adder f063 (.a(sum_stage4[37]), .b(sum_stage4[38]),  .cin(carry_stage4[35]), .sum(sum_stage5[20]), .carry(carry_stage5[20])); 
    Full_adder f064 (.a(sum_stage4[39]), .b(sum_stage4[40]),  .cin(carry_stage4[37]), .sum(sum_stage5[21]), .carry(carry_stage5[21])); 
    Full_adder f065 (.a(sum_stage4[41]), .b(sum_stage4[42]),  .cin(carry_stage4[39]), .sum(sum_stage5[22]), .carry(carry_stage5[22])); 
    Full_adder f066 (.a(sum_stage4[43]), .b(sum_stage4[44]),  .cin(carry_stage4[41]), .sum(sum_stage5[23]), .carry(carry_stage5[23])); 
    Full_adder f067 (.a(prod_matrix[12][15]), .b(sum_stage4[45]),  .cin(carry_stage4[43]), .sum(sum_stage5[24]), .carry(carry_stage5[24])); 
    Full_adder f068 (.a(prod_matrix[15][13]), .b(prod_matrix[14][14]),  .cin(prod_matrix[13][15]), .sum(sum_stage5[25]), .carry(carry_stage5[25]));
    
    //6th stage of dadda multiplex reduction 
    Half_adder h15 (.a(prod_matrix[2][0]), .b(prod_matrix[1][1]), .sum(sum_stage6[0]), .carry(carry_stage6[0]));
    Full_adder f069 (.a(prod_matrix[1][2]), .b(prod_matrix[0][3]),  .cin(sum_stage5[0]), .sum(sum_stage6[1]), .carry(carry_stage6[1]));
    Full_adder f070 (.a(sum_stage4[0]), .b(sum_stage5[1]),  .cin(carry_stage5[0]), .sum(sum_stage6[2]), .carry(carry_stage6[2]));
    Full_adder f071 (.a(carry_stage4[0]), .b(sum_stage5[2]),  .cin(carry_stage5[1]), .sum(sum_stage6[3]), .carry(carry_stage6[3]));
    Full_adder f072 (.a(carry_stage4[2]), .b(sum_stage5[3]),  .cin(carry_stage5[2]), .sum(sum_stage6[4]), .carry(carry_stage6[4]));
    Full_adder f073 (.a(carry_stage4[4]), .b(sum_stage5[4]),  .cin(carry_stage5[3]), .sum(sum_stage6[5]), .carry(carry_stage6[5]));
    Full_adder f074 (.a(carry_stage4[6]), .b(sum_stage5[5]),  .cin(carry_stage5[4]), .sum(sum_stage6[6]), .carry(carry_stage6[6]));
    Full_adder f075 (.a(carry_stage4[8]), .b(sum_stage5[6]),  .cin(carry_stage5[5]), .sum(sum_stage6[7]), .carry(carry_stage6[7]));
    Full_adder f076 (.a(carry_stage4[10]), .b(sum_stage5[7]),  .cin(carry_stage5[6]), .sum(sum_stage6[8]), .carry(carry_stage6[8]));
    Full_adder f077 (.a(carry_stage4[12]), .b(sum_stage5[8]),  .cin(carry_stage5[7]), .sum(sum_stage6[9]), .carry(carry_stage6[9]));
    Full_adder f078 (.a(carry_stage4[14]), .b(sum_stage5[9]),  .cin(carry_stage5[8]), .sum(sum_stage6[10]), .carry(carry_stage6[10]));
    Full_adder f079 (.a(carry_stage4[16]), .b(sum_stage5[10]),  .cin(carry_stage5[9]), .sum(sum_stage6[11]), .carry(carry_stage6[11]));
    Full_adder f080 (.a(carry_stage4[18]), .b(sum_stage5[11]),  .cin(carry_stage5[10]), .sum(sum_stage6[12]), .carry(carry_stage6[12]));
    Full_adder f081 (.a(carry_stage4[20]), .b(sum_stage5[12]),  .cin(carry_stage5[11]), .sum(sum_stage6[13]), .carry(carry_stage6[13]));
    Full_adder f082 (.a(carry_stage4[22]), .b(sum_stage5[13]),  .cin(carry_stage5[12]), .sum(sum_stage6[14]), .carry(carry_stage6[14]));
    Full_adder f083 (.a(carry_stage4[24]), .b(sum_stage5[14]),  .cin(carry_stage5[13]), .sum(sum_stage6[15]), .carry(carry_stage6[15]));
    Full_adder f084 (.a(carry_stage4[26]), .b(sum_stage5[15]),  .cin(carry_stage5[14]), .sum(sum_stage6[16]), .carry(carry_stage6[16]));
    Full_adder f085 (.a(carry_stage4[28]), .b(sum_stage5[16]),  .cin(carry_stage5[15]), .sum(sum_stage6[17]), .carry(carry_stage6[17]));
    Full_adder f086 (.a(carry_stage4[30]), .b(sum_stage5[17]),  .cin(carry_stage5[16]), .sum(sum_stage6[18]), .carry(carry_stage6[18]));
    Full_adder f087 (.a(carry_stage4[32]), .b(sum_stage5[18]),  .cin(carry_stage5[17]), .sum(sum_stage6[19]), .carry(carry_stage6[19]));
    Full_adder f088 (.a(carry_stage4[34]), .b(sum_stage5[19]),  .cin(carry_stage5[18]), .sum(sum_stage6[20]), .carry(carry_stage6[20]));
    Full_adder f089 (.a(carry_stage4[36]), .b(sum_stage5[20]),  .cin(carry_stage5[19]), .sum(sum_stage6[21]), .carry(carry_stage6[21]));
    Full_adder f090 (.a(carry_stage4[38]), .b(sum_stage5[21]),  .cin(carry_stage5[20]), .sum(sum_stage6[22]), .carry(carry_stage6[22]));
    Full_adder f091 (.a(carry_stage4[40]), .b(sum_stage5[22]),  .cin(carry_stage5[21]), .sum(sum_stage6[23]), .carry(carry_stage6[23]));
    Full_adder f092 (.a(carry_stage4[42]), .b(sum_stage5[23]),  .cin(carry_stage5[22]), .sum(sum_stage6[24]), .carry(carry_stage6[24]));
    Full_adder f093 (.a(carry_stage4[44]), .b(sum_stage5[24]),  .cin(carry_stage5[23]), .sum(sum_stage6[25]), .carry(carry_stage6[25]));
    Full_adder f094 (.a(carry_stage4[45]), .b(sum_stage5[25]),  .cin(carry_stage5[24]), .sum(sum_stage6[26]), .carry(carry_stage6[26]));
    Full_adder f095 (.a(prod_matrix[15][14]), .b(prod_matrix[14][15]),  .cin(carry_stage5[25]), .sum(sum_stage6[27]), .carry(carry_stage6[27]));
    
    wire [31:0] product; 
    wire product_out;
    assign final_sum1= ({1'b0,prod_matrix[15][15], sum_stage6[27:0],prod_matrix[1][0],prod_matrix[0][0]});
    assign final_sum2= ( {1'b0,carry_stage6[27:0],prod_matrix[0][2],prod_matrix[0][1],1'b0});
      
    BK_Adder_32 final_sum ( .a(final_sum1), .b(final_sum2), .cin(1'b0), .sum(product), .cout(product_out) );
    assign Dadda_out=product;
    
endmodule

module Half_adder(
    input a,
    input b,  
    output sum,
    output carry 
);
    assign sum = a^b;   
    assign carry = a&b;
endmodule

module Full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output carry
 );
    assign sum = a^b^cin;
    assign carry = (a & b) | (b & cin) | (cin & a);
endmodule

module Left_Right_shifter(
    input [31:0] A,       
    input [4:0] n,  
    input shift_direction,     
    output [31:0] Left_Right_shifter_out      
);

    reg [31:0] reversed_input;   
    reg [31:0] ls_out=0; 
    wire [31:0] shift_1, shift_2, shift_4, shift_8, shift_16; 
    wire [31:0] rs_out; 
    integer i, j;                  

    //left shifting 
    always @(*) begin
        if (shift_direction) begin
            for (i = 0; i < 32; i = i + 1) begin
                reversed_input[i] = A[31 - i];
            end
        end else begin
            reversed_input = A;
        end
    end

    // Perform shifting by 1 bit if n[0] is set
    mux2to1 shift_by_1 (
        .mux_in_A({1'b0, reversed_input[31:1]}),  
        .mux_in_B(reversed_input),               
        .sel(n[0]),           
        .mux_out(shift_1)                        
    );

    // Perform shifting by 2 bits if n[1] is set
    mux2to1 shift_by_2 (
        .mux_in_A({2'b00, shift_1[31:2]}),        
        .mux_in_B(shift_1),                      
        .sel(n[1]),           
        .mux_out(shift_2)                        
    );

    // Perform shifting by 4 bits if n[2] is set
    mux2to1 shift_by_4 (
        .mux_in_A({4'b0000, shift_2[31:4]}),
        .mux_in_B(shift_2),                
        .sel(n[2]),                       
        .mux_out(shift_4)                  
    );
    
    //perform shifting by 8 bits if n[3]
    mux2to1 shift_by_8(
        .mux_in_A({8'b00000000, shift_4[31:8]}),
        .mux_in_B(shift_4),
        .sel(n[3]),
        .mux_out(shift_8)
    );
    
    mux2to1 shift_by_16(
        .mux_in_A({16'b0000000000000000, shift_8[31:16]}),
        .mux_in_B(shift_8),
        .sel(n[4]),
        .mux_out(shift_16)
    );
    
    
    // right shift output
    assign rs_out = shift_16; 

    // Reverse the right shift output for left shift
   always @(*) begin
        if (shift_direction) begin
            for (j = 0; j < 32; j = j + 1) begin
                ls_out[j] <= shift_16[31 - j];
            end
        end else begin
            ls_out = 32'b0;
           end
   end

    // Final selection between left shifte and right shifte results
    mux2to1 final_output_mux (
        .mux_in_A(ls_out),           
        .mux_in_B(rs_out),           
        .sel(shift_direction),       
        .mux_out(Left_Right_shifter_out)
    );
endmodule

// implemented  Multiplexer
module mux2to1 (
    input wire [31:0] mux_in_A,          
    input wire [31:0] mux_in_B,          
    input wire sel,              
    output wire [31:0] mux_out          
    );
    wire not_sel;                
    wire [31:0] and_out_A, and_out_B;   

    // Generate the complement of the selection signal
    not (not_sel, sel);

    // Generate AND gates for each input
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : and_logic
            and (and_out_A[i], mux_in_A[i], sel);         
            and (and_out_B[i], mux_in_B[i], not_sel);     
        end
    endgenerate

    // Generateing the OR gates to combine results from AND gates
    generate
        for (i = 0; i < 32; i = i + 1) begin : or_logic
            or (mux_out[i], and_out_A[i], and_out_B[i]);   
        end
    endgenerate

endmodule

module MUL_using_Dadda(
    input [31:0] A,
    input [31:0] B, 
    output [31:0] Y
    );
    
    Dadda multiply(
        .A(A),
        .B(B),
        .Dadda_out(Y)
    );
endmodule

module Signed_compar (
    input [31:0] A,  
    input [31:0] B,  
    output [31:0] Y  
);

    reg [31:0] result;
    always @(*) begin
        if ($signed(A) < $signed(B)) begin
            result = 32'd1;  
        end else begin
            result = 32'd0; 
        end
    end

    assign Y = result; 
endmodule

module Unsigned_compar (
    input [31:0] A,  
    input [31:0] B,  
    output [31:0] Y  
);
    reg [31:0] result;

    always @(*) begin
        if (A < B) begin
            result = 32'd1; 
        end else begin
            result = 32'd0; 
        end
    end

    assign Y = result;  
endmodule


