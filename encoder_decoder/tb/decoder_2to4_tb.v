`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/26 14:59:08
// Design Name: 
// Module Name: decoder_2to4_tb
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


module decoder_2to4_tb;
reg E, A0, A1;
wire Y0, Y1, Y2, Y3;

decoder_2to4 uut(.E(E), .A0(A0), .A1(A1), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3));

initial begin
$display("E  A1  A0  |  Y0  Y1  Y2  Y3");
$display("----------------------------");
$monitor("%b  %b  %b  |  %b  %b  %b  %b", E, A1, A0, Y0, Y1, Y2, Y3);
E = 0; A1 = 0; A0 = 0; #10;
E = 0; A1 = 0; A0 = 1; #10;
E = 0; A1 = 1; A0 = 0; #10;
E = 0; A1 = 1; A0 = 1; #10;
E = 1; A1 = 0; A0 = 0; #10;
E = 1; A1 = 0; A0 = 1; #10;
E = 1; A1 = 1; A0 = 0; #10;
E = 1; A1 = 1; A0 = 1; #10;
$finish;
end
endmodule
