`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 17:12:04
// Design Name: 
// Module Name: ring_cnt_to_led
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


module ring_cnt_to_led(
input clk,
input [3:0] HEX,
output reg [7:0] led
    );
    // clk divider
    reg[31:0] cnt = 0;
    reg slow_clk = 0;
    always @(posedge clk) begin
        if (cnt == 10000000 - 1) begin
            cnt <= 0;
            slow_clk <= ~slow_clk;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
    
    // Input
    wire button;
    assign button = (HEX == 4'hC);
    
    // States
    localparam [2:0] S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, 
                     S4 = 3'd4, S5 = 3'd5, S6 = 3'd6, S7 = 3'd7;

    reg [2:0] state = S0;
    
    // State transition
    always @(posedge slow_clk) begin
        if (button) begin
            case(state)
                S0: state <= S1;
                S1: state <= S2;
                S2: state <= S3;
                S3: state <= S4;
                S4: state <= S5;
                S5: state <= S6;
                S6: state <= S7;
                S7: state <= S0;
                default: state <= S0;
            endcase
        end
    end
    
    // Moore Machine, Output
    always @(*) begin     
        case(state)
            S0: led <= 8'b00000001;
            S1: led <= 8'b00000010;
            S2: led <= 8'b00000100;
            S3: led <= 8'b00001000;
            S4: led <= 8'b00010000;
            S5: led <= 8'b00100000;
            S6: led <= 8'b01000000;
            S7: led <= 8'b10000000;
            default: led <= 8'b00000001;
        endcase
    end
endmodule
