`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/13 22:45:53
// Design Name: 
// Module Name: sqrt
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


module sqrt(
    input [55:0] num,
    output reg [55:0] sqrt
    );
    
    reg [55:0] a;
    reg [27:0] q;
    reg [29:0] left,right,r;    
    integer i;
    
    always @(*)
    begin
        a = num;
        q = 0;
        i = 0;
        left = 0;   //input to adder/sub
        right = 0;  //input to adder/sub
        r = 0;  //remainder
        //run the calculations for 16 iterations.
        for(i=0;i<28;i=i+1) begin 
            right = {q,r[29],1'b1};
            left = {r[27:0],a[55:54]};
            a = {a[53:0],2'b00};    //left shift by 2 bits.
            if (r[29] == 1) //add if r is negative
                r = left + right;
            else    //subtract if r is positive
                r = left - right;
            q = {q[26:0],!r[29]};       
        end
        sqrt = q;   //final assignment of output.
        
    end
endmodule
