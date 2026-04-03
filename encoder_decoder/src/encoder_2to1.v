`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/26 15:04:52
// Design Name: 
// Module Name: encoder_2to1
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


module encoder_2to1(
input D0, D1,
output X
    );
    wire notD0;
    
    not n0(notD0, D0);
    
    or or0(X, notD0, D1);
endmodule
