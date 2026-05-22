`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 15:29:03
// Design Name: 
// Module Name: cnt_2bit_tb
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


module cnt_2bit_tb;
reg clk, rst_n;
reg inc;
wire [1:0] cnt;

    cnt_2bit u0(.clk(clk), .rst_n(rst_n), .inc(inc), .cnt(cnt));
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        rst_n = 0; inc = 0; #20;
        rst_n = 1;
        #10 inc = 1;
        #40 inc = 0;
        #30 inc = 1;
        #20 rst_n = 0;
        #10
        $finish;
    end
endmodule