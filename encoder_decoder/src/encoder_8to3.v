`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/27 10:43:56
// Design Name: 
// Module Name: encoder_8to3
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


module encoder_8to3(
input D0, D1, D2, D3, D4, D5, D6, D7,
output A, B, C
    );
    
    or or0(C, D1, D3, D5, D7);
    or or1(B, D2, D3, D6, D7);
    or or2(A, D4, D5, D6, D7);
endmodule
