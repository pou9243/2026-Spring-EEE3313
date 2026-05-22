`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 14:42:15
// Design Name: 
// Module Name: BCD_cnt_7seg
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


module BCD_cnt_7seg(
input clk, rst_n,
output reg [6:0] seg
    );
    // States
    localparam [3:0]
        S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, 
        S3 = 4'd3, S4 = 4'd4, S5 = 4'd5, 
        S6 = 4'd6, S7 = 4'd7, S8 = 4'd8, 
        S9 = 4'd9; 
        
    reg [3:0] current_state = S0;
    reg [3:0] next_state;
    
    // State Transistion with rst_n
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= S0;
        else
            current_state <= next_state;
    end
    
    // Moore Machine, Output
    always @(*) begin
        case (current_state)
            S0: seg = 7'b1111110;
            S1: seg = 7'b0110000;
            S2: seg = 7'b1101101;
            S3: seg = 7'b1111001;
            S4: seg = 7'b0110011;
            S5: seg = 7'b1011011;
            S6: seg = 7'b1011111;
            S7: seg = 7'b1110000;
            S8: seg = 7'b1111111;
            S9: seg = 7'b1111011;
            default seg = 7'b0000001;
        endcase
    end
    
    // Moore Machine, Next State
    always @(*) begin
        case (current_state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S5;
            S5: next_state = S6;
            S6: next_state = S7;
            S7: next_state = S8;
            S8: next_state = S9;
            S9: next_state = S0;
            default next_state = S0;
        endcase
    end
endmodule
