`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 16:40:32
// Design Name: 
// Module Name: top_ring_cnt_nopulse
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


module top_ring_cnt_nopulse(
input clk,
inout [7:0] JA,
output [7:0] JB
    );
    // Wires for keypad scanning
    wire [3:0] row;
    wire [3:0] col;
    assign JA [7:4] = 4'bzzzz;
    assign row = JA[7:4];
    assign JA [3:0] = col;
    
    wire [7:0] led;
    
    wire [3:0] HEX;
    
    scan_signal_gen u0 (.clk(clk), .col(col));
    keypad_to_HEX_4cycle u1 (.clk(clk), .row(row), .col(col), .HEX(HEX));
    ring_cnt_to_led u2 (.clk(clk), .HEX(HEX), .led(led));
    
    assign JB = ~led;
endmodule
