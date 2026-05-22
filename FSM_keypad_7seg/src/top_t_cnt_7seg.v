`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 19:04:03
// Design Name: 
// Module Name: top_t_cnt_7seg
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


module top_t_cnt_7seg(
input clk,  // 100 MHz
output [6:0] seg
    );
    wire slow_clk;
    wire [3:0] BCD;
    wire [6:0] SEG;
    
    clk_divider #(.TGT_CNT(50000000)) u0 (.clk(clk), .slow_clk(slow_clk));
    t_cnt_to_BCD u1 (.clk(slow_clk), .BCD(BCD));
    BCD_to_7seg_decoder u2 (.BCD(BCD), .seg(SEG));
    
    assign seg = ~SEG;
endmodule
