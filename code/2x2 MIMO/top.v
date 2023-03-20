`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/03 16:44:50
// Design Name: 
// Module Name: top
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


module top(
    input clk,rst,
    input signed [27:0] y_real_1,
    input signed [27:0] y_imag_1,
    input signed [27:0] y_real_2,
    input signed [27:0] y_imag_2,
    input signed [27:0] H11_real,
    input signed [27:0] H11_imag,
    input signed [27:0] H12_real,
    input signed [27:0] H12_imag,
    input signed [27:0] H21_real,
    input signed [27:0] H21_imag,
    input signed [27:0] H22_real,
    input signed [27:0] H22_imag,
    output signed [2:0] demod_1,
    output signed [2:0] demod_2
    );
    wire signed [27:0] x_real_1;
    wire signed [27:0] x_imag_1;
    wire signed [27:0] x_real_2;
    wire signed [27:0] x_imag_2;
    
    wire signed [55:0] x_real_1_sf;
    wire signed [55:0] x_imag_1_sf;
    wire signed [55:0] x_real_2_sf;
    wire signed [55:0] x_imag_2_sf;
    
    wire signed [55:0] x_real_1_55;
    wire signed [55:0] x_imag_1_55;
    wire signed [55:0] x_real_2_55;
    wire signed [55:0] x_imag_2_55;
    
    wire signed [27:0] y_qr_real_1;
    wire signed [27:0] y_qr_imag_1;
    wire signed [27:0] y_qr_real_2;
    wire signed [27:0] y_qr_imag_2;
    
    wire signed [27:0] Q11_real;
    wire signed [27:0] Q11_imag;
    wire signed [27:0] Q12_real;
    wire signed [27:0] Q12_imag;
    wire signed [27:0] Q21_real;
    wire signed [27:0] Q21_imag;
    wire signed [27:0] Q22_real;
    wire signed [27:0] Q22_imag;
    
    wire signed [27:0] R11_real;
    wire signed [27:0] R11_imag;
    wire signed [27:0] R12_real;
    wire signed [27:0] R12_imag;
    wire signed [27:0] R21_real;
    wire signed [27:0] R21_imag;
    wire signed [27:0] R22_real;
    wire signed [27:0] R22_imag;
    
    wire signed [55:0] R34_mul_x4_real;
    wire signed [55:0] R34_mul_x4_imag;
    wire signed [27:0] eq2_minus_real;
    wire signed [27:0] eq2_minus_imag;
    
    wire signed [55:0] R23_mul_x3_real;
    wire signed [55:0] R23_mul_x3_imag;
    wire signed [55:0] R24_mul_x4_real;
    wire signed [55:0] R24_mul_x4_imag;
    wire signed [27:0] eq3_minus_real;
    wire signed [27:0] eq3_minus_imag;
    
    wire signed [55:0] R12_mul_x2_real;
    wire signed [55:0] R12_mul_x2_imag;
    wire signed [55:0] R13_mul_x3_real;
    wire signed [55:0] R13_mul_x3_imag;
    wire signed [55:0] R14_mul_x4_real;
    wire signed [55:0] R14_mul_x4_imag;
    wire signed [27:0] eq4_minus_real;
    wire signed [27:0] eq4_minus_imag;
    
    wire signed [27:0] conj_Q11_imag;
    wire signed [27:0] conj_Q12_imag;
    wire signed [27:0] conj_Q21_imag;
    wire signed [27:0] conj_Q22_imag;
    
    multi mult1(Q11_imag,-28'd1,conj_Q11_imag);
    multi mult2(Q12_imag,-28'd1,conj_Q12_imag);
    multi mult3(Q21_imag,-28'd1,conj_Q21_imag);
    multi mult4(Q22_imag,-28'd1,conj_Q22_imag);
    
    QR qr(H11_real,H11_imag,H12_real,H12_imag,
          H21_real,H21_imag,H22_real,H22_imag,
          Q11_real,Q11_imag,Q12_real,Q12_imag,
          Q21_real,Q21_imag,Q22_real,Q22_imag,
          R11_real,R11_imag,R12_real,R12_imag,
          R21_real,R21_imag,R22_real,R22_imag);
    
    Q_mul_y qy1(y_real_1,y_imag_1,y_real_2,y_imag_2,Q11_real,conj_Q11_imag,Q21_real,conj_Q21_imag,y_qr_real_1,y_qr_imag_1);
    Q_mul_y qy2(y_real_1,y_imag_1,y_real_2,y_imag_2,Q12_real,conj_Q12_imag,Q22_real,conj_Q22_imag,y_qr_real_2,y_qr_imag_2);
    
    complex_division cd1(y_qr_real_2,y_qr_imag_2,R22_real,R22_imag,x_real_2_55,x_imag_2_55);
    
    assign x_real_2 = x_real_2_55[27:0];
    assign x_imag_2 = x_imag_2_55[27:0];
    
    
    complex_multiply cm1(R12_real,R12_imag,x_real_2,x_imag_2,R12_mul_x2_real,R12_mul_x2_imag);
    assign eq2_minus_real = y_qr_real_1 - R12_mul_x2_real;
    assign eq2_minus_imag = y_qr_imag_1 - R12_mul_x2_imag;
    complex_division cd2(eq2_minus_real,eq2_minus_imag,R11_real,R11_imag,x_real_1_55,x_imag_1_55);
    
    assign x_real_1 = x_real_1_55[27:0];
    assign x_imag_1 = x_imag_1_55[27:0];
    
    complex_division cdx1(x_real_1,x_imag_1,28'd256,28'd0,x_real_1_sf,x_imag_1_sf);
    complex_division cdx2(x_real_2,x_imag_2,28'd256,28'd0,x_real_2_sf,x_imag_2_sf);
    
    de_mod dm(x_real_1_sf,x_imag_1_sf,x_real_2_sf,x_imag_2_sf,
              demod_1,demod_2);
    
endmodule
