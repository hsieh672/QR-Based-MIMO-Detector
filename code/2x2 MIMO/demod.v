`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/05 21:12:22
// Design Name: 
// Module Name: de_mod
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


module de_mod(
    input signed [55:0] x_real_1,
    input signed [55:0] x_imag_1,
    input signed [55:0] x_real_2,
    input signed [55:0] x_imag_2,
    output reg signed [2:0] demod_1,
    output reg signed [2:0] demod_2
    );
    
    always @(*)
    begin
        if((x_real_1 == 0 && x_imag_1 == 0) || (x_real_1 > 0 && (-5'd10 < x_imag_1 < 5'd10)))
            demod_1 = 2'd0;
        else if((-5'd10 < x_real_1 < 5'd10) && x_imag_1 > 0)
            demod_1 = 2'd1;
        else if((-5'd10 < x_real_1 < 5'd10) && x_imag_1 < 0)
            demod_1 = 2'd2;
        else if(x_real_1 < 0 && (-5'd10 < x_imag_1 < 5'd10))
            demod_1 = 2'd3;
        else
            demod_1 = 2'd0; 
            
        if((x_real_2 == 0 && x_imag_2 == 0) || (x_real_2 > 0 && (-5'd10 < x_imag_2 < 5'd10)))
            demod_2 = 2'd0;
        else if((-5'd10 < x_imag_2 < 5'd10) && x_imag_2 > 0)
            demod_2 = 2'd1;
        else if((-5'd10 < x_imag_2 < 5'd10) && x_imag_2 < 0)
            demod_2 = 2'd2;
        else if(x_real_2 < 0 && (-5'd10 < x_imag_2 < 5'd10))
            demod_2 = 2'd3;
        else
            demod_2 = 2'd0; 
             
    end
endmodule
