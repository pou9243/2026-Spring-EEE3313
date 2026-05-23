`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/23 13:32:23
// Design Name: 
// Module Name: btn_sync
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


module btn_sync(
input clk,
input btn,
output reg btn_sync
    );
    // Rising edge detector & 1-clk pulse generator
    reg btn_prev;
    always @(posedge clk) begin
        btn_prev <= btn;
        btn_sync <= 1'b0;
        if (btn && !btn_prev)
            btn_sync <= 1'b1;
    end
endmodule
