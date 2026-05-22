`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 15:01:37
// Design Name: 
// Module Name: ring_cnt_tb
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


module ring_cnt_tb;
reg clk, rst_n;
reg btn;
wire [7:0] Q;

    ring_cnt u0(.clk(clk), .rst_n(rst_n), .btn(btn), .Q(Q));
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        rst_n = 0; btn = 0; #30;
        rst_n = 1;
        #20 btn = 1; #20 btn = 0;
        #17 btn = 1; #15 btn = 0;
        #23 btn = 1; #12 btn = 0;
        #11 btn = 1; #30 btn = 0;
        #19 btn = 1; #20 btn = 0;
        #100;
        $finish;
    end
endmodule
