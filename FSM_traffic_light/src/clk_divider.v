`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/23 13:30:44
// Design Name: 
// Module Name: clk_divider
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


module clk_divider #(
parameter [31:0] TGT_CNT = 10000
)
(
input clk,
output slow_clk
    );
    reg[31:0] cnt = 0;
    reg slow_clk_reg = 1'b0;
    
    always @(posedge clk) begin
        if (cnt == TGT_CNT - 1) begin
            cnt <= 0;
            slow_clk_reg <= ~slow_clk_reg;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
    
    assign slow_clk = slow_clk_reg;
endmodule
