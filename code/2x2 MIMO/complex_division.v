`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/02 22:24:20
// Design Name: 
// Module Name: complex_division
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


module complex_division(
    input signed [27:0] real_a,
    input signed [27:0] imag_a,
    input signed [27:0] real_b,
    input signed [27:0] imag_b,
    output signed [55:0] real_out,
    output signed [55:0] imag_out
    );
    wire signed [55:0] real_numerator;
    wire signed [55:0] imag_numerator;
    wire signed [55:0] real_denominator;
    wire signed [55:0] imag_denominator;
    wire signed [55:0] neg_imag_b;
    
    multi multi5(imag_b,-28'd1,neg_imag_b);
    
    // a 為分子 b 為分母
    complex_multiply cm1(real_a,imag_a,real_b,neg_imag_b,real_numerator,imag_numerator);
    complex_multiply cm2(real_b,imag_b,real_b,neg_imag_b,real_denominator,imag_denominator);
    
    neg_div negd1(real_numerator,real_denominator,real_out);
    neg_div negd2(imag_numerator,real_denominator,imag_out);

endmodule
