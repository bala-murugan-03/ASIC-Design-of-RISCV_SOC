`timescale 1ns / 1ps

module barrel_shifter(
    input [7:0] x,
    input [2:0] shiftamt,
    input right,
    output wire [7:0] z
);
    wire [7:0] p, q, y, z1, z2;
    wire [2:0] n;
    wire [2:0] twosshiftamt;
    // Compute two's complement of the shift amount for left shift
    assign twosshiftamt = ~(shiftamt) + 1'b1;

    mux mux_n0 (.a(twosshiftamt[0]), .b(shiftamt[0]), .sel(right), .y(n[0]));
    mux mux_n1 (.a(twosshiftamt[1]), .b(shiftamt[1]), .sel(right), .y(n[1]));
    mux mux_n2 (.a(twosshiftamt[2]), .b(shiftamt[2]), .sel(right), .y(n[2]));

    // Level 1
    mux mux_p0 (.a(x[0]), .b(x[4]), .sel(n[2]), .y(p[0]));
    mux mux_p1 (.a(x[1]), .b(x[5]), .sel(n[2]), .y(p[1]));
    mux mux_p2 (.a(x[2]), .b(x[6]), .sel(n[2]), .y(p[2]));
    mux mux_p3 (.a(x[3]), .b(x[7]), .sel(n[2]), .y(p[3]));
    mux mux_p4 (.a(x[4]), .b(x[0]), .sel(n[2]), .y(p[4]));
    mux mux_p5 (.a(x[5]), .b(x[1]), .sel(n[2]), .y(p[5]));
    mux mux_p6 (.a(x[6]), .b(x[2]), .sel(n[2]), .y(p[6]));
    mux mux_p7 (.a(x[7]), .b(x[3]), .sel(n[2]), .y(p[7]));

    // Level 2
    mux mux_q0 (.a(p[0]), .b(p[2]), .sel(n[1]), .y(q[0]));
    mux mux_q1 (.a(p[1]), .b(p[3]), .sel(n[1]), .y(q[1]));
    mux mux_q2 (.a(p[2]), .b(p[4]), .sel(n[1]), .y(q[2]));
    mux mux_q3 (.a(p[3]), .b(p[5]), .sel(n[1]), .y(q[3]));
    mux mux_q4 (.a(p[4]), .b(p[6]), .sel(n[1]), .y(q[4]));
    mux mux_q5 (.a(p[5]), .b(p[7]), .sel(n[1]), .y(q[5]));
    mux mux_q6 (.a(p[6]), .b(p[0]), .sel(n[1]), .y(q[6]));
    mux mux_q7 (.a(p[7]), .b(p[1]), .sel(n[1]), .y(q[7]));

    // Level 3
    mux mux_y0 (.a(q[0]), .b(q[1]), .sel(n[0]), .y(y[0]));
    mux mux_y1 (.a(q[1]), .b(q[2]), .sel(n[0]), .y(y[1]));
    mux mux_y2 (.a(q[2]), .b(q[3]), .sel(n[0]), .y(y[2]));
    mux mux_y3 (.a(q[3]), .b(q[4]), .sel(n[0]), .y(y[3]));
    mux mux_y4 (.a(q[4]), .b(q[5]), .sel(n[0]), .y(y[4]));
    mux mux_y5 (.a(q[5]), .b(q[6]), .sel(n[0]), .y(y[5]));
    mux mux_y6 (.a(q[6]), .b(q[7]), .sel(n[0]), .y(y[6]));
    mux mux_y7 (.a(q[7]), .b(q[0]), .sel(n[0]), .y(y[7]));

    // Masking for left and right shifts
    maskleft mask_left (.shiftamt(shiftamt), .y(y), .z(z1));
    maskright mask_right (.shiftamt(shiftamt), .y(y), .z(z2));

    // Select the final result based on the shift direction
    mux mux_z0 (.a(z2[0]), .b(z1[0]), .sel(right), .y(z[0]));
    mux mux_z1 (.a(z2[1]), .b(z1[1]), .sel(right), .y(z[1]));
    mux mux_z2 (.a(z2[2]), .b(z1[2]), .sel(right), .y(z[2]));
    mux mux_z3 (.a(z2[3]), .b(z1[3]), .sel(right), .y(z[3]));
    mux mux_z4 (.a(z2[4]), .b(z1[4]), .sel(right), .y(z[4]));
    mux mux_z5 (.a(z2[5]), .b(z1[5]), .sel(right), .y(z[5]));
    mux mux_z6 (.a(z2[6]), .b(z1[6]), .sel(right), .y(z[6]));
    mux mux_z7 (.a(z2[7]), .b(z1[7]), .sel(right), .y(z[7]));
endmodule


module maskleft(
input [2:0] shiftamt,
input [7:0] y,
output [7:0] z
);
wire [7:0]t;
wire [7:0]n;
assign n = shiftamt;
assign t[0] = 1'b1;
assign t[1] = ~(n[0] & n[1] & n[2]);
assign t[2] = ~(n[2] &  n[1]);
assign t[3] = ~(n[2] & (n[0] | n[1]));
assign t[4] = ~(n[2]);
assign t[5] = ~(n[2] | (n[1] & n[0]));
assign t[6] = ~(n[2] | n[1]);
assign t[7] = ~(n[2] | n[1] | n[3]);
assign z = y & t;
endmodule

module maskright(
input [2:0] shiftamt,
input [7:0] y,
output [7:0] z
);
wire [7:0]t;
wire [7:0]n;
assign n = shiftamt;
assign t[0] = ~(n[2] | n[1] | n[3]);
assign t[1] = ~(n[2] | n[1]);
assign t[2] = ~(n[2] | (n[1] & n[0]));
assign t[3] = ~(n[2]);
assign t[4] = ~(n[2] & (n[0] | n[1]));
assign t[5] = ~(n[2] &  n[1]);
assign t[6] = ~(n[0] & n[1] & n[2]);
assign t[7] = 1'b1;
assign z = y & t;
endmodule

module mux(
input a,
input b,
input sel,
output y
);
assign y = ((~sel)&a)|(sel&b);
endmodule