`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/13 23:36:26
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
    output signed [27:0] Q11_real,
    output signed [27:0] Q11_imag,
    output signed [27:0] Q12_real,
    output signed [27:0] Q12_imag,
    output signed [27:0] Q13_real,
    output signed [27:0] Q13_imag,
    output signed [27:0] Q14_real,
    output signed [27:0] Q14_imag,
    output signed [27:0] Q21_real,
    output signed [27:0] Q21_imag,
    output signed [27:0] Q22_real,
    output signed [27:0] Q22_imag,
    output signed [27:0] Q23_real,
    output signed [27:0] Q23_imag,
    output signed [27:0] Q24_real,
    output signed [27:0] Q24_imag,
    output signed [27:0] Q31_real,
    output signed [27:0] Q31_imag,
    output signed [27:0] Q32_real,
    output signed [27:0] Q32_imag,
    output signed [27:0] Q33_real,
    output signed [27:0] Q33_imag,
    output signed [27:0] Q34_real,
    output signed [27:0] Q34_imag,
    output signed [27:0] Q41_real,
    output signed [27:0] Q41_imag,
    output signed [27:0] Q42_real,
    output signed [27:0] Q42_imag,
    output signed [27:0] Q43_real,
    output signed [27:0] Q43_imag,
    output signed [27:0] Q44_real,
    output signed [27:0] Q44_imag,
    output signed [27:0] R11_real,
    output signed [27:0] R11_imag,
    output signed [27:0] R12_real,
    output signed [27:0] R12_imag,
    output signed [27:0] R13_real,
    output signed [27:0] R13_imag,
    output signed [27:0] R14_real,
    output signed [27:0] R14_imag,
    output signed [27:0] R21_real,
    output signed [27:0] R21_imag,
    output signed [27:0] R22_real,
    output signed [27:0] R22_imag,
    output signed [27:0] R23_real,
    output signed [27:0] R23_imag,
    output signed [27:0] R24_real,
    output signed [27:0] R24_imag,
    output signed [27:0] R31_real,
    output signed [27:0] R31_imag,
    output signed [27:0] R32_real,
    output signed [27:0] R32_imag,
    output signed [27:0] R33_real,
    output signed [27:0] R33_imag,
    output signed [27:0] R34_real,
    output signed [27:0] R34_imag,
    output signed [27:0] R41_real,
    output signed [27:0] R41_imag,
    output signed [27:0] R42_real,
    output signed [27:0] R42_imag,
    output signed [27:0] R43_real,
    output signed [27:0] R43_imag,
    output signed [27:0] R44_real,
    output signed [27:0] R44_imag
    );
    
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
    
    wire signed [55:0] Q11_real_truc;
    wire signed [55:0] Q11_imag_truc;
    wire signed [55:0] Q12_real_truc;
    wire signed [55:0] Q12_imag_truc;
    wire signed [55:0] Q13_real_truc;
    wire signed [55:0] Q13_imag_truc;
    wire signed [55:0] Q14_real_truc;
    wire signed [55:0] Q14_imag_truc;
    wire signed [55:0] Q21_real_truc;
    wire signed [55:0] Q21_imag_truc;
    wire signed [55:0] Q22_real_truc;
    wire signed [55:0] Q22_imag_truc;
    wire signed [55:0] Q23_real_truc;
    wire signed [55:0] Q23_imag_truc;
    wire signed [55:0] Q24_real_truc;
    wire signed [55:0] Q24_imag_truc;
    wire signed [55:0] Q31_real_truc;
    wire signed [55:0] Q31_imag_truc;
    wire signed [55:0] Q32_real_truc;
    wire signed [55:0] Q32_imag_truc;
    wire signed [55:0] Q33_real_truc;
    wire signed [55:0] Q33_imag_truc;
    wire signed [55:0] Q34_real_truc;
    wire signed [55:0] Q34_imag_truc;
    wire signed [55:0] Q41_real_truc;
    wire signed [55:0] Q41_imag_truc;
    wire signed [55:0] Q42_real_truc;
    wire signed [55:0] Q42_imag_truc;
    wire signed [55:0] Q43_real_truc;
    wire signed [55:0] Q43_imag_truc;
    wire signed [55:0] Q44_real_truc;
    wire signed [55:0] Q44_imag_truc;
    
    wire signed [55:0] R11_real_truc;
    wire signed [55:0] R22_real_truc;
    wire signed [55:0] R33_real_truc;
    wire signed [55:0] R44_real_truc;
    
    wire signed [55:0] dot_loop2_real;
    wire signed [55:0] dot_loop2_imag;
    wire signed [55:0] dot_loop3_real_1;
    wire signed [55:0] dot_loop3_imag_1;
    wire signed [55:0] dot_loop3_real_2;
    wire signed [55:0] dot_loop3_imag_2;
    wire signed [55:0] dot_loop4_real_1;
    wire signed [55:0] dot_loop4_imag_1;
    wire signed [55:0] dot_loop4_real_2;
    wire signed [55:0] dot_loop4_imag_2;
    wire signed [55:0] dot_loop4_real_3;
    wire signed [55:0] dot_loop4_imag_3;
    
    wire signed [27:0] v_loop2_real_1;
    wire signed [27:0] v_loop2_imag_1;
    wire signed [27:0] v_loop2_real_2;
    wire signed [27:0] v_loop2_imag_2;
    wire signed [27:0] v_loop2_real_3;
    wire signed [27:0] v_loop2_imag_3;
    wire signed [27:0] v_loop2_real_4;
    wire signed [27:0] v_loop2_imag_4;
   
    wire signed [27:0] v_loop3_1_real_1;
    wire signed [27:0] v_loop3_1_imag_1;
    wire signed [27:0] v_loop3_1_real_2;
    wire signed [27:0] v_loop3_1_imag_2;
    wire signed [27:0] v_loop3_1_real_3;
    wire signed [27:0] v_loop3_1_imag_3;
    wire signed [27:0] v_loop3_1_real_4;
    wire signed [27:0] v_loop3_1_imag_4;
    wire signed [27:0] v_loop3_2_real_1;
    wire signed [27:0] v_loop3_2_imag_1;
    wire signed [27:0] v_loop3_2_real_2;
    wire signed [27:0] v_loop3_2_imag_2;
    wire signed [27:0] v_loop3_2_real_3;
    wire signed [27:0] v_loop3_2_imag_3;
    wire signed [27:0] v_loop3_2_real_4;
    wire signed [27:0] v_loop3_2_imag_4;
    
    wire signed [27:0] v_loop4_1_real_1;
    wire signed [27:0] v_loop4_1_imag_1;
    wire signed [27:0] v_loop4_1_real_2;
    wire signed [27:0] v_loop4_1_imag_2;
    wire signed [27:0] v_loop4_1_real_3;
    wire signed [27:0] v_loop4_1_imag_3;
    wire signed [27:0] v_loop4_1_real_4;
    wire signed [27:0] v_loop4_1_imag_4;
    wire signed [27:0] v_loop4_2_real_1;
    wire signed [27:0] v_loop4_2_imag_1;
    wire signed [27:0] v_loop4_2_real_2;
    wire signed [27:0] v_loop4_2_imag_2;
    wire signed [27:0] v_loop4_2_real_3;
    wire signed [27:0] v_loop4_2_imag_3;
    wire signed [27:0] v_loop4_2_real_4;
    wire signed [27:0] v_loop4_2_imag_4;
    wire signed [27:0] v_loop4_3_real_1;
    wire signed [27:0] v_loop4_3_imag_1;
    wire signed [27:0] v_loop4_3_real_2;
    wire signed [27:0] v_loop4_3_imag_2;
    wire signed [27:0] v_loop4_3_real_3;
    wire signed [27:0] v_loop4_3_imag_3;
    wire signed [27:0] v_loop4_3_real_4;
    wire signed [27:0] v_loop4_3_imag_4;
    
    wire signed [55:0] R11_real_55;
    // first loop
    // calculate R11
    norm n1(H11_real,H11_imag,H21_real,H21_imag,H31_real,H31_imag,H41_real,H41_imag,R11_real_truc);
    neg_div indR1(R11_real_truc,56'd10000,R11_real_55); // Decimal point shift position
    assign R11_real = R11_real_55[27:0];
    
    // calculate Q11 Q21 Q31 Q41
    multi mull1v1(H11_real,28'd10000000,Q11_real_truc);
    multi mull1v2(H11_imag,28'd10000000,Q11_imag_truc);
    multi mull1v3(H21_real,28'd10000000,Q21_real_truc);
    multi mull1v4(H21_imag,28'd10000000,Q21_imag_truc);
    multi mull1v5(H31_real,28'd10000000,Q31_real_truc);
    multi mull1v6(H31_imag,28'd10000000,Q31_imag_truc);
    multi mull1v7(H41_real,28'd10000000,Q41_real_truc);
    multi mull1v8(H41_imag,28'd10000000,Q41_imag_truc);
    
    neg_div indreal11(Q11_real_truc,R11_real_truc,Q11_real);
    neg_div indimag11(Q11_imag_truc,R11_real_truc,Q11_imag);
    neg_div indreal21(Q21_real_truc,R11_real_truc,Q21_real);
    neg_div indimag21(Q21_imag_truc,R11_real_truc,Q21_imag);
    neg_div indreal31(Q31_real_truc,R11_real_truc,Q31_real);
    neg_div indimag31(Q31_imag_truc,R11_real_truc,Q31_imag);
    neg_div indreal41(Q41_real_truc,R11_real_truc,Q41_real);
    neg_div indimag41(Q41_imag_truc,R11_real_truc,Q41_imag);
    
    // second for loop
    // calculate R12
    assign conj_Q11_imag = Q11_imag * -1'd1;
    assign conj_Q21_imag = Q21_imag * -1'd1;
    assign conj_Q31_imag = Q31_imag * -1'd1;
    assign conj_Q41_imag = Q41_imag * -1'd1;
    
    dot_product dp1(Q11_real,conj_Q11_imag,Q21_real,conj_Q21_imag,Q31_real,conj_Q31_imag,Q41_real,conj_Q41_imag,
                    H12_real,H12_imag,H22_real,H22_imag,H32_real,H32_imag,H42_real,H42_imag,dot_loop2_real,dot_loop2_imag);
    
    neg_div indR12real(dot_loop2_real,56'd1000,R12_real);
    neg_div indR12imag(dot_loop2_imag,56'd1000,R12_imag);
    
    // calculate v in loop 2
    cal_v cvloop2_1(R12_real,R12_imag,Q11_real,Q11_imag,Q21_real,Q21_imag,Q31_real,Q31_imag,Q41_real,Q41_imag,
                    H12_real,H12_imag,H22_real,H22_imag,H32_real,H32_imag,H42_real,H42_imag,
                    v_loop2_real_1,v_loop2_imag_1,v_loop2_real_2,v_loop2_imag_2,v_loop2_real_3,v_loop2_imag_3,v_loop2_real_4,v_loop2_imag_4);
    
    // calculate R22
    norm n2(v_loop2_real_1,v_loop2_imag_1,v_loop2_real_2,v_loop2_imag_2,v_loop2_real_3,v_loop2_imag_3,v_loop2_real_4,v_loop2_imag_4,R22_real_truc);
    neg_div indR2(R22_real_truc,56'd10000,R22_real);   // Decimal point shift position
    
    // calculate Q12 Q22 Q32 Q42
    multi mull2v1(v_loop2_real_1,28'd10000000,Q12_real_truc);
    multi mull2v2(v_loop2_imag_1,28'd10000000,Q12_imag_truc);
    multi mull2v3(v_loop2_real_2,28'd10000000,Q22_real_truc);
    multi mull2v4(v_loop2_imag_2,28'd10000000,Q22_imag_truc);
    multi mull2v5(v_loop2_real_3,28'd10000000,Q32_real_truc);
    multi mull2v6(v_loop2_imag_3,28'd10000000,Q32_imag_truc);
    multi mull2v7(v_loop2_real_4,28'd10000000,Q42_real_truc);
    multi mull2v8(v_loop2_imag_4,28'd10000000,Q42_imag_truc);
    
    neg_div indreal12(Q12_real_truc,R22_real_truc,Q12_real);
    neg_div indimag12(Q12_imag_truc,R22_real_truc,Q12_imag);
    neg_div indreal22(Q22_real_truc,R22_real_truc,Q22_real);
    neg_div indimag22(Q22_imag_truc,R22_real_truc,Q22_imag);
    neg_div indreal32(Q32_real_truc,R22_real_truc,Q32_real);
    neg_div indimag32(Q32_imag_truc,R22_real_truc,Q32_imag);
    neg_div indreal42(Q42_real_truc,R22_real_truc,Q42_real);
    neg_div indimag42(Q42_imag_truc,R22_real_truc,Q42_imag);
    
    // third for loop 
    // calculate R13
    dot_product dp2(Q11_real,conj_Q11_imag,Q21_real,conj_Q21_imag,Q31_real,conj_Q31_imag,Q41_real,conj_Q41_imag,
                    H13_real,H13_imag,H23_real,H23_imag,H33_real,H33_imag,H43_real,H43_imag,dot_loop3_real_1,dot_loop3_imag_1);
    
    neg_div indR13real(dot_loop3_real_1,56'd1000,R13_real);
    neg_div indR13imag(dot_loop3_imag_1,56'd1000,R13_imag);
    
    // calculate v
    cal_v cvloop3_1(R13_real,R13_imag,Q11_real,Q11_imag,Q21_real,Q21_imag,Q31_real,Q31_imag,Q41_real,Q41_imag,
                    H13_real,H13_imag,H23_real,H23_imag,H33_real,H33_imag,H43_real,H43_imag,
                    v_loop3_1_real_1,v_loop3_1_imag_1,v_loop3_1_real_2,v_loop3_1_imag_2,v_loop3_1_real_3,v_loop3_1_imag_3,v_loop3_1_real_4,v_loop3_1_imag_4);
    
    // calculate R23
    assign conj_Q12_imag = Q12_imag * -1'd1;
    assign conj_Q22_imag = Q22_imag * -1'd1;
    assign conj_Q32_imag = Q32_imag * -1'd1;
    assign conj_Q42_imag = Q42_imag * -1'd1;
    
    dot_product dp3(Q12_real,conj_Q12_imag,Q22_real,conj_Q22_imag,Q32_real,conj_Q32_imag,Q42_real,conj_Q42_imag,
                    v_loop3_1_real_1,v_loop3_1_imag_1,v_loop3_1_real_2,v_loop3_1_imag_2,v_loop3_1_real_3,v_loop3_1_imag_3,v_loop3_1_real_4,v_loop3_1_imag_4,
                    dot_loop3_real_2,dot_loop3_imag_2);
    
    neg_div indR23real(dot_loop3_real_2,56'd1000,R23_real);
    neg_div indR23imag(dot_loop3_imag_2,56'd1000,R23_imag);
    
    // calculate v
    cal_v cvloop3_2(R23_real,R23_imag,Q12_real,Q12_imag,Q22_real,Q22_imag,Q32_real,Q32_imag,Q42_real,Q42_imag,
                    v_loop3_1_real_1,v_loop3_1_imag_1,v_loop3_1_real_2,v_loop3_1_imag_2,v_loop3_1_real_3,v_loop3_1_imag_3,v_loop3_1_real_4,v_loop3_1_imag_4,
                    v_loop3_2_real_1,v_loop3_2_imag_1,v_loop3_2_real_2,v_loop3_2_imag_2,v_loop3_2_real_3,v_loop3_2_imag_3,v_loop3_2_real_4,v_loop3_2_imag_4);
    // calculate R33
    norm n3(v_loop3_2_real_1,v_loop3_2_imag_1,v_loop3_2_real_2,v_loop3_2_imag_2,v_loop3_2_real_3,v_loop3_2_imag_3,v_loop3_2_real_4,v_loop3_2_imag_4,R33_real_truc);
    neg_div indR3(R33_real_truc,56'd10000,R33_real);   // Decimal point shift position
    
    // calculate Q13 Q23 Q33 Q43
    multi mull3v1(v_loop3_2_real_1,28'd10000000,Q13_real_truc);
    multi mull3v2(v_loop3_2_imag_1,28'd10000000,Q13_imag_truc);
    multi mull3v3(v_loop3_2_real_2,28'd10000000,Q23_real_truc);
    multi mull3v4(v_loop3_2_imag_2,28'd10000000,Q23_imag_truc);
    multi mull3v5(v_loop3_2_real_3,28'd10000000,Q33_real_truc);
    multi mull3v6(v_loop3_2_imag_3,28'd10000000,Q33_imag_truc);
    multi mull3v7(v_loop3_2_real_4,28'd10000000,Q43_real_truc);
    multi mull3v8(v_loop3_2_imag_4,28'd10000000,Q43_imag_truc);
    
    neg_div indreal13(Q13_real_truc,R33_real_truc,Q13_real);
    neg_div indimag13(Q13_imag_truc,R33_real_truc,Q13_imag);
    neg_div indreal23(Q23_real_truc,R33_real_truc,Q23_real);
    neg_div indimag23(Q23_imag_truc,R33_real_truc,Q23_imag);
    neg_div indreal33(Q33_real_truc,R33_real_truc,Q33_real);
    neg_div indimag33(Q33_imag_truc,R33_real_truc,Q33_imag);
    neg_div indreal43(Q43_real_truc,R33_real_truc,Q43_real);
    neg_div indimag43(Q43_imag_truc,R33_real_truc,Q43_imag);
    
    // fourth for loop   
    // calculate R14
    dot_product dp4(Q11_real,conj_Q11_imag,Q21_real,conj_Q21_imag,Q31_real,conj_Q31_imag,Q41_real,conj_Q41_imag,
                    H14_real,H14_imag,H24_real,H24_imag,H34_real,H34_imag,H44_real,H44_imag,dot_loop4_real_1,dot_loop4_imag_1);
    
    neg_div indR14real(dot_loop4_real_1,56'd1000,R14_real);
    neg_div indR14imag(dot_loop4_imag_1,56'd1000,R14_imag);
    
    // calculate v
    cal_v cvloop4_1(R14_real,R14_imag,Q11_real,Q11_imag,Q21_real,Q21_imag,Q31_real,Q31_imag,Q41_real,Q41_imag,
                    H14_real,H14_imag,H24_real,H24_imag,H34_real,H34_imag,H44_real,H44_imag,
                    v_loop4_1_real_1,v_loop4_1_imag_1,v_loop4_1_real_2,v_loop4_1_imag_2,v_loop4_1_real_3,v_loop4_1_imag_3,v_loop4_1_real_4,v_loop4_1_imag_4);
    
    //  calculate R24
    dot_product dp5(Q12_real,conj_Q12_imag,Q22_real,conj_Q22_imag,Q32_real,conj_Q32_imag,Q42_real,conj_Q42_imag,
                    v_loop4_1_real_1,v_loop4_1_imag_1,v_loop4_1_real_2,v_loop4_1_imag_2,v_loop4_1_real_3,v_loop4_1_imag_3,v_loop4_1_real_4,v_loop4_1_imag_4,
                    dot_loop4_real_2,dot_loop4_imag_2);
    
    neg_div indR24real(dot_loop4_real_2,56'd1000,R24_real);
    neg_div indR24imag(dot_loop4_imag_2,56'd1000,R24_imag);
    
    // calculate v 
    cal_v cvloop4_2(R24_real,R24_imag,Q12_real,Q12_imag,Q22_real,Q22_imag,Q32_real,Q32_imag,Q42_real,Q42_imag,
                    v_loop4_1_real_1,v_loop4_1_imag_1,v_loop4_1_real_2,v_loop4_1_imag_2,v_loop4_1_real_3,v_loop4_1_imag_3,v_loop4_1_real_4,v_loop4_1_imag_4,
                    v_loop4_2_real_1,v_loop4_2_imag_1,v_loop4_2_real_2,v_loop4_2_imag_2,v_loop4_2_real_3,v_loop4_2_imag_3,v_loop4_2_real_4,v_loop4_2_imag_4);
    
    // calculate R34
    assign conj_Q13_imag = Q13_imag * -1'd1;
    assign conj_Q23_imag = Q23_imag * -1'd1;
    assign conj_Q33_imag = Q33_imag * -1'd1;
    assign conj_Q43_imag = Q43_imag * -1'd1;
    
    dot_product dp6(Q13_real,conj_Q13_imag,Q23_real,conj_Q23_imag,Q33_real,conj_Q33_imag,Q43_real,conj_Q43_imag,
                    v_loop4_2_real_1,v_loop4_2_imag_1,v_loop4_2_real_2,v_loop4_2_imag_2,v_loop4_2_real_3,v_loop4_2_imag_3,v_loop4_2_real_4,v_loop4_2_imag_4,
                    dot_loop4_real_3,dot_loop4_imag_3);
    
    neg_div indR34real(dot_loop4_real_3,56'd1000,R34_real);
    neg_div indR34imag(dot_loop4_imag_3,56'd1000,R34_imag);
    
    // calculate v
    cal_v cvloop4_3(R34_real,R34_imag,Q13_real,Q13_imag,Q23_real,Q23_imag,Q33_real,Q33_imag,Q43_real,Q43_imag,
                    v_loop4_2_real_1,v_loop4_2_imag_1,v_loop4_2_real_2,v_loop4_2_imag_2,v_loop4_2_real_3,v_loop4_2_imag_3,v_loop4_2_real_4,v_loop4_2_imag_4,
                    v_loop4_3_real_1,v_loop4_3_imag_1,v_loop4_3_real_2,v_loop4_3_imag_2,v_loop4_3_real_3,v_loop4_3_imag_3,v_loop4_3_real_4,v_loop4_3_imag_4);
    
    // calculate R44 
    norm n4(v_loop4_3_real_1,v_loop4_3_imag_1,v_loop4_3_real_2,v_loop4_3_imag_2,v_loop4_3_real_3,v_loop4_3_imag_3,v_loop4_3_real_4,v_loop4_3_imag_4,R44_real_truc);
    neg_div indR4(R44_real_truc,56'd10000,R44_real);   // Decimal point shift position
    
    // calculate Q14 Q24 Q34 Q44
    multi mull4v1(v_loop4_3_real_1,28'd10000000,Q14_real_truc);
    multi mull4v2(v_loop4_3_imag_1,28'd10000000,Q14_imag_truc);
    multi mull4v3(v_loop4_3_real_2,28'd10000000,Q24_real_truc);
    multi mull4v4(v_loop4_3_imag_2,28'd10000000,Q24_imag_truc);
    multi mull4v5(v_loop4_3_real_3,28'd10000000,Q34_real_truc);
    multi mull4v6(v_loop4_3_imag_3,28'd10000000,Q34_imag_truc);
    multi mull4v7(v_loop4_3_real_4,28'd10000000,Q44_real_truc);
    multi mull4v8(v_loop4_3_imag_4,28'd10000000,Q44_imag_truc);
    
    neg_div indreal14(Q14_real_truc,R44_real_truc,Q14_real);
    neg_div indimag14(Q14_imag_truc,R44_real_truc,Q14_imag);
    neg_div indreal24(Q24_real_truc,R44_real_truc,Q24_real);
    neg_div indimag24(Q24_imag_truc,R44_real_truc,Q24_imag);
    neg_div indreal34(Q34_real_truc,R44_real_truc,Q34_real);
    neg_div indimag34(Q34_imag_truc,R44_real_truc,Q34_imag);
    neg_div indreal44(Q44_real_truc,R44_real_truc,Q44_real);
    neg_div indimag44(Q44_imag_truc,R44_real_truc,Q44_imag);
    
    // assign zero in R matrix
    assign R11_imag = 28'd0;
    assign R22_imag = 28'd0;
    assign R33_imag = 28'd0;
    assign R44_imag = 28'd0;
    assign R21_real = 28'd0;
    assign R21_imag = 28'd0;
    assign R31_real = 28'd0;
    assign R31_imag = 28'd0;
    assign R41_real = 28'd0;
    assign R41_imag = 28'd0;
    assign R32_real = 28'd0;
    assign R32_imag = 28'd0;
    assign R42_real = 28'd0;
    assign R42_imag = 28'd0;
    assign R43_real = 28'd0;
    assign R43_imag = 28'd0;

endmodule
