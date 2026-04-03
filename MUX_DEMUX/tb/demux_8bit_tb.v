`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/21 15:02:19
// Design Name: 
// Module Name: demux_8bit_tb
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


module demux_8bit_tb;
reg I;
reg[2:0] S;
wire[7:0] O;

DEMUX_8bit demux8b0(.I(I), .S(S), .O(O));

initial begin
$monitor("S = %b | I = %b -> O[0] = %b | O[1] = %b | O[2] = %b | O[3] = %b | O[4] = %b | O[5] = %b | O[6] = %b | O[7] = %b", S, I, O[0], O[1], O[2], O[3], O[4], O[5], O[6], O[7]);
I = 0; S = 3'b000; #10;
I = 0; S = 3'b001; #10;
I = 0; S = 3'b010; #10;
I = 0; S = 3'b011; #10;
I = 0; S = 3'b100; #10;
I = 0; S = 3'b101; #10;
I = 0; S = 3'b110; #10;
I = 0; S = 3'b111; #10;
I = 1; S = 3'b000; #10;
I = 1; S = 3'b001; #10;
I = 1; S = 3'b010; #10;
I = 1; S = 3'b011; #10;
I = 1; S = 3'b100; #10;
I = 1; S = 3'b101; #10;
I = 1; S = 3'b110; #10;
I = 1; S = 3'b111; #10;
$finish;
end
endmodule
