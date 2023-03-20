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
    output signed [55:0] out
    );
    
    wire signed [55:0] square_real_1;
    wire signed [55:0] square_imag_1;
    wire signed [55:0] square_real_2;
    wire signed [55:0] square_imag_2;
    wire signed [27:0] square_addition;
    wire signed [55:0] square_addition_mul;
    
    multi m1(real_1,real_1,square_real_1);
    multi m2(imag_1,imag_1,square_imag_1);
    multi m3(real_2,real_2,square_real_2);
    multi m4(imag_2,imag_2,square_imag_2);
    
    assign square_addition = square_imag_1 + square_imag_2+
                             square_real_1 + square_real_2;
                             
                             
    multi m9(square_addition,28'd100000000,square_addition_mul);                         
    sqrt sq(square_addition_mul,out);
    
    
endmodule
