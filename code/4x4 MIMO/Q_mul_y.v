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
    input signed [27:0] y_real_3,
    input signed [27:0] y_imag_3,
    input signed [27:0] y_real_4,
    input signed [27:0] y_imag_4,
    input signed [27:0] Q_real_1,
    input signed [27:0] Q_imag_1,
    input signed [27:0] Q_real_2,
    input signed [27:0] Q_imag_2,
    input signed [27:0] Q_real_3,
    input signed [27:0] Q_imag_3,
    input signed [27:0] Q_real_4,
    input signed [27:0] Q_imag_4,
    output signed [27:0] y_qr_real,
    output signed [27:0] y_qr_imag
    );
    
    wire signed [55:0] index_1_real;
    wire signed [55:0] index_1_imag;
    wire signed [55:0] index_2_real;
    wire signed [55:0] index_2_imag;
    wire signed [55:0] index_3_real;
    wire signed [55:0] index_3_imag;
    wire signed [55:0] index_4_real;
    wire signed [55:0] index_4_imag;
    
    complex_multiply cmq1(y_real_1,y_imag_1,Q_real_1,Q_imag_1,index_1_real,index_1_imag);
    complex_multiply cmq2(y_real_2,y_imag_2,Q_real_2,Q_imag_2,index_2_real,index_2_imag);
    complex_multiply cmq3(y_real_3,y_imag_3,Q_real_3,Q_imag_3,index_3_real,index_3_imag);
    complex_multiply cmq4(y_real_4,y_imag_4,Q_real_4,Q_imag_4,index_4_real,index_4_imag);
    
    assign y_qr_real = index_1_real + index_2_real + index_3_real + index_4_real;
    assign y_qr_imag = index_1_imag + index_2_imag + index_3_imag + index_4_imag;
endmodule
