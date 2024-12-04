module comb_mult(a,b,o);
    input [3:0] a,b;
    output [7:0] o;
    wire [7:0] m0, m1, m2, m3;
    wire [7:0] s1,s2,s3;

    assign m0 = b[0] ? {4'b0, a} : 8'b0;
    assign m1 = b[1] ? {3'b0, a, 1'b0} : 8'b0;
    assign m2 = b[2] ? {2'b0, a, 2'b0} : 8'b0;
    assign m3 = b[3] ? {1'b0, a, 3'b0} : 8'b0;

    assign s1 = m0 + m1;
    assign s2 = s1 + m2;
    assign s3 = s2 + m3;
    assign o = s3;
endmodule
