`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/27 10:20:21
// Design Name: 
// Module Name: decoder_3to8_tb
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


module decoder_3to8_tb;
reg E, A0, A1, A2;
wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

decoder_3to8 uut(.E(E), .A0(A0), .A1(A1), .A2(A2), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3), .Y4(Y4), .Y5(Y5), .Y6(Y6), .Y7(Y7));

initial begin
$display("E  A2  A1  A0  |  Y0  Y1  Y2  Y3  Y4  Y5  Y6  Y7");
$display("------------------------------------------------");
$monitor("%b  %b  %b  %b |  %b  %b  %b  %b  %b  %b  %b  %b", E, A2, A1, A0, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
E = 0; A2 = 0; A1 = 0; A0 = 0; #10;
E = 0; A2 = 0; A1 = 0; A0 = 1; #10;
E = 0; A2 = 0; A1 = 1; A0 = 0; #10;
E = 0; A2 = 0; A1 = 1; A0 = 1; #10;
E = 0; A2 = 1; A1 = 0; A0 = 0; #10;
E = 0; A2 = 1; A1 = 0; A0 = 1; #10;
E = 0; A2 = 1; A1 = 1; A0 = 0; #10;
E = 0; A2 = 1; A1 = 1; A0 = 1; #10;
E = 1; A2 = 0; A1 = 0; A0 = 0; #10;
E = 1; A2 = 0; A1 = 0; A0 = 1; #10;
E = 1; A2 = 0; A1 = 1; A0 = 0; #10;
E = 1; A2 = 0; A1 = 1; A0 = 1; #10;
E = 1; A2 = 1; A1 = 0; A0 = 0; #10;
E = 1; A2 = 1; A1 = 0; A0 = 1; #10;
E = 1; A2 = 1; A1 = 1; A0 = 0; #10;
E = 1; A2 = 1; A1 = 1; A0 = 1; #10;
$finish;
end
endmodule
