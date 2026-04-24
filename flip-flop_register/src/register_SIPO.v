`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 16:44:56
// Design Name: 
// Module Name: register_SIPO
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


module register_SIPO(
input clk,
input clr,
input D,
output[7:0] Q
    );
    wire Q0; wire Q1; wire Q2; wire Q3;
    wire Q4; wire Q5; wire Q6; wire Q7;
    
    dff QA (.clk(clk), .clr(clr), .D(D), .Q(Q0));
    dff QB (.clk(clk), .clr(clr), .D(Q0), .Q(Q1));
    dff QC (.clk(clk), .clr(clr), .D(Q1), .Q(Q2));
    dff QD (.clk(clk), .clr(clr), .D(Q2), .Q(Q3));
    dff QE (.clk(clk), .clr(clr), .D(Q3), .Q(Q4));
    dff QF (.clk(clk), .clr(clr), .D(Q4), .Q(Q5));
    dff QG (.clk(clk), .clr(clr), .D(Q5), .Q(Q6));
    dff QH (.clk(clk), .clr(clr), .D(Q6), .Q(Q7));
    
    assign Q = {Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0};
endmodule
