`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/20 11:12:47
// Design Name: 
// Module Name: demux_2bit_tb
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


module demux_2bit_tb;
reg I, S;
wire[1:0] O;

DEMUX_2bit demux2b0(.I(I), .S(S), .O(O));

initial begin
$monitor("S = %b | I = %b -> O[0] = %b | O[1] = %b", S, I, O[0], O[1]);
I = 0; S = 0; #10;
I = 0; S = 1; #10;
I = 1; S = 0; #10;
I = 1; S = 1; #10;
$finish;
end
endmodule
