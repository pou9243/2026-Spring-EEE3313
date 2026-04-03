`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/03 14:14:33
// Design Name: 
// Module Name: decoder_3to8
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


module decoder_3to8(
input[2:0] A,
output reg Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
    );
    always @(*) begin
    case (A)
    3'b000: {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b10000000;
    3'b001: {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b01000000;
    3'b010: {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00100000;
    3'b011: {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00010000;
    3'b100: {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00001000;
    3'b101: {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00000100;
    3'b110: {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00000010;
    3'b111: {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00000001;
    default: {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = 8'b00000000;
    endcase
    end
endmodule
