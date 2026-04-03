`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 10:46:22
// Design Name: 
// Module Name: MUX_8bit
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


module MUX_8bit(
input[7:0] D,
input[2:0] S,
output Q
    );
    
    wire Q0, Q1;
    
    MUX_4bit mux4b0(.D(D[3:0]), .S(S[1:0]), .Q(Q0));
    MUX_4bit mux4b1(.D(D[7:4]), .S(S[1:0]), .Q(Q1));
    
    wire[1:0] D_2bit;
    assign D_2bit[0] = Q0;
    assign D_2bit[1] = Q1;
    
    MUX_2bit mux2b0(.D(D_2bit), .S(S[2]), .Q(Q));
endmodule
