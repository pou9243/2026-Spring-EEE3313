`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/23 14:26:37
// Design Name: 
// Module Name: top_btn_extend
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


module top_btn_extend(
input clk,  // 100 MHz
input btnC,
output [7:0] JA // JA[2:0]: car, JA[5:4]: ped
    );
    wire slow_clk;
    wire btn_sync;
    
    clk_divider #(.TGT_CNT(50000000)) u0 (.clk(clk), .slow_clk(slow_clk));  // 1 Hz slow_clk
    btn_sync u1 (.clk(slow_clk), .btn(btnC), .btn_sync(btn_sync));
    traffic_ctrl_extend u2 (.clk(slow_clk), .btn(btn_sync), .car(JA[2:0]), .ped(JA[5:4]));
endmodule
