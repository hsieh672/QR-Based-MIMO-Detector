`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/06 14:01:32
// Design Name: 
// Module Name: QR
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


module QR(
    input signed [27:0] H11_real,
    input signed [27:0] H11_imag,
    input signed [27:0] H12_real,
    input signed [27:0] H12_imag,
    input signed [27:0] H21_real,
    input signed [27:0] H21_imag,
    input signed [27:0] H22_real,
    input signed [27:0] H22_imag,
    output signed [27:0] Q11_real,
    output signed [27:0] Q11_imag,
    output signed [27:0] Q12_real,
    output signed [27:0] Q12_imag,
    output signed [27:0] Q21_real,
    output signed [27:0] Q21_imag,
    output signed [27:0] Q22_real,
    output signed [27:0] Q22_imag,
    output signed [27:0] R11_real,
    output signed [27:0] R11_imag,
    output signed [27:0] R12_real,
    output signed [27:0] R12_imag,
    output signed [27:0] R21_real,
    output signed [27:0] R21_imag,
    output signed [27:0] R22_real,
    output signed [27:0] R22_imag
    );
    
    wire signed [27:0] conj_Q11_imag;
    wire signed [27:0] conj_Q21_imag;
    
    wire signed [55:0] Q11_real_truc;
    wire signed [55:0] Q11_imag_truc;
    wire signed [55:0] Q12_real_truc;
    wire signed [55:0] Q12_imag_truc;
    wire signed [55:0] Q21_real_truc;
    wire signed [55:0] Q21_imag_truc;
    wire signed [55:0] Q22_real_truc;
    wire signed [55:0] Q22_imag_truc;
   
    wire signed [55:0] R11_real_truc;
    wire signed [55:0] R22_real_truc;
    
    wire signed [55:0] R11_real_55;
    
    wire signed [55:0] dot_loop2_real;
    wire signed [55:0] dot_loop2_imag;
    
    wire signed [27:0] v_loop2_real_1;
    wire signed [27:0] v_loop2_imag_1;
    wire signed [27:0] v_loop2_real_2;
    wire signed [27:0] v_loop2_imag_2;
    
     // first loop
    // calculate R11
    norm n1(H11_real,H11_imag,H21_real,H21_imag,R11_real_truc);
    neg_div indR1(R11_real_truc,56'd10000,R11_real_55); // Decimal point shift position
    assign R11_real = R11_real_55[27:0];
    
    // calculate Q11 Q21
    multi mull1v1(H11_real,28'd10000000,Q11_real_truc);
    multi mull1v2(H11_imag,28'd10000000,Q11_imag_truc);
    multi mull1v3(H21_real,28'd10000000,Q21_real_truc);
    multi mull1v4(H21_imag,28'd10000000,Q21_imag_truc);
    
    neg_div indreal11(Q11_real_truc,R11_real_truc,Q11_real);
    neg_div indimag11(Q11_imag_truc,R11_real_truc,Q11_imag);
    neg_div indreal21(Q21_real_truc,R11_real_truc,Q21_real);
    neg_div indimag21(Q21_imag_truc,R11_real_truc,Q21_imag);
    
    // second for loop
    // calculate R12
    multi mullqv1(Q11_imag,-28'd1,conj_Q11_imag);
    multi mullqv2(Q21_imag,-28'd1,conj_Q21_imag);
    
    dot_product dp1(Q11_real,conj_Q11_imag,Q21_real,conj_Q21_imag,
                    H12_real,H12_imag,H22_real,H22_imag,dot_loop2_real,dot_loop2_imag);
    
    neg_div indR12real(dot_loop2_real,56'd1000,R12_real);
    neg_div indR12imag(dot_loop2_imag,56'd1000,R12_imag);
    
    // calculate v in loop 2
    cal_v cvloop2_1(R12_real,R12_imag,
                    Q11_real,Q11_imag,Q21_real,Q21_imag,
                    H12_real,H12_imag,H22_real,H22_imag,
                    v_loop2_real_1,v_loop2_imag_1,v_loop2_real_2,v_loop2_imag_2);
    
    // calculate R22
    norm n2(v_loop2_real_1,v_loop2_imag_1,v_loop2_real_2,v_loop2_imag_2,R22_real_truc);
    neg_div indR2(R22_real_truc,56'd10000,R22_real);   // Decimal point shift position
    
    // calculate Q12 Q22
    multi mull2v1(v_loop2_real_1,28'd10000000,Q12_real_truc);
    multi mull2v2(v_loop2_imag_1,28'd10000000,Q12_imag_truc);
    multi mull2v3(v_loop2_real_2,28'd10000000,Q22_real_truc);
    multi mull2v4(v_loop2_imag_2,28'd10000000,Q22_imag_truc);
    
    neg_div indreal12(Q12_real_truc,R22_real_truc,Q12_real);
    neg_div indimag12(Q12_imag_truc,R22_real_truc,Q12_imag);
    neg_div indreal22(Q22_real_truc,R22_real_truc,Q22_real);
    neg_div indimag22(Q22_imag_truc,R22_real_truc,Q22_imag);
    
    // assign zero in R matrix
    assign R11_imag = 28'd0;
    assign R22_imag = 28'd0;
    assign R21_real = 28'd0;
    assign R21_imag = 28'd0;
    
endmodule
