`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 16:53:49
// Design Name: 
// Module Name: keypad_to_HEX_4cycle
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


module keypad_to_HEX_4cycle(
input clk,
input [3:0] row,
input [3:0] col,
output reg [3:0] HEX
    );
    // clk divider
    reg[31:0] cnt = 0;
    reg slow_clk = 1'b0;
    always @(posedge clk) begin
        if (cnt == 100000 - 1) begin
            cnt <= 0;
            slow_clk <= ~slow_clk;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
    
    // Keypad to HEX encoder
    reg [3:0] key_value;
    always @(*) begin
        key_value <= 4'h0;
        case({row, col})
            8'b0111_0111: key_value <= 4'h1;
            8'b0111_1011: key_value <= 4'h2;
            8'b0111_1101: key_value <= 4'h3;
            8'b0111_1110: key_value <= 4'hA;

            8'b1011_0111: key_value <= 4'h4;
            8'b1011_1011: key_value <= 4'h5;
            8'b1011_1101: key_value <= 4'h6;
            8'b1011_1110: key_value <= 4'hB;

            8'b1101_0111: key_value <= 4'h7;
            8'b1101_1011: key_value <= 4'h8;
            8'b1101_1101: key_value <= 4'h9;
            8'b1101_1110: key_value <= 4'hC;

            8'b1110_0111: key_value <= 4'h0;
            8'b1110_1011: key_value <= 4'hF;
            8'b1110_1101: key_value <= 4'hE;
            8'b1110_1110: key_value <= 4'hD;
        endcase
    end
    
    // States
    localparam [1:0] S_COL0 = 2'd0, S_COL1 = 2'd1, S_COL2 = 2'd2, S_COL3 = 2'd3;
    
    reg [1:0] state = S_COL0;
    
    // State transition & output
    reg [3:0] pending_value = 4'h0;
    always @(posedge slow_clk) begin
        case (state)
            S_COL0: begin
                if (row != 4'b1111)
                    pending_value <= key_value;
                state <= S_COL1;
            end
            S_COL1: begin
                if (row != 4'b1111)
                    pending_value <= key_value;
                state <= S_COL2;
            end
            S_COL2: begin
                if (row != 4'b1111)
                    pending_value <= key_value;
                state <= S_COL3;
            end
            S_COL3: begin
                if (row != 4'b1111)
                    HEX <= key_value;
                else
                    HEX <= pending_value;
                pending_value <= 4'h0;
                state <= S_COL0;
            end
            default: begin
                HEX <= 4'h0;
                pending_value <= 4'h0;
                state <= S_COL0;
            end
        endcase
    end
endmodule
