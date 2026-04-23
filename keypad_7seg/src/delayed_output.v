`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/23 22:54:35
// Design Name: 
// Module Name: delayed_output
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


module delayed_output(
input clk,
input[3:0] data_in,
input in_pulse,
output reg[3:0] data_out
    );
    reg[3:0] prev_value = 4'd0;
    
    always @(posedge clk) begin
        if (in_pulse) begin
            data_out <= prev_value;
            prev_value <= data_in;
        end
    end
endmodule
