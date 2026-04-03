`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/26 15:21:34
// Design Name: 
// Module Name: encoder_4to2_tb
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


module encoder_4to2_tb;
reg D0, D1, D2, D3;
wire A, B;

encoder_4to2 uut(.D0(D0), .D1(D1), .D2(D2), .D3(D3), .A(A), .B(B));

initial begin
$display("D3  D2  D1  D0  |  A  B");
$display("-----------------------");
$monitor("%b  %b  %b  %b  |  %b  %b", D3, D2, D1, D0, A, B);
D3 = 0;  D2 = 0;  D1 = 0; D0 = 1; #10;
D3 = 0;  D2 = 0;  D1 = 1; D0 = 0; #10;
D3 = 0;  D2 = 1;  D1 = 0; D0 = 0; #10;
D3 = 1;  D2 = 0;  D1 = 0; D0 = 0; #10;
$finish;
end
endmodule
