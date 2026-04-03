`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/21 14:27:58
// Design Name: 
// Module Name: demux_4bit_tb
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


module demux_4bit_tb;
reg I;
reg[1:0] S;
wire[3:0] O;

DEMUX_4bit demux4b0(.I(I), .S(S), .O(O));

initial begin
$monitor("S = %b | I = %b -> O[0] = %b | O[1] = %b | O[2] = %b | O[3] = %b", S, I, O[0], O[1], O[2], O[3]);
I = 0; S = 2'b00; #10;
I = 0; S = 2'b01; #10;
I = 0; S = 2'b10; #10;
I = 0; S = 2'b11; #10;
I = 1; S = 2'b00; #10;
I = 1; S = 2'b01; #10;
I = 1; S = 2'b10; #10;
I = 1; S = 2'b11; #10;
$finish;
end
endmodule
