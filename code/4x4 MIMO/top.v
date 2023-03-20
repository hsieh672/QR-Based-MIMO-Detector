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
    input signed [27:0] y_real_3,
    input signed [27:0] y_imag_3,
    input signed [27:0] y_real_4,
    input signed [27:0] y_imag_4,
    input signed [27:0] H11_real,
    input signed [27:0] H11_imag,
    input signed [27:0] H12_real,
    input signed [27:0] H12_imag,
    input signed [27:0] H13_real,
    input signed [27:0] H13_imag,
    input signed [27:0] H14_real,
    input signed [27:0] H14_imag,
    input signed [27:0] H21_real,
    input signed [27:0] H21_imag,
    input signed [27:0] H22_real,
    input signed [27:0] H22_imag,
    input signed [27:0] H23_real,
    input signed [27:0] H23_imag,
    input signed [27:0] H24_real,
    input signed [27:0] H24_imag,
    input signed [27:0] H31_real,
    input signed [27:0] H31_imag,
    input signed [27:0] H32_real,
    input signed [27:0] H32_imag,
    input signed [27:0] H33_real,
    input signed [27:0] H33_imag,
    input signed [27:0] H34_real,
    input signed [27:0] H34_imag,
    input signed [27:0] H41_real,
    input signed [27:0] H41_imag,
    input signed [27:0] H42_real,
    input signed [27:0] H42_imag,
    input signed [27:0] H43_real,
    input signed [27:0] H43_imag,
    input signed [27:0] H44_real,
    input signed [27:0] H44_imag,
    output signed [2:0] demod_1,
    output signed [2:0] demod_2,
    output signed [2:0] demod_3,
    output signed [2:0] demod_4
    );
    wire signed [27:0] x_real_1;
    wire signed [27:0] x_imag_1;
    wire signed [27:0] x_real_2;
    wire signed [27:0] x_imag_2;
    wire signed [27:0] x_real_3;
    wire signed [27:0] x_imag_3;
    wire signed [27:0] x_real_4;
    wire signed [27:0] x_imag_4;
    
    wire signed [55:0] x_real_1_sf;
    wire signed [55:0] x_imag_1_sf;
    wire signed [55:0] x_real_2_sf;
    wire signed [55:0] x_imag_2_sf;
    wire signed [55:0] x_real_3_sf;
    wire signed [55:0] x_imag_3_sf;
    wire signed [55:0] x_real_4_sf;
    wire signed [55:0] x_imag_4_sf;
    
    wire signed [55:0] x_real_1_55;
    wire signed [55:0] x_imag_1_55;
    wire signed [55:0] x_real_2_55;
    wire signed [55:0] x_imag_2_55;
    wire signed [55:0] x_real_3_55;
    wire signed [55:0] x_imag_3_55;
    wire signed [55:0] x_real_4_55;
    wire signed [55:0] x_imag_4_55;
    
    wire signed [27:0] y_qr_real_1;
    wire signed [27:0] y_qr_imag_1;
    wire signed [27:0] y_qr_real_2;
    wire signed [27:0] y_qr_imag_2;
    wire signed [27:0] y_qr_real_3;
    wire signed [27:0] y_qr_imag_3;
    wire signed [27:0] y_qr_real_4;
    wire signed [27:0] y_qr_imag_4;
    
    wire signed [27:0] Q11_real;
    wire signed [27:0] Q11_imag;
    wire signed [27:0] Q12_real;
    wire signed [27:0] Q12_imag;
    wire signed [27:0] Q13_real;
    wire signed [27:0] Q13_imag;
    wire signed [27:0] Q14_real;
    wire signed [27:0] Q14_imag;
    wire signed [27:0] Q21_real;
    wire signed [27:0] Q21_imag;
    wire signed [27:0] Q22_real;
    wire signed [27:0] Q22_imag;
    wire signed [27:0] Q23_real;
    wire signed [27:0] Q23_imag;
    wire signed [27:0] Q24_real;
    wire signed [27:0] Q24_imag;
    wire signed [27:0] Q31_real;
    wire signed [27:0] Q31_imag;
    wire signed [27:0] Q32_real;
    wire signed [27:0] Q32_imag;
    wire signed [27:0] Q33_real;
    wire signed [27:0] Q33_imag;
    wire signed [27:0] Q34_real;
    wire signed [27:0] Q34_imag;
    wire signed [27:0] Q41_real;
    wire signed [27:0] Q41_imag;
    wire signed [27:0] Q42_real;
    wire signed [27:0] Q42_imag;
    wire signed [27:0] Q43_real;
    wire signed [27:0] Q43_imag;
    wire signed [27:0] Q44_real;
    wire signed [27:0] Q44_imag;
    
    wire signed [27:0] R11_real;
    wire signed [27:0] R11_imag;
    wire signed [27:0] R12_real;
    wire signed [27:0] R12_imag;
    wire signed [27:0] R13_real;
    wire signed [27:0] R13_imag;
    wire signed [27:0] R14_real;
    wire signed [27:0] R14_imag;
    wire signed [27:0] R21_real;
    wire signed [27:0] R21_imag;
    wire signed [27:0] R22_real;
    wire signed [27:0] R22_imag;
    wire signed [27:0] R23_real;
    wire signed [27:0] R23_imag;
    wire signed [27:0] R24_real;
    wire signed [27:0] R24_imag;
    wire signed [27:0] R31_real;
    wire signed [27:0] R31_imag;
    wire signed [27:0] R32_real;
    wire signed [27:0] R32_imag;
    wire signed [27:0] R33_real;
    wire signed [27:0] R33_imag;
    wire signed [27:0] R34_real;
    wire signed [27:0] R34_imag;
    wire signed [27:0] R41_real;
    wire signed [27:0] R41_imag;
    wire signed [27:0] R42_real;
    wire signed [27:0] R42_imag;
    wire signed [27:0] R43_real;
    wire signed [27:0] R43_imag;
    wire signed [27:0] R44_real;
    wire signed [27:0] R44_imag;
    
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
    wire signed [27:0] conj_Q13_imag;
    wire signed [27:0] conj_Q14_imag;
    wire signed [27:0] conj_Q21_imag;
    wire signed [27:0] conj_Q22_imag;
    wire signed [27:0] conj_Q23_imag;
    wire signed [27:0] conj_Q24_imag;
    wire signed [27:0] conj_Q31_imag;
    wire signed [27:0] conj_Q32_imag;
    wire signed [27:0] conj_Q33_imag;
    wire signed [27:0] conj_Q34_imag;
    wire signed [27:0] conj_Q41_imag;
    wire signed [27:0] conj_Q42_imag;
    wire signed [27:0] conj_Q43_imag;
    wire signed [27:0] conj_Q44_imag;
    
    
    assign conj_Q11_imag = Q11_imag * -1'd1;
    assign conj_Q12_imag = Q12_imag * -1'd1;
    assign conj_Q13_imag = Q13_imag * -1'd1;
    assign conj_Q14_imag = Q14_imag * -1'd1;
    assign conj_Q21_imag = Q21_imag * -1'd1;
    assign conj_Q22_imag = Q22_imag * -1'd1;
    assign conj_Q23_imag = Q23_imag * -1'd1;
    assign conj_Q24_imag = Q24_imag * -1'd1;
    assign conj_Q31_imag = Q31_imag * -1'd1;
    assign conj_Q32_imag = Q32_imag * -1'd1;
    assign conj_Q33_imag = Q33_imag * -1'd1;
    assign conj_Q34_imag = Q34_imag * -1'd1;
    assign conj_Q41_imag = Q41_imag * -1'd1;
    assign conj_Q42_imag = Q42_imag * -1'd1;
    assign conj_Q43_imag = Q43_imag * -1'd1;
    assign conj_Q44_imag = Q44_imag * -1'd1;
    
    QR qr(H11_real,H11_imag,H12_real,H12_imag,H13_real,H13_imag,H14_real,H14_imag,
          H21_real,H21_imag,H22_real,H22_imag,H23_real,H23_imag,H24_real,H24_imag,
          H31_real,H31_imag,H32_real,H32_imag,H33_real,H33_imag,H34_real,H34_imag,
          H41_real,H41_imag,H42_real,H42_imag,H43_real,H43_imag,H44_real,H44_imag,
          Q11_real,Q11_imag,Q12_real,Q12_imag,Q13_real,Q13_imag,Q14_real,Q14_imag,
          Q21_real,Q21_imag,Q22_real,Q22_imag,Q23_real,Q23_imag,Q24_real,Q24_imag,
          Q31_real,Q31_imag,Q32_real,Q32_imag,Q33_real,Q33_imag,Q34_real,Q34_imag,
          Q41_real,Q41_imag,Q42_real,Q42_imag,Q43_real,Q43_imag,Q44_real,Q44_imag,
          R11_real,R11_imag,R12_real,R12_imag,R13_real,R13_imag,R14_real,R14_imag,
          R21_real,R21_imag,R22_real,R22_imag,R23_real,R23_imag,R24_real,R24_imag,
          R31_real,R31_imag,R32_real,R32_imag,R33_real,R33_imag,R34_real,R34_imag,
          R41_real,R41_imag,R42_real,R42_imag,R43_real,R43_imag,R44_real,R44_imag);
    
    Q_mul_y qy1(y_real_1,y_imag_1,y_real_2,y_imag_2,y_real_3,y_imag_3,y_real_4,y_imag_4,Q11_real,conj_Q11_imag,Q21_real,conj_Q21_imag,Q31_real,conj_Q31_imag,Q41_real,conj_Q41_imag,y_qr_real_1,y_qr_imag_1);
    Q_mul_y qy2(y_real_1,y_imag_1,y_real_2,y_imag_2,y_real_3,y_imag_3,y_real_4,y_imag_4,Q12_real,conj_Q12_imag,Q22_real,conj_Q22_imag,Q32_real,conj_Q32_imag,Q42_real,conj_Q42_imag,y_qr_real_2,y_qr_imag_2);
    Q_mul_y qy3(y_real_1,y_imag_1,y_real_2,y_imag_2,y_real_3,y_imag_3,y_real_4,y_imag_4,Q13_real,conj_Q13_imag,Q23_real,conj_Q23_imag,Q33_real,conj_Q33_imag,Q43_real,conj_Q43_imag,y_qr_real_3,y_qr_imag_3);
    Q_mul_y qy4(y_real_1,y_imag_1,y_real_2,y_imag_2,y_real_3,y_imag_3,y_real_4,y_imag_4,Q14_real,conj_Q14_imag,Q24_real,conj_Q24_imag,Q34_real,conj_Q34_imag,Q44_real,conj_Q44_imag,y_qr_real_4,y_qr_imag_4);
     
    complex_division cd1(y_qr_real_4,y_qr_imag_4,R44_real,R44_imag,x_real_4_55,x_imag_4_55);
    
    assign x_real_4 = x_real_4_55[27:0];
    assign x_imag_4 = x_imag_4_55[27:0];
    
    
    complex_multiply cm1(R34_real,R34_imag,x_real_4,x_imag_4,R34_mul_x4_real,R34_mul_x4_imag);
    assign eq2_minus_real = y_qr_real_3 - R34_mul_x4_real;
    assign eq2_minus_imag = y_qr_imag_3 - R34_mul_x4_imag;
    complex_division cd2(eq2_minus_real,eq2_minus_imag,R33_real,R33_imag,x_real_3_55,x_imag_3_55);
    
    assign x_real_3 = x_real_3_55[27:0];
    assign x_imag_3 = x_imag_3_55[27:0];
    
    complex_multiply cm2(R23_real,R23_imag,x_real_3,x_imag_3,R23_mul_x3_real,R23_mul_x3_imag);
    complex_multiply cm3(R24_real,R24_imag,x_real_4,x_imag_4,R24_mul_x4_real,R24_mul_x4_imag);
    assign eq3_minus_real = y_qr_real_2 - R23_mul_x3_real - R24_mul_x4_real;
    assign eq3_minus_imag = y_qr_imag_2 - R23_mul_x3_imag - R24_mul_x4_imag;
    complex_division cd3(eq3_minus_real,eq3_minus_imag,R22_real,R22_imag,x_real_2_55,x_imag_2_55);
    
    assign x_real_2 = x_real_2_55[27:0];
    assign x_imag_2 = x_imag_2_55[27:0];
    
    complex_multiply cm4(R12_real,R12_imag,x_real_2,x_imag_2,R12_mul_x2_real,R12_mul_x2_imag);
    complex_multiply cm5(R13_real,R13_imag,x_real_3,x_imag_3,R13_mul_x3_real,R13_mul_x3_imag);
    complex_multiply cm6(R14_real,R14_imag,x_real_4,x_imag_4,R14_mul_x4_real,R14_mul_x4_imag);
    assign eq4_minus_real = y_qr_real_1 - R12_mul_x2_real - R13_mul_x3_real - R14_mul_x4_real;
    assign eq4_minus_imag = y_qr_imag_1 - R12_mul_x2_imag - R13_mul_x3_imag - R14_mul_x4_imag;
    complex_division cd4(eq4_minus_real,eq4_minus_imag,R11_real,R11_imag,x_real_1_55,x_imag_1_55);
    
    assign x_real_1 = x_real_1_55[27:0];
    assign x_imag_1 = x_imag_1_55[27:0];
    
    complex_division cdx1(x_real_1,x_imag_1,28'd256,28'd0,x_real_1_sf,x_imag_1_sf);
    complex_division cdx2(x_real_2,x_imag_2,28'd256,28'd0,x_real_2_sf,x_imag_2_sf);
    complex_division cdx3(x_real_3,x_imag_3,28'd256,28'd0,x_real_3_sf,x_imag_3_sf);
    complex_division cdx4(x_real_4,x_imag_4,28'd256,28'd0,x_real_4_sf,x_imag_4_sf);
    
    de_mod dm(x_real_1_sf,x_imag_1_sf,x_real_2_sf,x_imag_2_sf,x_real_3_sf,x_imag_3_sf,x_real_4_sf,x_imag_4_sf,
              demod_1,demod_2,demod_3,demod_4);
    
endmodule
