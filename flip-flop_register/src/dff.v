`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/24 15:20:29
// Design Name: 
// Module Name: dff
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


module dff(
input clk,
input clr,
input D,
output reg Q,
output Qbar
    );
    always @(posedge clk or posedge clr) begin
        if (clr)
            Q <= 1'b0;
        else
            Q <= D;
    end
    
    assign Qbar = ~Q;
endmodule
