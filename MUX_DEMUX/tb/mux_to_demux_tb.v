`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/22 14:29:38
// Design Name: 
// Module Name: mux_to_demux_tb
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


module mux_to_demux_tb;
reg[1:0] D;
reg S;
wire[1:0] O;

MUX_to_DEMUX uut(.D(D), .S(S), .O(O));

initial begin
$monitor("D[0] = %b D[1] = %b | S = %b  ->  O[0] = %b O[1] = %b", D[0], D[1], S, O[0], O[1]);
D = 2'b00; S = 0; #10;
S = 1; #10;
D = 2'b01; S = 0; #10;
S = 1; #10;
D = 2'b10; S = 0; #10;
S = 1; #10;
D = 2'b11; S = 0; #10;
S = 1; #10;
$finish;
end
endmodule
