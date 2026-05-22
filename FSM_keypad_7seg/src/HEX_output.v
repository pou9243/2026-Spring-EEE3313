`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 19:56:14
// Design Name: 
// Module Name: HEX_output
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


module HEX_output(
input clk,
input valid,
input [3:0] HEX,
output reg [3:0] state
    );    
    // States
    localparam [3:0] S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, 
                     S4 = 4'd4, S5 = 4'd5, S6 = 4'd6, S7 = 4'd7,
                     S8 = 4'd8, S9 = 4'd9, S10 = 4'd10, S11 = 4'd11,
                     S12 = 4'd12, S13 = 4'd13, S14 = 4'd14, S15 = 4'd15;
    
    // State transition
    always @(posedge clk) begin
        state <= S0;
        if (valid) begin
            case(HEX)
                4'h0: state <= S0;
                4'h1: state <= S1;
                4'h2: state <= S2;
                4'h3: state <= S3;
                4'h4: state <= S4;
                4'h5: state <= S5;
                4'h6: state <= S6;
                4'h7: state <= S7;
                4'h8: state <= S8;
                4'h9: state <= S9;
                4'hA: state <= S10;
                4'hB: state <= S11;
                4'hC: state <= S12;
                4'hD: state <= S13;
                4'hE: state <= S14;
                4'hF: state <= S15;
                default: state <= S0;
            endcase
        end
    end
endmodule
