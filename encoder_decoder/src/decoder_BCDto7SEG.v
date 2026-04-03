`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/27 14:14:48
// Design Name: 
// Module Name: decoder_BCDto7SEG
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


module decoder_BCDto7SEG(
input[3:0] BCD,
output reg[6:0] SEG
    );
    always @(*) begin
    SEG = 7'b0000000;
    case (BCD)
    4'd0: SEG = 7'b0111111;
    4'd1: SEG = 7'b0000110;
    4'd2: SEG = 7'b1011011;
    4'd3: SEG = 7'b1001111;
    4'd4: SEG = 7'b1100110;
    4'd5: SEG = 7'b1101101;
    4'd6: SEG = 7'b1111101;
    4'd7: SEG = 7'b0000111;
    4'd8: SEG = 7'b1111111;
    4'd9: SEG = 7'b1101111;
    endcase
    end
endmodule
