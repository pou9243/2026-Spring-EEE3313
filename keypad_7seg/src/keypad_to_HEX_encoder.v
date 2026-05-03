`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/18 21:13:29
// Design Name: 
// Module Name: keypad_scan
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
output reg[3:0] scan_value,
output reg scan_valid
    );
    
    reg scan_pulse;
    always @(posedge clk) begin
        scan_pulse <= 1'b1;
        case({row, col})
            8'b1000_1000: scan_value <= 4'd1;
            8'b1000_0100: scan_value <= 4'd2;
            8'b1000_0010: scan_value <= 4'd3;
            8'b1000_0001: scan_value <= 4'd10;
                          
            8'b0100_1000: scan_value <= 4'd4;
            8'b0100_0100: scan_value <= 4'd5;
            8'b0100_0010: scan_value <= 4'd6;
            8'b0100_0001: scan_value <= 4'd11;
                          
            8'b0010_1000: scan_value <= 4'd7;
            8'b0010_0100: scan_value <= 4'd8;
            8'b0010_0010: scan_value <= 4'd9;
            8'b0010_0001: scan_value <= 4'd12;
                          
            8'b0001_1000: scan_value <= 4'd14;
            8'b0001_0100: scan_value <= 4'd0;
            8'b0001_0010: scan_value <= 4'd15;
            8'b0001_0001: scan_value <= 4'd13;
            default: begin scan_value <= scan_value; scan_pulse <= 1'b0; end
        endcase
    end
    
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
                    scan_valid <= 1;
                end else begin
                    scan_valid <= 0;
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
                        scan_valid <= 0;
                        state <= IDLE;
                    end else begin
                        release_cnt <= release_cnt + 2'd1;
                    end
                end
            end
        endcase
    end
endmodule
