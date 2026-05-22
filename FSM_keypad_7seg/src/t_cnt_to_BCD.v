`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 19:24:44
// Design Name: 
// Module Name: t_cnt_to_BCD
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


module t_cnt_to_BCD(
input clk,
output reg [3:0] BCD
    );
    // States
    localparam [3:0] S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, 
                     S4 = 4'd4, S5 = 4'd5, S6 = 4'd6, S7 = 4'd7,
                     S8 = 4'd8, S9 = 4'd9;

    reg [3:0] state = S0;
    
    // State transition
    always @(posedge clk) begin
        case(state)
            S0: state <= S1;
            S1: state <= S2;
            S2: state <= S3;
            S3: state <= S4;
            S4: state <= S5;
            S5: state <= S6;
            S6: state <= S7;
            S7: state <= S8;
            S8: state <= S9;
            S9: state <= S0;
            default: state <= S0;
        endcase
    end
    
    // Moore Machine, Output
    always @(*) begin     
        case(state)
            S0: BCD <= 4'd0;
            S1: BCD <= 4'd1;
            S2: BCD <= 4'd2;
            S3: BCD <= 4'd3;
            S4: BCD <= 4'd4;
            S5: BCD <= 4'd5;
            S6: BCD <= 4'd6;
            S7: BCD <= 4'd7;
            S8: BCD <= 4'd8;
            S9: BCD <= 4'd9;
            default: BCD <= 4'd0;
        endcase
    end
endmodule
