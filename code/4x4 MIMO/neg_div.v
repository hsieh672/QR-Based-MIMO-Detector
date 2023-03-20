`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/17 11:46:39
// Design Name: 
// Module Name: multi
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


module neg_div(
    input signed [55:0] din1,
    input signed [55:0] din2,
    output reg signed [55:0] dout
    );
    reg [55:0] num1;
    reg [55:0] num2;
    wire [55:0] sum;
    
    always @(*)
    begin
        if(din1 < 0)
            num1[55:0] = ~(din1[55:0] -1'b1);
        else
            num1[55:0] = din1[55:0];
            
        if(din2 < 0)
            num2[55:0] = ~(din2[55:0] - 1'b1);
        else
            num2[55:0] = din2[55:0];            
    end
    
    int_div int1(num1,num2,sum);
    
    always @(*)
    begin
        if((din1 < 0 && din2 < 0) || (din1 > 0 && din2 > 0))
            dout[55:0] = sum[55:0];
        else if((din1 < 0 && din2 > 0) || (din1 > 0 && din2 < 0))
            dout[55:0] = ~sum[55:0] + 1'b1;
        else
            dout = 0;    
    end
    
endmodule
