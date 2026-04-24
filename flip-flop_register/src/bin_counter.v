`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 15:38:17
// Design Name: 
// Module Name: bin_counter
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


module bin_counter(
input clk,
input clr,
output[7:0] Q
    );
    
    wire Q0bar; wire Q1bar; wire Q2bar; wire Q3bar;
    wire Q4bar; wire Q5bar; wire Q6bar; wire Q7bar;
    
    dff Q0 (.clk(clk), .clr(clr), .D(Q0bar), .Q(Q[0]), .Qbar(Q0bar));
    dff Q1 (.clk(Q0bar), .clr(clr), .D(Q1bar), .Q(Q[1]), .Qbar(Q1bar));
    dff Q2 (.clk(Q1bar), .clr(clr), .D(Q2bar), .Q(Q[2]), .Qbar(Q2bar));
    dff Q3 (.clk(Q2bar), .clr(clr), .D(Q3bar), .Q(Q[3]), .Qbar(Q3bar));
    dff Q4 (.clk(Q3bar), .clr(clr), .D(Q4bar), .Q(Q[4]), .Qbar(Q4bar));
    dff Q5 (.clk(Q4bar), .clr(clr), .D(Q5bar), .Q(Q[5]), .Qbar(Q5bar));
    dff Q6 (.clk(Q5bar), .clr(clr), .D(Q6bar), .Q(Q[6]), .Qbar(Q6bar));
    dff Q7 (.clk(Q6bar), .clr(clr), .D(Q7bar), .Q(Q[7]), .Qbar(Q7bar));
endmodule
