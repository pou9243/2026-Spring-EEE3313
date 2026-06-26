`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 20:24:52
// Design Name: 
// Module Name: top_added_output
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


module top_added_output(
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
    wire[3:0] hex_tens;
    wire[3:0] hex_ones;
    wire[6:0] seg_tens;
    wire[6:0] seg_ones;
    
    assign JC[3:0] = col;
    assign JC[7:4] = 4'bzzzz;
    
    clk_divider u0 (.clk(clk), .slow_clk(slow_clk));
    scan_signal_gen u1 (.clk(slow_clk), .col(col));
    keypad_to_HEX_encoder u2 (.clk(slow_clk), .col(col), .row(row), .scan_value(scan_value), .scan_valid(valid));
    debouncer u3 (.clk(slow_clk), .data_in(scan_value), .valid_in(valid), .data_out(stable_value), .out_pulse(pulse));
    added_output u4 (.clk(slow_clk), .data_in(stable_value), .in_pulse(pulse), .tens(hex_tens), .ones(hex_ones));
    
    HEX_to_7seg_decoder u5 (.hex(hex_tens), .seg(seg_tens));
    HEX_to_7seg_decoder u6 (.hex(hex_ones), .seg(seg_ones));
    
    ctrl_7seg u7 (.clk(clk), .digit0(seg_ones), .digit1(seg_tens), .digit2(7'b0111111), .digit3(7'b0111111), .seg(seg), .an(an));
endmodule
