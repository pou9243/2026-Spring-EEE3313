`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 11:07:49
// Design Name: 
// Module Name: DEMUX_2bit
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


module DEMUX_2bit(
input I, S,
output[1:0] O
    );
   
    wire notS;
    
    not n0(notS, S);
    
    and and0(O[0], I, notS);
    and and1(O[1], I,    S);
endmodule
