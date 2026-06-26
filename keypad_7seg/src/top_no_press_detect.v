`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/18 23:09:48
// Design Name: 
// Module Name: top_no_press_detect
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


module top_no_press_detect(
input clk,
inout [7:0] JC,
output [6:0] seg,
output [3:0] an
    );
    wire slow_clk;
    wire valid;
    wire[3:0] col;
    wire[3:0] row = JC[7:4];
    wire[3:0] scan_value;
    wire[3:0] hex;
    wire[6:0] SEG;
    
    assign JC[3:0] = col;
    assign JC[7:4] = 4'bzzzz;
    
    clk_divider u0 (.clk(clk), .slow_clk(slow_clk));
    scan_signal_gen u1 (.clk(slow_clk), .col(col));
    keypad_to_HEX_encoder u2 (.clk(slow_clk), .row(row), .col(col), .scan_value(scan_value), .scan_valid(valid));
    no_press_detector u3 (.clk(slow_clk), .data_in(scan_value), .valid_in(valid), .data_out(hex));
    HEX_to_7seg_decoder u4 (.hex(hex), .seg(SEG));
    
    ctrl_7seg u5 (.clk(clk), .digit0(SEG), .digit1(7'b0111111), .digit2(7'b0111111), .digit3(7'b0111111), .seg(seg), .an(an));
endmodule
