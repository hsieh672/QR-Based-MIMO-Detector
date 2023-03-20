`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/16 16:03:01
// Design Name: 
// Module Name: cal_v
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cal_v(
    input signed [27:0] R_real,
    input signed [27:0] R_imag,
    input signed [27:0] Q1_real,
    input signed [27:0] Q1_imag,
    input signed [27:0] Q2_real,
    input signed [27:0] Q2_imag,
    input signed [27:0] Q3_real,
    input signed [27:0] Q3_imag,
    input signed [27:0] Q4_real,
    input signed [27:0] Q4_imag,
    input signed [27:0] H1_real,
    input signed [27:0] H1_imag,
    input signed [27:0] H2_real,
    input signed [27:0] H2_imag,
    input signed [27:0] H3_real,
    input signed [27:0] H3_imag,
    input signed [27:0] H4_real,
    input signed [27:0] H4_imag,
    output signed [27:0] v1_real,
    output signed [27:0] v1_imag,
    output signed [27:0] v2_real,
    output signed [27:0] v2_imag,
    output signed [27:0] v3_real,
    output signed [27:0] v3_imag,
    output signed [27:0] v4_real,
    output signed [27:0] v4_imag
    );
    
    wire signed [55:0] mul1_real;
    wire signed [55:0] mul1_imag;
    wire signed [55:0] mul2_real;
    wire signed [55:0] mul2_imag;
    wire signed [55:0] mul3_real;
    wire signed [55:0] mul3_imag;
    wire signed [55:0] mul4_real;
    wire signed [55:0] mul4_imag;
    
    wire signed [55:0] div1_real;
    wire signed [55:0] div1_imag;
    wire signed [55:0] div2_real;
    wire signed [55:0] div2_imag;
    wire signed [55:0] div3_real;
    wire signed [55:0] div3_imag;
    wire signed [55:0] div4_real;
    wire signed [55:0] div4_imag;
    
    complex_multiply cmv1(R_real,R_imag,Q1_real,Q1_imag,mul1_real,mul1_imag);
    complex_multiply cmv2(R_real,R_imag,Q2_real,Q2_imag,mul2_real,mul2_imag);
    complex_multiply cmv3(R_real,R_imag,Q3_real,Q3_imag,mul3_real,mul3_imag);
    complex_multiply cmv4(R_real,R_imag,Q4_real,Q4_imag,mul4_real,mul4_imag);
    
    complex_division cdv1(mul1_real,mul1_imag,28'd1000,28'd0,div1_real,div1_imag);
    complex_division cdv2(mul2_real,mul2_imag,28'd1000,28'd0,div2_real,div2_imag);
    complex_division cdv3(mul3_real,mul3_imag,28'd1000,28'd0,div3_real,div3_imag);
    complex_division cdv4(mul4_real,mul4_imag,28'd1000,28'd0,div4_real,div4_imag);
    
    assign v1_real = H1_real - div1_real;
    assign v1_imag = H1_imag - div1_imag;
    assign v2_real = H2_real - div2_real;
    assign v2_imag = H2_imag - div2_imag;
    assign v3_real = H3_real - div3_real;
    assign v3_imag = H3_imag - div3_imag;
    assign v4_real = H4_real - div4_real;
    assign v4_imag = H4_imag - div4_imag;
    
endmodule
