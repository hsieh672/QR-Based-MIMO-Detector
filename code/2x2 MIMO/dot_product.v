`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/16 15:46:19
// Design Name: 
// Module Name: dot_product
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


module dot_product(
    input signed [27:0] real_1,
    input signed [27:0] imag_1,
    input signed [27:0] real_2,
    input signed [27:0] imag_2,
    input signed [27:0] real_1_2,
    input signed [27:0] imag_1_2,
    input signed [27:0] real_2_2,
    input signed [27:0] imag_2_2,
    output signed [55:0] out_real,
    output signed [55:0] out_imag
    );
    
    wire signed [55:0] square_real_1;
    wire signed [55:0] square_imag_1;
    wire signed [55:0] square_real_2;
    wire signed [55:0] square_imag_2;
    
    complex_multiply cmm1(real_1,imag_1,real_1_2,imag_1_2,square_real_1,square_imag_1);
    complex_multiply cmm2(real_2,imag_2,real_2_2,imag_2_2,square_real_2,square_imag_2);
    
    assign out_real = square_real_1 + square_real_2;
    assign out_imag = square_imag_1 + square_imag_2;
endmodule
