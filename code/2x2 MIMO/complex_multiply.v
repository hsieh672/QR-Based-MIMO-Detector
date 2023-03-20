`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/02 21:24:00
// Design Name: 
// Module Name: complex_multiply
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


module complex_multiply(
    input signed [27:0]real_a,
    input signed [27:0]imag_a,
    input signed [27:0]real_b,
    input signed [27:0]imag_b,
    output signed [55:0]real_out,
    output signed [55:0]imag_out
    );
    wire signed [55:0] dout_ac;
    wire signed [55:0] dout_bd;
    wire signed [55:0] dout_ad;
    wire signed [55:0] dout_bc;
    
    multi multi1(real_a,real_b,dout_ac);
    multi multi2(imag_a,imag_b,dout_bd);
    multi multi3(real_a,imag_b,dout_ad);
    multi multi4(imag_a,real_b,dout_bc);
    
    assign real_out = dout_ac - dout_bd;
    assign imag_out = dout_ad + dout_bc;
    
endmodule
