`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 15:25:10
// Design Name: 
// Module Name: cnt_2bit
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


module cnt_2bit(
input clk, rst_n,
input inc,
output reg [1:0] cnt
    );
    // States
    localparam [1:0]
        S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3;
        
    reg [1:0] current_state = S0;
    reg [1:0] next_state;
    
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
            S0: cnt = S0;
            S1: cnt = S1;
            S2: cnt = S2;
            S3: cnt = S3;
            default cnt = S0;
       endcase
    end
    
    // Moore Machine, Next State
    always @(*) begin
        case (current_state)
            S0: next_state = inc ? S1 : S0;
            S1: next_state = inc ? S2 : S1;
            S2: next_state = inc ? S3 : S2;
            S3: next_state = inc ? S0 : S3;
            default: next_state = S0;
        endcase
    end
endmodule
