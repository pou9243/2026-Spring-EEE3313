`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 14:47:15
// Design Name: 
// Module Name: BCD_cnt_7seg_tb
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


module BCD_cnt_7seg_tb;
reg clk, rst_n;
wire [6:0] seg;

    BCD_cnt_7seg u0(.clk(clk), .rst_n(rst_n), .seg(seg));
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        rst_n = 0; #20;
        rst_n = 1; #200;
        $finish;
    end
    
    initial begin
        $monitor("%t ns | seg=%b", $time, seg);
    end
endmodule
