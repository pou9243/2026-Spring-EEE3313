`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 10:46:22
// Design Name: 
// Module Name: MUX_8bit
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


module MUX_8bit(
input[3:0] D0, D1, D2, D3, D4, D5, D6, D7,
input[2:0] S,
output reg[3:0] Q
    );
    always @(*) begin
    case (S)
    3'b000: Q = D0; 3'b001: Q = D1;
    3'b010: Q = D2; 3'b011: Q = D3;
    3'b100: Q = D4; 3'b101: Q = D5;
    3'b110: Q = D6; 3'b111: Q = D7;
    endcase
    end
endmodule
