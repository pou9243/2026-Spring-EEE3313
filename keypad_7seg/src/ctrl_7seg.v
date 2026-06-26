`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2026 04:40:08 PM
// Design Name: 
// Module Name: ctrl_7seg
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


module ctrl_7seg(
input clk,  // 100 MHz
input [6:0] digit0,
input [6:0] digit1,
input [6:0] digit2,
input [6:0] digit3,
output reg [6:0] seg,
output reg [3:0] an
    );
    // clk divider
    wire slow_clk;
    clk_divider #(.TGT_CNT(125000)) u0 (.clk(clk), .slow_clk(slow_clk));
    
    // an_idx counter
    reg [1:0] an_idx = 2'b00;
    always @(posedge slow_clk) begin
        if (an_idx >= 2'b11) begin
            an_idx <= 2'b00;
        end else begin
            an_idx <= an_idx + 2'd1;
        end
    end
    
    // seg output
    always @(*) begin
        case (an_idx)
            2'b00: begin
                an = 4'b1110;
                seg = ~digit0;
            end
            2'b01: begin
                an = 4'b1101;
                seg = ~digit1;
            end
            2'b10: begin
                an = 4'b1011;
                seg = ~digit2;
            end
            2'b11: begin
                an = 4'b0111;
                seg = ~digit3;
            end
        endcase
    end
endmodule
