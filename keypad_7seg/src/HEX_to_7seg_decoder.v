`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/18 23:24:14
// Design Name: 
// Module Name: num_to_7seg
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


module HEX_to_7seg_decoder(
input[3:0] hex,
output reg[6:0] seg
    );
    always @(*) begin
        case(hex)
            4'd0: seg = 7'b0111111;
            4'd1: seg = 7'b0000110;
            4'd2: seg = 7'b1011011;
            4'd3: seg = 7'b1001111;
            4'd4: seg = 7'b1100110;
            4'd5: seg = 7'b1101101;
            4'd6: seg = 7'b1111101;
            4'd7: seg = 7'b0100111;
            4'd8: seg = 7'b1111111;
            4'd9: seg = 7'b1101111;
            4'd10: seg = 7'b1110111;  // A
            4'd11: seg = 7'b1111100;  // b
            4'd12: seg = 7'b0111001;  // C
            4'd13: seg = 7'b1011110;  // d
            4'd14: seg = 7'b1111001;  // E
            4'd15: seg = 7'b1110001;  // F
            default: seg = 7'b0111111;
        endcase
    end
endmodule
