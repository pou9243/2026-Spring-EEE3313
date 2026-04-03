`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/26 15:07:50
// Design Name: 
// Module Name: encoder_2to1_tb
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


module encoder_2to1_tb;
reg D0, D1;
wire X;

encoder_2to1 uut(.D0(D0), .D1(D1), .X(X));

initial begin
$display("D1  D0  |  X");
$display("------------");
$monitor("%b  %b  |  %b", D1, D0, X);
D1 = 0; D0 = 1; #10;
D1 = 1; D0 = 0; #10;
$finish;
end
endmodule
