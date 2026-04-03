`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/03 11:11:39
// Design Name: 
// Module Name: MUX_4bit
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


module MUX_4bit(
input[3:0] D0, D1, D2, D3,
input[1:0] S,
output reg[3:0] Q
    );
    always @(*) begin
    case (S)
    2'b00: Q = D0; 2'b01: Q = D1;
    2'b10: Q = D2; 2'b11: Q = D3;
    endcase
    end
endmodule
