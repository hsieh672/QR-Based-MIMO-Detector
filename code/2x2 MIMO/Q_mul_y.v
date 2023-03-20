`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/06 19:53:19
// Design Name: 
// Module Name: Q_mul_y
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


module Q_mul_y(
    input signed [27:0] y_real_1,
    input signed [27:0] y_imag_1,
    input signed [27:0] y_real_2,
    input signed [27:0] y_imag_2,
    input signed [27:0] Q_real_1,
    input signed [27:0] Q_imag_1,
    input signed [27:0] Q_real_2,
    input signed [27:0] Q_imag_2,
    output signed [27:0] y_qr_real,
    output signed [27:0] y_qr_imag
    );
    
    wire signed [55:0] index_1_real;
    wire signed [55:0] index_1_imag;
    wire signed [55:0] index_2_real;
    wire signed [55:0] index_2_imag;
    
    complex_multiply cmq1(y_real_1,y_imag_1,Q_real_1,Q_imag_1,index_1_real,index_1_imag);
    complex_multiply cmq2(y_real_2,y_imag_2,Q_real_2,Q_imag_2,index_2_real,index_2_imag);
    
    assign y_qr_real = index_1_real + index_2_real;
    assign y_qr_imag = index_1_imag + index_2_imag;
endmodule
