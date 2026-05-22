`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 14:53:37
// Design Name: 
// Module Name: ring_cnt
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


module ring_cnt(
input clk, rst_n,
input btn,
output reg [7:0] Q
    );
    reg btn_sync1, btn_sync2;  // Reg for edge detection
    reg btn_sync2_d; // Reg for Debouncing
    
    // Button press debouncing
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            btn_sync1 <= 1'b0;
            btn_sync2 <= 1'b0;
            btn_sync2_d <= 1'b0;
        end else begin
            btn_sync1 <= btn;
            btn_sync2 <= btn_sync1;
            btn_sync2_d <= btn_sync2;
        end
    end
    
    // Button press rising edge detection
    wire btn_rise = btn_sync2 & ~btn_sync2_d;
    
    // Ring counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            Q <= 8'b00000001;
        end else begin
            if (btn_rise)
                Q <= {Q[6:0], Q[7]}; // Q <= {Q[0], Q[7:1]};
        end
    end
endmodule