`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/15 15:05:31
// Design Name: 
// Module Name: norm
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


module norm(
    input signed [27:0] real_1,
    input signed [27:0] imag_1,
    input signed [27:0] real_2,
    input signed [27:0] imag_2,
    input signed [27:0] real_3,
    input signed [27:0] imag_3,
    input signed [27:0] real_4,
    input signed [27:0] imag_4,
    output signed [55:0] out
    );
    
    wire signed [55:0] square_real_1;
    wire signed [55:0] square_imag_1;
    wire signed [55:0] square_real_2;
    wire signed [55:0] square_imag_2;
    wire signed [55:0] square_real_3;
    wire signed [55:0] square_imag_3;
    wire signed [55:0] square_real_4;
    wire signed [55:0] square_imag_4;
    wire signed [27:0] square_addition;
    wire signed [55:0] square_addition_mul;
    
    multi m1(real_1,real_1,square_real_1);
    multi m2(imag_1,imag_1,square_imag_1);
    multi m3(real_2,real_2,square_real_2);
    multi m4(imag_2,imag_2,square_imag_2);
    multi m5(real_3,real_3,square_real_3);
    multi m6(imag_3,imag_3,square_imag_3);
    multi m7(real_4,real_4,square_real_4);
    multi m8(imag_4,imag_4,square_imag_4);
    
    assign square_addition = square_imag_1 + square_imag_2 + square_imag_3 + square_imag_4 +
                             square_real_1 + square_real_2 + square_real_3 + square_real_4;
                             
                             
    multi m9(square_addition,28'd100000000,square_addition_mul);                         
    sqrt sq(square_addition_mul,out);
    
    
endmodule
