`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 18:38:19
// Design Name: 
// Module Name: top_ring_cnt_7seg
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


module top_ring_cnt_7seg(
input clk,
inout [7:0] JA,
output [6:0] seg
    );
    // Wires for keypad scanning
    wire [3:0] row;
    wire [3:0] col;
    assign JA [7:4] = 4'bzzzz;
    assign row = JA[7:4];
    assign JA [3:0] = col;
    
    wire slow_clk;
    wire valid;
    wire [3:0] HEX;
    wire [3:0] BCD;
    wire [6:0] SEG;
    
    clk_divider u0 (.clk(clk), .slow_clk(slow_clk));
    scan_signal_gen_noclkdiv u1 (.clk(slow_clk), .col(col));
    keypad_to_HEX_encoder u2 (.clk(slow_clk), .row(row), .col(col), .HEX(HEX), .valid(valid));
    ring_cnt_to_BCD_pulse u3 (.clk(slow_clk), .HEX(HEX), .valid(valid), .BCD(BCD));
    BCD_to_7seg_decoder u4 (.BCD(BCD), .seg(SEG));
    
    assign seg = ~SEG;
endmodule
