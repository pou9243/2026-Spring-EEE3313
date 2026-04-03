`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/26 14:40:22
// Design Name: 
// Module Name: decoder_1to2_tb
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


module decoder_1to2_tb;
reg E, A;
wire Y0, Y1;

decoder_1to2 uut(.E(E), .A(A), .Y0(Y0), .Y1(Y1));

initial begin
$display("E  A  |  Y0  Y1");
$display("---------------");
$monitor("%b  %b  |  %b  %b", E, A, Y0, Y1);
E = 0; A = 0; #10;
A = 1; #10
E = 1; A = 0; #10;
A = 1; #10;
$finish;
end
endmodule
