`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/05/22 20:04:46
// Design Name: 
// Module Name: HEX_to_7seg_decoder
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
            4'h0: seg = 7'b0111111;
            4'h1: seg = 7'b0000110;
            4'h2: seg = 7'b1011011;
            4'h3: seg = 7'b1001111;
            4'h4: seg = 7'b1100110;
            4'h5: seg = 7'b1101101;
            4'h6: seg = 7'b1111101;
            4'h7: seg = 7'b0100111;
            4'h8: seg = 7'b1111111;
            4'h9: seg = 7'b1101111;
            4'hA: seg = 7'b1110111;  // A
            4'hB: seg = 7'b1111100;  // b
            4'hC: seg = 7'b0111001;  // C
            4'hD: seg = 7'b1011110;  // d
            4'hE: seg = 7'b1111001;  // E
            4'hF: seg = 7'b1110001;  // F
            default: seg = 7'b0111111;
        endcase
    end
endmodule
