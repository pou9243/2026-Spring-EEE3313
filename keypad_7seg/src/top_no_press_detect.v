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
input sysclk,
inout[7:0] jb,
output[6:0] ar
    );
    
    wire slow_clk;
    wire valid;
    wire[3:0] col;
    wire[3:0] row = jb[7:4];
    wire[3:0] scan_value;
    wire[3:0] num;
    wire[6:0] seg;
    
    assign jb[3:0] = col;
    assign jb[7:4] = 4'bzzzz;
    
    clk_divider u0(.clk(sysclk), .slow_clk(slow_clk));
    scan_signal_gen u1(.clk(slow_clk), .col(col));
    keypad_scan u2(.clk(slow_clk), .row(row), .col(col), .scan_value(scan_value), .scan_valid(valid));
    debouncer_no_press_detect u3(.clk(slow_clk), .data_in(scan_value), .valid_in(valid), .data_out(num));
    num_to_7seg u4(.num(num), .seg(seg));
    
    assign ar = ~seg;
endmodule
