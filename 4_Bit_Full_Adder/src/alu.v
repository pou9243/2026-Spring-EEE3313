`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/12 20:12:05
// Design Name: 
// Module Name: alu
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


module alu(
input[1:0] opcode,
input[7:0] A,
input[7:0] B,
output reg [7:0] result
    );
    always @(*) begin
    case (opcode)
    2'b00: result = A + B;
    2'b01: result = A - B;
    2'b10: result = A / B;
    2'b11: result = A * B;
    endcase
    end
endmodule
