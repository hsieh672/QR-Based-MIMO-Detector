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


module multi(
    input signed [27:0] din1,
    input signed [27:0] din2,
    output reg signed [55:0] dout
    );
    reg [27:0] num1;
    reg [27:0] num2;
    wire [55:0] sum;
    
    always @(*)
    begin
        if(din1 < 0)
            num1[27:0] = ~(din1[27:0] -1'b1);
        else
            num1[27:0] = din1[27:0];
            
        if(din2 < 0)
            num2[27:0] = ~(din2[27:0] - 1'b1);
        else
            num2[27:0] = din2[27:0];            
    end
    
    mul mul1(.din1(num1),.din2(num2),.dout(sum));
    
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
