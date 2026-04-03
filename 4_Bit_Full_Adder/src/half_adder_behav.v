`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/13 10:54:28
// Design Name: 
// Module Name: half_adder_behav
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


module half_adder_behav(
input A, B,
output reg S, C
    );
    
    always @ (A, B) begin
    case ({A, B})
    2'b00: begin S = 0; C = 0; end
    2'b01: begin S =1; C = 0; end
    2'b10: begin S = 1; C = 0; end
    2'b11: begin S = 0; C = 1; end
    endcase
    end 
endmodule
