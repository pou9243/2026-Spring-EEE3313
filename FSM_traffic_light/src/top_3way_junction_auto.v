`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/23 16:11:59
// Design Name: 
// Module Name: top_3way_junction_auto
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


module top_3way_junction_auto(
input clk,  // 100 MHz
output [7:0] JA, // JA[2:0]: car straight, JA[5:4]: ped
output [7:0] JB  // JB[2:0]: car left turn
    );
    clk_divider #(.TGT_CNT(50000000)) u0 (.clk(clk), .slow_clk(slow_clk));  // 1 Hz slow_clk
    traffic_ctrl_3way_auto u1 (.clk(slow_clk), .str(JA[2:0]), .left(JB[2:0]), .ped(JA[5:4]));
endmodule
