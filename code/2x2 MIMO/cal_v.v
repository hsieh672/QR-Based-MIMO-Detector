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
    input signed [27:0] H1_real,
    input signed [27:0] H1_imag,
    input signed [27:0] H2_real,
    input signed [27:0] H2_imag,
    output signed [27:0] v1_real,
    output signed [27:0] v1_imag,
    output signed [27:0] v2_real,
    output signed [27:0] v2_imag
    );
    
    wire signed [55:0] mul1_real;
    wire signed [55:0] mul1_imag;
    wire signed [55:0] mul2_real;
    wire signed [55:0] mul2_imag;
    
    wire signed [55:0] div1_real;
    wire signed [55:0] div1_imag;
    wire signed [55:0] div2_real;
    wire signed [55:0] div2_imag;

    complex_multiply cmv1(R_real,R_imag,Q1_real,Q1_imag,mul1_real,mul1_imag);
    complex_multiply cmv2(R_real,R_imag,Q2_real,Q2_imag,mul2_real,mul2_imag);
    
    complex_division cdv1(mul1_real,mul1_imag,28'd1000,28'd0,div1_real,div1_imag);
    complex_division cdv2(mul2_real,mul2_imag,28'd1000,28'd0,div2_real,div2_imag);
    
    assign v1_real = H1_real - div1_real;
    assign v1_imag = H1_imag - div1_imag;
    assign v2_real = H2_real - div2_real;
    assign v2_imag = H2_imag - div2_imag;
    
endmodule
