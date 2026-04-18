`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/18 21:41:11
// Design Name: 
// Module Name: debouncer_hold
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


module debouncer_hold(
input clk,
input[3:0] data_in,
input valid_in, // not used in this module.
output reg[3:0] data_out
    );
    
    always @(posedge clk) begin
        data_out <= data_in;
    end
endmodule
