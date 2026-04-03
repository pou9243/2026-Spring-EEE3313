`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/21 14:21:48
// Design Name: 
// Module Name: DEMUX_4bit
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


module DEMUX_4bit(
input I,
input [1:0] S,
output[3:0] O
    );
    
    wire notS0, notS1;
    
    not not0(notS0, S[0]);
    not not1(notS1, S[1]);
    
    and and0(O[0], I, notS0, notS1);
    and and1(O[1], I,  S[0], notS1);
    and and2(O[2], I, notS0,  S[1]);
    and and3(O[3], I,  S[0],  S[1]);
endmodule
