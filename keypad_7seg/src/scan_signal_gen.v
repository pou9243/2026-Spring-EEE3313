`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/18 22:27:53
// Design Name: 
// Module Name: scan_signal_gen
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


module scan_signal_gen(
input clk,
output reg[3:0] col
    );
    
    reg[2:0] col_idx = 3'd0;
    
    always @(posedge clk) begin
        case(col_idx)
        3'd0: col <= 4'b0111;
        3'd1: col <= 4'b1011;
        3'd2: col <= 4'b1101;
        3'd3: col <= 4'b1110;
        endcase
        
        if (col_idx >= 3'd3) begin
            col_idx <= 3'd0;
        end
        else begin
            col_idx <= col_idx + 3'd1;
        end
    end
endmodule
