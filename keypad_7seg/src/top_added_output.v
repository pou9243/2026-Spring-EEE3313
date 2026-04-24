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
input sysclk,
inout[7:0] jb,
output[13:0] ar
    );
    wire slow_clk;
    wire valid;
    wire pulse;
    wire[3:0] col;
    wire[3:0] row = jb[7:4];
    wire[3:0] scan_value;
    wire[3:0] stable_value;
    wire[3:0] hex_tens;
    wire[3:0] hex_ones;
    wire[6:0] seg_tens;
    wire[6:0] seg_ones;
    
    assign jb[3:0] = col;
    assign jb[7:4] = 4'bzzzz;
    
    clk_divider u0 (.clk(sysclk), .slow_clk(slow_clk));
    scan_signal_gen u1 (.clk(slow_clk), .col(col));
    keypad_to_HEX_encoder u2(.clk(slow_clk), .col(col), .row(row), .scan_value(scan_value), .scan_valid(valid));
    debouncer u3(.clk(slow_clk), .data_in(scan_value), .valid_in(valid), .data_out(stable_value), .out_pulse(pulse));
    added_output u4(.clk(slow_clk), .data_in(stable_value), .in_pulse(pulse), .tens(hex_tens), .ones(hex_ones));
    
    HEX_to_7seg_decoder u5 (.hex(hex_tens), .seg(seg_tens));
    HEX_to_7seg_decoder u6 (.hex(hex_ones), .seg(seg_ones));
    
    assign ar[6:0] = ~seg_ones;
    assign ar[13:7] = ~seg_tens;
endmodule
