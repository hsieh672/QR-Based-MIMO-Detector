`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/03 16:16:16
// Design Name: 
// Module Name: integer_div
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


module int_div
(
input[55:0] a, 
input[55:0] b,

output reg [55:0] yshang
);

reg[55:0] tempa = 56'd0;
reg[55:0] tempb = 56'd0;
reg[111:0] temp_a;
reg[111:0] temp_b;

integer i;

always @(a or b)
begin
    tempa = a;
    tempb = b;
end

always @(tempa or tempb)
begin
    temp_a = {56'h00000000,tempa};
    temp_b = {tempb,56'h00000000}; 
    for(i = 0;i < 56;i = i + 1)
        begin
            temp_a = {temp_a[110:0],1'b0};
            if(temp_a[111:56] >= tempb)
                temp_a = temp_a - temp_b + 1'b1;
            else
				temp_a = temp_a;
        end

    yshang = temp_a[55:0];
end

endmodule 

