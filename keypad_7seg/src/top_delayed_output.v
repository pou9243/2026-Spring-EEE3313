`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/23 22:59:29
// Design Name: 
// Module Name: top_delayed_output
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


module top_delayed_output(
input clk,
inout [7:0] JC,
output [6:0] seg,
output [3:0] an
    );
    wire slow_clk;
    wire valid;
    wire pulse;
    wire[3:0] col;
    wire[3:0] row = JC[7:4];
    wire[3:0] scan_value;
    wire[3:0] stable_value;
    wire[3:0] hex;
    wire[6:0] SEG;
    
    assign JC[3:0] = col;
    assign JC[7:4] = 4'bzzzz;
    
    clk_divider u0 (.clk(clk), .slow_clk(slow_clk));
    scan_signal_gen u1 (.clk(slow_clk), .col(col));
    keypad_to_HEX_encoder u2 (.clk(slow_clk), .col(col), .row(row), .scan_value(scan_value), .scan_valid(valid));
    debouncer u3 (.clk(slow_clk), .data_in(scan_value), .valid_in(valid), .data_out(stable_value), .out_pulse(pulse));
    delayed_output u4 (.clk(slow_clk), .data_in(stable_value), .in_pulse(pulse), .data_out(hex));
    
    HEX_to_7seg_decoder u5 (.hex(hex), .seg(SEG));
    
    ctrl_7seg u6 (.clk(clk), .digit0(SEG), .digit1(7'b0111111), .digit2(7'b0111111), .digit3(7'b0111111), .seg(seg), .an(an));
endmodule
