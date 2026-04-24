`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 16:17:43
// Design Name: 
// Module Name: register_PIPO
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


module register_PIPO(
input clk,
input clr,
input[7:0] D,
output[7:0] Q
    );
    dff Q0 (.clk(clk), .clr(clr), .D(D[0]), .Q(Q[0]));
    dff Q1 (.clk(clk), .clr(clr), .D(D[1]), .Q(Q[1]));
    dff Q2 (.clk(clk), .clr(clr), .D(D[2]), .Q(Q[2]));
    dff Q3 (.clk(clk), .clr(clr), .D(D[3]), .Q(Q[3]));
    dff Q4 (.clk(clk), .clr(clr), .D(D[4]), .Q(Q[4]));
    dff Q5 (.clk(clk), .clr(clr), .D(D[5]), .Q(Q[5]));
    dff Q6 (.clk(clk), .clr(clr), .D(D[6]), .Q(Q[6]));
    dff Q7 (.clk(clk), .clr(clr), .D(D[7]), .Q(Q[7]));
endmodule
