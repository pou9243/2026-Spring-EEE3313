`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 16:06:17
// Design Name: 
// Module Name: BCD_counter
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


module BCD_counter(
input clk,
input clr,
output[3:0] Q
    );
    
    wire Q0bar; wire Q1bar; wire Q2bar; wire Q3bar;
    wire overflow; wire reset;
    
    dff Q0 (.clk(clk), .clr(reset), .D(Q0bar), .Q(Q[0]), .Qbar(Q0bar));
    dff Q1 (.clk(Q0bar), .clr(reset), .D(Q1bar), .Q(Q[1]), .Qbar(Q1bar));
    dff Q2 (.clk(Q1bar), .clr(reset), .D(Q2bar), .Q(Q[2]), .Qbar(Q2bar));
    dff Q3 (.clk(Q2bar), .clr(reset), .D(Q3bar), .Q(Q[3]), .Qbar(Q3bar));
    
    and (overflow, Q[1], Q[3]);
    or (reset, overflow, clr);
endmodule

