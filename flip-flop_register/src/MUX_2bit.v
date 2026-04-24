`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 10:13:27
// Design Name: 
// Module Name: MUX_2bit
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


module MUX_2bit(
input S,
input A, B,
output Q
    );
    
    wire notS;
    wire m0, m1;
    
    not n0(notS,S);
    
    and and0(m0, notS, A);
    and and1(m1,    S, B);
    
    or or0(Q, m0, m1);
endmodule
