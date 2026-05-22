`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 17:33:53
// Design Name: 
// Module Name: keypad_to_HEX_encoder
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


module keypad_to_HEX_encoder(
input clk,
input[3:0] row,
input[3:0] col,
output reg[3:0] HEX,
output reg valid
    );
    // Keypad scanner with scan_pulse
    reg scan_pulse;
    always @(posedge clk) begin
        scan_pulse <= 1'b1;
        case({row, col})
            8'b0111_0111: HEX <= 4'h1;
            8'b0111_1011: HEX <= 4'h2;
            8'b0111_1101: HEX <= 4'h3;
            8'b0111_1110: HEX <= 4'hA;
                          
            8'b1011_0111: HEX <= 4'h4;
            8'b1011_1011: HEX <= 4'h5;
            8'b1011_1101: HEX <= 4'h6;
            8'b1011_1110: HEX <= 4'hB;
                          
            8'b1101_0111: HEX <= 4'h7;
            8'b1101_1011: HEX <= 4'h8;
            8'b1101_1101: HEX <= 4'h9;
            8'b1101_1110: HEX <= 4'hC;
                          
            8'b1110_0111: HEX <= 4'h0;
            8'b1110_1011: HEX <= 4'hF;
            8'b1110_1101: HEX <= 4'hE;
            8'b1110_1110: HEX <= 4'hD;
            default: begin HEX <= HEX; scan_pulse <= 1'b0; end
        endcase
    end
    
    // Valid signal logic
    localparam IDLE = 2'b00;
    localparam DETECTED = 2'b01;
    localparam RELEASE_WAIT = 2'b10;
    reg[1:0] release_cnt = 2'd0;
    reg[1:0] state = IDLE;
    always @(posedge clk) begin
        case (state)
            IDLE: begin
                if (scan_pulse) begin
                    state <= DETECTED;
                    valid <= 1;
                end else begin
                    valid <= 0;
                end
            end
            
            DETECTED: begin
                release_cnt <= 2'd0;
                state <= RELEASE_WAIT;
            end
            
            RELEASE_WAIT: begin
                if (scan_pulse) begin
                    release_cnt <= 2'd0;
                end else begin
                    if (release_cnt == 2'd3) begin
                        valid <= 0;
                        state <= IDLE;
                    end else begin
                        release_cnt <= release_cnt + 2'd1;
                    end
                end
            end
        endcase
    end
endmodule
