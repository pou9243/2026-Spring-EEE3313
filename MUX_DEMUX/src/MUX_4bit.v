`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 10:30:35
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
input[3:0] D,
input[1:0] S,
output reg Q
    );
    
    always @(*) begin
    case (S)
    2'b00: Q = D[0];
    2'b01: Q = D[1];
    2'b10: Q = D[2];
    2'b11: Q = D[3];
    default: Q = 0;
    endcase
    end
endmodule
