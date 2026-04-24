`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 16:30:31
// Design Name: 
// Module Name: register_SISO
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


module register_SISO(
input clk,
input clr,
input D,
output Q
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
    
    assign Q = Q7;
endmodule
