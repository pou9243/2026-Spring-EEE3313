`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/27 11:19:38
// Design Name: 
// Module Name: encoder_BCD_tb
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


module encoder_BCD_tb;
reg D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
wire Y0, Y1, Y2, Y3;

encoder_BCD uut(.D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4), .D5(D5), .D6(D6), .D7(D7), .D8(D8), .D9(D9), .Y0(Y0), .Y1(Y1), .Y2(Y2), .Y3(Y3));

initial begin
$display("D9  D8  D7  D6  D5  D4  D3  D2  D1  D0  |  Y3  Y2  Y1  Y0");
$display("---------------------------------------------------------");
$monitor("%b  %b  %b  %b  %b  %b  %b  %b  %b  %b  |  %b  %b  %b  %b", D9, D8, D7, D6, D5, D4, D3, D2, D1, D0, Y3, Y2, Y1, Y0);
D9 = 0;  D8 = 0;  D7 = 0;  D6 = 0;  D5 = 0;  D4 = 0;  D3 = 0;  D2 = 0;  D1 = 0; D0 = 1; #10;
D9 = 0;  D8 = 0;  D7 = 0;  D6 = 0;  D5 = 0;  D4 = 0;  D3 = 0;  D2 = 0;  D1 = 1; D0 = 0; #10;
D9 = 0;  D8 = 0;  D7 = 0;  D6 = 0;  D5 = 0;  D4 = 0;  D3 = 0;  D2 = 1;  D1 = 0; D0 = 0; #10;
D9 = 0;  D8 = 0;  D7 = 0;  D6 = 0;  D5 = 0;  D4 = 0;  D3 = 1;  D2 = 0;  D1 = 0; D0 = 0; #10;
D9 = 0;  D8 = 0;  D7 = 0;  D6 = 0;  D5 = 0;  D4 = 1;  D3 = 0;  D2 = 0;  D1 = 0; D0 = 0; #10;
D9 = 0;  D8 = 0;  D7 = 0;  D6 = 0;  D5 = 1;  D4 = 0;  D3 = 0;  D2 = 0;  D1 = 0; D0 = 0; #10;
D9 = 0;  D8 = 0;  D7 = 0;  D6 = 1;  D5 = 0;  D4 = 0;  D3 = 0;  D2 = 0;  D1 = 0; D0 = 0; #10;
D9 = 0;  D8 = 0;  D7 = 1;  D6 = 0;  D5 = 0;  D4 = 0;  D3 = 0;  D2 = 0;  D1 = 0; D0 = 0; #10;
D9 = 0;  D8 = 1;  D7 = 0;  D6 = 0;  D5 = 0;  D4 = 0;  D3 = 0;  D2 = 0;  D1 = 0; D0 = 0; #10;
D9 = 1;  D8 = 0;  D7 = 0;  D6 = 0;  D5 = 0;  D4 = 0;  D3 = 0;  D2 = 0;  D1 = 0; D0 = 0; #10;
$finish;
end
endmodule
