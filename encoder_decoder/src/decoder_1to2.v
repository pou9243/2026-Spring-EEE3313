`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/26 14:37:26
// Design Name: 
// Module Name: decoder_1to2
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


module decoder_1to2(
input A, E,
output Y0, Y1
    );
    wire notA;
    
    not n0(notA, A);
    
    and and0(Y0, E, notA);
    and and1(Y1, E,    A);
endmodule
