`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 17:30:15
// Design Name: 
// Module Name: top_ring_cnt_pulse
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


module top_ring_cnt_pulse(
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
    
    wire slow_clk;
    wire valid;
    wire [7:0] led;
    wire [3:0] HEX;
    
    clk_divider u0 (.clk(clk), .slow_clk(slow_clk));
    scan_signal_gen_noclkdiv u1 (.clk(slow_clk), .col(col));
    keypad_to_HEX_encoder u2 (.clk(slow_clk), .row(row), .col(col), .HEX(HEX), .valid(valid));
    ring_cnt_to_led_pulse u3 (.clk(slow_clk), .HEX(HEX), .valid(valid), .led(led));
    
    assign JB = ~led;
endmodule