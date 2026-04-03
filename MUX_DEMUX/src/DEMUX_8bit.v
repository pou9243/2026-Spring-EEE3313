`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/21 14:35:55
// Design Name: 
// Module Name: DEMUX_8bit
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


module DEMUX_8bit(
input I,
input[2:0] S,
output[7:0] O
    );
    
    wire[1:0] O_mid;
    
    DEMUX_2bit demux2b0(       .I(I),   .S(S[2]),  .O(O_mid));
    DEMUX_4bit demux4b0(.I(O_mid[0]), .S(S[1:0]), .O(O[3:0]));
    DEMUX_4bit demux4b1(.I(O_mid[1]), .S(S[1:0]), .O(O[7:4]));
endmodule
